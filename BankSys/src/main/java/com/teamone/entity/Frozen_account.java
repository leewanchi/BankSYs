package com.teamone.entity;

import java.sql.Date;

public class Frozen_account {
    private String frozenId;

    private Integer errorCount;

    private Date frozenDate;

    
    public Frozen_account(String frozenId, Integer errorCount) {
		super();
		this.frozenId = frozenId;
		this.errorCount = errorCount;
	}
    public Frozen_account() {
  		
  	}

	public String getFrozenId() {
        return frozenId;
    }

    public void setFrozenId(String frozenId) {
        this.frozenId = frozenId == null ? null : frozenId.trim();
    }

    public Integer getErrorCount() {
        return errorCount;
    }

    public void setErrorCount(Integer errorCount) {
        this.errorCount = errorCount;
    }

    public Date getFrozenDate() {
        return frozenDate;
    }

    public void setFrozenDate(Date frozenDate) {
        this.frozenDate = frozenDate;
    }
}