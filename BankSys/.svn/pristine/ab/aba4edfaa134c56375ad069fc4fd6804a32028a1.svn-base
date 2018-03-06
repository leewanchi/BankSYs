package com.teamone.service.impl;


import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.teamone.dao.Frozen_accountMapper;
import com.teamone.dao.UserMapper;
import com.teamone.dto.AjaxResult;
import com.teamone.entity.Frozen_account;
import com.teamone.entity.User;
import com.teamone.sevice.IUserService;
import com.teamone.utils.MD5Utils;

@Service("userLoginServiceImpl")
public class UserLoginServiceImpl implements IUserService {
	
	@Autowired
	private UserMapper usermapper;
	@Autowired
	private Frozen_accountMapper frozen_acoountmapper;

	private AjaxResult loginReturn;
	
	private MD5Utils md5utils;
	private static final Integer FROST=0;//柜员冻结
	private static final Integer NORMAL=1;//柜员正常
	
	@Override
	public AjaxResult<Integer> TellerLogin(String userName, String password) throws NoSuchAlgorithmException, UnsupportedEncodingException {
		// TODO Auto-generated method stub
		User user = usermapper.selectByuserName(userName);//查询用户
		password = md5utils.encryptPassword(password);
		Frozen_account frozen = new Frozen_account();
		frozen.setFrozenId(userName);	//将柜员ID存入错误次数对象中
		frozen.setFrozenDate(new java.sql.Date(System.currentTimeMillis()));//存入当前时间
		Frozen_account backfrozen = frozen_acoountmapper.selectFrozenByIdAndTime(frozen);//根据ID和时间查询登陆次数
		if(backfrozen==null&&user!=null){
			user.setStatus(NORMAL);//修改柜员状态为正常
			usermapper.updateByPrimaryKey(user);//更新柜员信息在数据库
			frozen_acoountmapper.deleteByPrimaryKey(userName);//删除柜员在frozen中的数据
			//再进行密码验证
			if(password.equals(user.getPassword())){
				loginReturn = new AjaxResult<Integer>(user.getUserId(),true);
					return loginReturn;
				}
			frozen.setErrorCount(1);
			frozen_acoountmapper.insert(frozen);
				loginReturn = new AjaxResult<Integer>(false, "密码错误,您还有4次机会");
				return loginReturn;
		}else if(backfrozen!=null&&backfrozen.getErrorCount()<5&&user!=null&&user.getStatus()==NORMAL){
			if(password.equals(user.getPassword())){
				frozen_acoountmapper.deleteByPrimaryKey(userName);//密码正确删除错误次数
				loginReturn = new AjaxResult<Integer>(user.getUserId(),true);
				return loginReturn;
			}//密码验证
			//System.out.println(backfrozen.getErrorCount());
			frozen.setErrorCount(backfrozen.getErrorCount()+1);
			//System.out.println(frozen.getErrorCount());
			frozen_acoountmapper.updateByPrimaryKey(frozen);
			int acoount = 4-backfrozen.getErrorCount();
			if(frozen.getErrorCount()==5){
				user.setStatus(FROST);//修改柜员状态为冻结
				usermapper.updateByPrimaryKey(user);	//更新柜员信息在数据库
				loginReturn = new AjaxResult<Integer>(false, "密码错误5次,账户冻结");
				return loginReturn;
			}
			loginReturn = new AjaxResult<Integer>(false, "密码错误,您还有"+acoount+"机会");
			return loginReturn;
			}
		loginReturn = new AjaxResult<Integer>(false,"账号不存在或账号已冻结");
		return loginReturn;
	}
}
