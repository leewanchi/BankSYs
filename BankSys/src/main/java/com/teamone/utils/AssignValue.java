package com.teamone.utils;

import java.math.BigDecimal;
import java.sql.Date;

import com.teamone.entity.Bigmoney;
import com.teamone.entity.Bill;
import com.teamone.entity.Custom;



public class AssignValue {
	//存款账单实体属性赋值封装方法
	public static Bill saveAssign(Bill bill, String cardId, Integer userId, BigDecimal totalMoney){
		bill.setBillId(System.currentTimeMillis()/1000);
		bill.setAccount(cardId);
		bill.setTransferId(bill.getBillId()+1);
		bill.setBalance(totalMoney);
		bill.setTradeDate(new Date(System.currentTimeMillis()));
		bill.setTradeMoney(bill.getTradeMoney());
		bill.setTradeType(1);
		bill.setCurrency("RMB");
		bill.setTellerId(userId);
		return bill;
	}
	//转出账单实体属性赋值封装方法
	public static Bill transferAssignA(Bill bill, String cardId,String cardId2, Integer userId,
			BigDecimal totalMoney) {
		
		bill.setBillId(System.currentTimeMillis()/1000);
		bill.setAccount(cardId);
		bill.setTransferId( Long.valueOf(cardId2).longValue());
		bill.setBalance(totalMoney);
		bill.setTradeDate(new java.sql.Date(System.currentTimeMillis()));
		bill.setTradeMoney(bill.getTradeMoney());
		bill.setTradeType(3);
		bill.setCurrency("RMB");
		bill.setTellerId(userId);
		return bill;
	}
	//转入账单实体属性赋值封装方法
	public static Bill transferAssignB(Bill bill, String inAccount,String cardId2,Integer userId,BigDecimal totalMoney) {
		
		bill.setBillId(System.currentTimeMillis()/1000+1);
		bill.setAccount(inAccount);
		bill.setTransferId(Long.valueOf(cardId2).longValue());
		bill.setBalance(totalMoney);
		bill.setTradeDate(new java.sql.Date(System.currentTimeMillis()));
		bill.setTradeMoney(bill.getTradeMoney());
		bill.setTradeType(4);
		bill.setCurrency("RMB");
		bill.setTellerId(userId);
		return bill;
	}
	//取款账单实体属性赋值封装方法
	public static Bill drawAssign(Bill bill, String cardId, Integer userId,
			BigDecimal totalMoney) {
		bill.setBillId(System.currentTimeMillis()/1000);
		bill.setAccount(cardId);
		//bill.setTransferId(bill.getBillId()+1);
		bill.setBalance(totalMoney);
		bill.setTradeDate(new java.sql.Date(System.currentTimeMillis()));
		bill.setTradeMoney(bill.getTradeMoney());
		bill.setTradeType(2);
		bill.setCurrency("RMB");
		bill.setTellerId(userId);
		return bill;
	}
	public static Bigmoney bigMoneyAssign(Integer userId, Bill bill, Custom custom) {
		Bigmoney b = new Bigmoney();
		b.setBillId(System.currentTimeMillis()/1000);
		b.setOutAccount(custom.getCardId());
		b.setTellerId(userId);
		b.setTradeDate(new java.sql.Date(System.currentTimeMillis()));
		b.setTradeMoney(bill.getTradeMoney());
		b.setTradeType(2);
		b.setCurrency("RMB");
		// TODO Auto-generated method stub
		return b;
	}
}
