package com.teamone.entity;

import java.math.BigDecimal;
import java.sql.Date;

public class Bill {
    private Long billId;

    private String account;

    private Long transferId;

    private Date tradeDate;

    private Integer tradeType;

    private BigDecimal tradeMoney;

    private BigDecimal balance;

    private String currency;

    private Integer tellerId;
    
    private BigDecimal minmoney;//查询最小金额
    
    private BigDecimal maxmoney;//查询最大金额

    public Long getBillId() {
        return billId;
    }

    public void setBillId(Long billId) {
        this.billId = billId;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account == null ? null : account.trim();
    }

    public Long getTransferId() {
        return transferId;
    }

    public void setTransferId(Long transferId) {
        this.transferId = transferId;
    }

    public Date getTradeDate() {
        return tradeDate;
    }

    public void setTradeDate(Date tradeDate) {
        this.tradeDate = tradeDate;
    }

    public Integer getTradeType() {
        return tradeType;
    }

    public void setTradeType(Integer tradeType) {
        this.tradeType = tradeType;
    }

    public BigDecimal getTradeMoney() {
        return tradeMoney;
    }

    public void setTradeMoney(BigDecimal tradeMoney) {
        this.tradeMoney = tradeMoney;
    }

    public BigDecimal getBalance() {
        return balance;
    }

    public void setBalance(BigDecimal balance) {
        this.balance = balance;
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

	public BigDecimal getMinmoney() {
		return minmoney;
	}

	public void setMinmoney(BigDecimal minmoney) {
		this.minmoney = minmoney;
	}

	public BigDecimal getMaxmoney() {
		return maxmoney;
	}

	public void setMaxmoney(BigDecimal maxmoney) {
		this.maxmoney = maxmoney;
	}

	@Override
	public String toString() {
		return "Bill [billId=" + billId + ", account=" + account
				+ ", transferId=" + transferId + ", tradeDate=" + tradeDate
				+ ", tradeType=" + tradeType + ", tradeMoney=" + tradeMoney
				+ ", balance=" + balance + ", currency=" + currency
				+ ", tellerId=" + tellerId + ", minmoney=" + minmoney
				+ ", maxmoney=" + maxmoney + "]";
	}
    
    
}