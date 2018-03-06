package com.teamone.sevice;

import java.math.BigDecimal;
import java.util.List;

import com.teamone.entity.Bigmoney;

/**
 * 大额转账
 * @author Administrator
 *
 */
public interface BigMoneyService {

	void tansferBigMoney(Integer tellId,String inAccountId,String outAccountId,BigDecimal checkMoney);
	
	void mangerCheck(Long billId,boolean agree,Integer managerId);
	
	List<Bigmoney> getBigBills();
	
	
}
