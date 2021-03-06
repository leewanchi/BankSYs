package com.teamone.service.impl;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.teamone.dao.CustomMapper;
import com.teamone.dao.Frozen_accountMapper;
import com.teamone.dto.AjaxResult;
import com.teamone.entity.Custom;
import com.teamone.entity.Frozen_account;
import com.teamone.sevice.ICustomService;
import com.teamone.utils.MD5Utils;

@Service("customLoginServiceImpl")
public class CustomLoginServiceImpl implements ICustomService{

	@Autowired
	private CustomMapper custommapper;
	@Autowired
	private Frozen_accountMapper frozen_acoountmapper;
	
	private AjaxResult loginReturn;
	private static final Integer FROST=0;//卡号冻结
	private static final Integer NORMAL=1;//卡号正常
	
	@Override
	public AjaxResult<String> CustomLogin(String cardId, String password) throws NoSuchAlgorithmException, UnsupportedEncodingException {
		// TODO Auto-generated method stub
		Custom custom = custommapper.selectByPrimaryKey(cardId);//查询用户
		System.out.println("custom===="+custom);
		//password = MD5Utils.encryptPassword(password);
		Frozen_account frozen = new Frozen_account();
		frozen.setFrozenId(cardId);	//将卡号ID存入错误次数对象中
		frozen.setFrozenDate(new java.sql.Date(System.currentTimeMillis()));//存入当前时间
		Frozen_account backfrozen = frozen_acoountmapper.selectFrozenByIdAndTime(frozen);//根据ID和时间查询登陆次数
		if(backfrozen==null&&custom!=null){
			custom.setStatus(NORMAL);			//修改卡号状态为正常
			custommapper.updateByPrimaryKey(custom);		//更新卡号信息在数据库		
			frozen_acoountmapper.deleteByPrimaryKey(cardId);//删除卡号在frozen中的数据
			//再进行密码验证
			if(password.equals(custom.getPassword())){
				loginReturn = new AjaxResult<String>("密码正确",true);
				return loginReturn;
				}
				frozen.setErrorCount(1);
				frozen_acoountmapper.insert(frozen);
				loginReturn = new AjaxResult<String>(false,"密码错误,您还有2次机会");
				return loginReturn;
		}else if(backfrozen!=null&&backfrozen.getErrorCount()<3&&custom!=null&&custom.getStatus()==NORMAL){
			if(password.equals(custom.getPassword())){
				frozen_acoountmapper.deleteByPrimaryKey(cardId);//密码正确删除错误次数
				loginReturn = new AjaxResult<String>("密码正确",true);
				return loginReturn;
			}		//密码验证
			int acoount = 2-backfrozen.getErrorCount();
			frozen.setErrorCount(backfrozen.getErrorCount()+1);
			frozen_acoountmapper.updateByPrimaryKey(frozen);
			if(frozen.getErrorCount()==3){		
				custom.setStatus(FROST);//修改卡号状态为冻结
				custommapper.updateByPrimaryKey(custom);//更新卡号信息在数据库
				loginReturn = new AjaxResult<String>(false, "密码错误3次,账户冻结");
				return loginReturn;
			}
			loginReturn = new AjaxResult<Integer>(false, "密码错误,您还有"+acoount+"机会");
			return loginReturn;
		}
		else{
			loginReturn = new AjaxResult<Integer>(false,"账号不存在或账号已冻结");
			return loginReturn;
		}
		
	}
	/*@Override
	public Custom checkAccount(String cardId) {
		
		return custommapper.selectByPrimaryKey(cardId);
	}*/
		//ID查卡 
		@Override
	public Custom selectCustomById(String cardId) {
		return custommapper.selectByPrimaryKey(cardId);
	}
	
		//卡号查个人信息
	public Custom queryCustom(String cardId) {
		return custommapper.selectByCardId(cardId);
	}	
}
