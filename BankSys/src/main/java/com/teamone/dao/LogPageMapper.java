package com.teamone.dao;

import java.util.List;
import java.util.Map;

import com.teamone.entity.Bill;
import com.teamone.entity.SysLog;

public interface LogPageMapper {

	List<SysLog> pageQuery(int startindex,int pagesize);
	
	int totalrecord();
}
