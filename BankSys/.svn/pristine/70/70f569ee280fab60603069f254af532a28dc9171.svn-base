package com.teamone.dao;

import java.util.List;
import java.util.Map;

import com.teamone.entity.Bill;
import com.teamone.entity.QueryResult;

public interface QueryPageMapper {
	List<Bill> pageQuery(int startindex,int pagesize);
	
	int totalrecord();
	
	List<Bill> pageQueryMore(Map<String,Object> map);
	
	int totalrecordMore(Bill billsearch);
}
