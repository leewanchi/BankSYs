package com.teamone.service.impl;

import java.math.BigDecimal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.teamone.dao.BigmoneyMapper;
import com.teamone.dao.BillMapper;
import com.teamone.dao.CustomMapper;
import com.teamone.entity.Bill;
import com.teamone.entity.Custom;
import com.teamone.sevice.IBankService;
import com.teamone.utils.AssignValue;

@Transactional
@Service
public class BankServiceImpl implements IBankService {

	@Autowired
	BillMapper billMapper;
	@Autowired
	CustomMapper customMapper;
	@Autowired
	BigmoneyMapper bigmoneyMapper;

	// 存款操作
	@Override
	public int saveMoney(Integer userId, Bill bill, Custom custom) {
		// 获取顾客的cardId
		String cardId = custom.getCardId();
		// /通过CardId查询当前顾客账户信息，获取账户余额
		custom = customMapper.selectByPrimaryKey(cardId);
		// 存款之后的钱=顾客原有的余额+存款的金额
		BigDecimal totalMoney = custom.getBalance().add(bill.getTradeMoney());
		custom.setBalance(totalMoney);
		// 更新顾客的余额
		int i = customMapper.updateByPrimaryKeySelective(custom);
		// 插入一条流水记录
		bill = AssignValue.saveAssign(bill, cardId, userId, totalMoney);
		int j = billMapper.insertSelective(bill);

		if (i == 1 && j == 1) {
			return 1;
		} else {
			return 0;
		}
	}

	// 取款操作
	@Override
	public int drawMoney(Integer userId, Bill bill, Custom custom) {
		// 获取顾客的cardId
		String cardId = custom.getCardId();
		// /通过CardId查询当前顾客账户信息，获取账户余额
		custom = customMapper.selectByPrimaryKey(cardId);
		// 存款之后的钱=顾客原有的余额+存款的金额
		BigDecimal totalMoney = custom.getBalance().subtract(
				bill.getTradeMoney());
		custom.setBalance(totalMoney);
		// 取款后，更新当前账户余额
		int i = customMapper.updateByPrimaryKeySelective(custom);
		// 记录取款记录
		bill = AssignValue.drawAssign(bill, cardId, userId, totalMoney);
		int j = billMapper.insertSelective(bill);
		if (i == 1 && j == 1) {
			return 1;
		} else {
			return 0;
		}
	}

	// 转账操作
	@Override
	public int transferMoney(Integer userId, Bill bill, String inAccount,
			String outAccount) {
		// 获取交易金额
		BigDecimal tradeMoney = bill.getTradeMoney();
		// 获取出账账户信息
		Custom custom = customMapper.selectByPrimaryKey(outAccount);

		// 更新转出金额的账号
		BigDecimal totalMoney = custom.getBalance().subtract(tradeMoney);
		custom.setBalance(totalMoney);
		// 转出后，更新当前出账账号余额
		int i = customMapper.updateByPrimaryKeySelective(custom);

		// 插入转出记录
		bill = AssignValue
				.transferAssignA(bill, outAccount,inAccount, userId, totalMoney);

		int m = billMapper.insertSelective(bill);

		// 转入后，更新当前入账账号余额
		custom = customMapper.selectByPrimaryKey(inAccount);
		totalMoney = custom.getBalance().add(tradeMoney);
		custom.setBalance(totalMoney);
		int j = customMapper.updateByPrimaryKeySelective(custom);

		// 插入转入记录
		bill = AssignValue.transferAssignB(bill, inAccount, outAccount,userId, totalMoney);
		int n = billMapper.insertSelective(bill);

		if (i == 1 && j == 1 && m == 1 && n == 1) {
			return 1;
		} else {
			return 0;
		}
	}
}
