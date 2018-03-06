package com.teamone.entity;

import java.math.BigDecimal;
import java.util.Date;

public class Bigmoney {
    private Long billId;

    private String outAccount;

    private String inAccount;

    private BigDecimal tradeMoney;

    private Integer tradeType;

    private Date tradeDate;

    private String currency;

    private Integer tellerId;

    private Integer managerId;
    
    

    public Bigmoney() {
    	
    }

    
    
	public Bigmoney(Long billId, String outAccount, BigDecimal tradeMoney,
			Integer tradeType, Date tradeDate, Integer tellerId) {
		super();
		this.billId = billId;
		this.outAccount = outAccount;
		this.tradeMoney = tradeMoney;
		this.tradeType = tradeType;
		this.tradeDate = tradeDate;
		this.tellerId = tellerId;
	}



	public Bigmoney(Long billId, String outAccount, String inAccount,
			BigDecimal tradeMoney, Integer tradeType, Date tradeDate,
			Integer tellerId) {
		super();
		this.billId = billId;
		this.outAccount = outAccount;
		this.inAccount = inAccount;
		this.tradeMoney = tradeMoney;
		this.tradeType = tradeType;
		this.tradeDate = tradeDate;
		this.tellerId = tellerId;
	}



	@Override
	public String toString() {
		return "未通过详情：" + ", 出账账户=" + outAccount
				+ ", 入账账户=" + inAccount + ", 变动额=" + tradeMoney
				+ ", 操作类型=" + tradeType + ", 日期=" + tradeDate
				+ ", 币种=" + currency + ", 柜员ID=" + tellerId + " ";
	}



	public Long getBillId() {
        return billId;
    }

    public void setBillId(Long billId) {
        this.billId = billId;
    }

    public String getOutAccount() {
        return outAccount;
    }

    public void setOutAccount(String outAccount) {
        this.outAccount = outAccount == null ? null : outAccount.trim();
    }

    public String getInAccount() {
        return inAccount;
    }

    public void setInAccount(String inAccount) {
        this.inAccount = inAccount == null ? null : inAccount.trim();
    }

    public BigDecimal getTradeMoney() {
        return tradeMoney;
    }

    public void setTradeMoney(BigDecimal tradeMoney) {
        this.tradeMoney = tradeMoney;
    }

    public Integer getTradeType() {
        return tradeType;
    }

    public void setTradeType(Integer tradeType) {
        this.tradeType = tradeType;
    }

    public Date getTradeDate() {
        return tradeDate;
    }

    public void setTradeDate(Date tradeDate) {
        this.tradeDate = tradeDate;
    }

    public String getCurrency() {
        return currency;
    }

    public void setCurrency(String currency) {
        this.currency = currency == null ? null : currency.trim();
    }

    public Integer getTellerId() {
        return tellerId;
    }

    public void setTellerId(Integer tellerId) {
        this.tellerId = tellerId;
    }

    public Integer getManagerId() {
        return managerId;
    }

    public void setManagerId(Integer managerId) {
        this.managerId = managerId;
    }
}