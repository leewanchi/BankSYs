package com.teamone.service.impl;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamone.dao.BigmoneyMapper;
import com.teamone.entity.Bigmoney;
import com.teamone.sevice.BigMoneyService;

@Service
public class BigMoneyServiceImpl implements BigMoneyService {
	
	
	@Autowired
	private BigmoneyMapper bigmoneyMapper;

	/**
	 * 大额转账
	 * 
	 * 1.取款   
	 * 2.转账
	 */
	@Override
	public void tansferBigMoney(Integer tellId, String inAccountId,
			String outAccountId, BigDecimal checkMoney) {
		//取款操作没有入账户
		if(inAccountId==null || "".equals(inAccountId)){
			Long billId=System.currentTimeMillis();
			Bigmoney bigmoney=new Bigmoney(billId, outAccountId, checkMoney, 2, new Date(), tellId);
			bigmoneyMapper.insertSelective(bigmoney);	
			return;
		}
		//转账先存入临时表
		Long billId=System.currentTimeMillis();
		Bigmoney bigmoney=new Bigmoney(billId, outAccountId, inAccountId, checkMoney, 3, new Date(), tellId);
		bigmoneyMapper.insertSelective(bigmoney);	
	}

	/**
	 * 经理确认\取消大额转账
	 */
	@Override
	public void mangerCheck(Long billId, boolean agree, Integer managerId) {
		
	}

	/**
	 * 查询大额交易
	 */
	@Override
	public List<Bigmoney> getBigBills() {
		return bigmoneyMapper.getAllBigBills();
	}
	

}
