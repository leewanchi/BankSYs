package com.teamone.service.impl;

import java.util.HashMap;
import java.util.List;







import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Service;

import com.teamone.dao.BillMapper;
import com.teamone.dao.QueryPageMapper;
import com.teamone.entity.Bill;
import com.teamone.entity.PageBean;
import com.teamone.entity.QueryInfo;
import com.teamone.entity.QueryResult;


@Service
public class BillSearchServiceImpl {
	
	@Autowired
	public BillMapper billMapper;
	
	@Autowired
	public QueryPageMapper queryPageMapper;
	
	//导出所有流水单
//	public List<Bill> searchAllBills(){
//		return billMapper.selectAll();
//	} 
	
	//导出查询结果
	public List<Bill> searchPageBills(Bill billsearch){
		return billMapper.queryMore(billsearch);
	}
	//查找用户是否
//	public Bill searchBillbyAccount(String account){
//		return billMapper.queryAccount(account);
//	}
	//返回所有流水单的分页结果
//	public PageBean pageQuery(int startindex,int pagesize,int currentpage){
//		
//		List<Bill> list = queryPageMapper.pageQuery(startindex, pagesize);//返回流水分页
//		
//		QueryResult qr = new QueryResult();
//		qr.setTotalrecord(queryPageMapper.totalrecord());//返回分页总条数
//		qr.setList(list);
//		PageBean pageBean = new PageBean();
//		pageBean.setCurrentpage(currentpage);
//		pageBean.setList(qr.getList());
//		pageBean.setPagesize(pagesize);
//		pageBean.setTotalrecord(qr.getTotalrecord());
//		return pageBean;//返回分页结果
//	}
	
	//返回分页查询结果
	public PageBean pageQueryMore(int startindex,int pagesize,int currentpage,Bill billsearch){
		
		Map<String, Object> map =new HashMap<String, Object>();
		map.put("startindex", startindex);
		map.put("pagesize", pagesize);
		map.put("account", billsearch.getAccount());
		map.put("tradeType", billsearch.getTradeType());
		map.put("tradeDate", billsearch.getTradeDate());
		map.put("minmoney", billsearch.getMinmoney());
		map.put("maxmoney", billsearch.getMaxmoney());//获得传入的参数
		List<Bill> list = queryPageMapper.pageQueryMore(map);//返回查询内容分页
		QueryResult qr = new QueryResult();
		qr.setTotalrecord(queryPageMapper.totalrecordMore(billsearch));
		qr.setList(list);
		PageBean pageBean = new PageBean();
		pageBean.setCurrentpage(currentpage);
		pageBean.setList(qr.getList());
		pageBean.setPagesize(pagesize);
		pageBean.setTotalrecord(qr.getTotalrecord());
		return pageBean;//返回分页结果
	}
}
