package com.teamone.sevice;

import com.teamone.entity.Bill;
import com.teamone.entity.Custom;

public interface IBankService {

	int saveMoney(Integer userId, Bill bill, Custom custom);

	int drawMoney(Integer userId, Bill bill, Custom custom);

	int transferMoney(Integer userId, Bill bill,String inAccount, String outAccount);
	
}
