package com.teamone.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.math.BigDecimal;
import java.net.URLEncoder;
import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.teamone.entity.Bill;
import com.teamone.entity.PageBean;
import com.teamone.entity.QueryInfo;
import com.teamone.service.impl.BillSearchServiceImpl;
import com.teamone.utils.Db2Excel;




@Controller
public class BillController {
	
	@Autowired
	public BillSearchServiceImpl billSearchService;

	
	
	//模糊查询加分页
	@RequestMapping("/queryMore")
	public ModelAndView queryMore(HttpSession session,HttpServletRequest request){
		String tradeType = request.getParameter("trade_type");
		String account = request.getParameter("account");
		String tradeDate = request.getParameter("trade_date"); 
		String minmoney = request.getParameter("minmoney");
		String maxmoney =request.getParameter("maxmoney");      //获取传过来的查询参数
		Bill billsearch = new Bill();
		
		try {
			billsearch.setAccount(account);
		} catch (IllegalArgumentException e) {
			
		}
		try {
			billsearch.setTradeType(Integer.valueOf(tradeType));
		} catch (IllegalArgumentException e) {
			// TODO Auto-generated catch block
			
		}
		try {
			billsearch.setTradeDate(Date.valueOf(tradeDate));
		} catch (IllegalArgumentException e) {
			// TODO Auto-generated catch block
			
		}
		try {
			billsearch.setMinmoney(new BigDecimal(minmoney));
		} catch (NullPointerException e) {
			// TODO Auto-generated catch block
			
		} catch(NumberFormatException e){
			
		}
		try {
			billsearch.setMaxmoney(new BigDecimal(maxmoney));
		} catch (NullPointerException e) {
			// TODO Auto-generated catch block
			
		} catch(NumberFormatException e){
																//将参数放进Bill实体中
		}
		
		List<Bill> searchBills = billSearchService.searchPageBills(billsearch);//查找要查询的流水
		
		
		ModelAndView modelAndView = new ModelAndView();
		PageBean pageQuery = null;
		QueryInfo queryInfo = new QueryInfo();
		session.setAttribute("querybill", searchBills);//将查找到的流水信息存入session
		
		

		String current = request.getParameter("currentpage");
		//第一次访问页面
		if(current == null){
			pageQuery = billSearchService.pageQueryMore(queryInfo.getStartindex(),queryInfo.getPagesize(),queryInfo.getCurrentpage(),billsearch);//若当前页为空，查找第一页
			session.setAttribute("billsearch", billsearch);//将要查找的内容存进session
		}else{       //带参数后访问页面
			billsearch = (Bill) session.getAttribute("billsearch");
			int currentpage  = Integer.valueOf(current);
			queryInfo.setCurrentpage(currentpage);
			pageQuery = billSearchService.pageQueryMore(queryInfo.getStartindex(),queryInfo.getPagesize(),queryInfo.getCurrentpage(),billsearch);//查找当前页内容
		}
		session.setAttribute("pageQuery", pageQuery);
		//modelAndView.setViewName("querybills");
		modelAndView.setViewName("trandetail");
		return modelAndView;
	}
	
	
	//导出查询结果
	@RequestMapping("/QuerytoExcel")
	public void QuerytoExcel(HttpSession session,HttpServletResponse response) throws Exception {
		
		OutputStream os = response.getOutputStream();// 取得输出流   
        response.reset();// 清空输出流 
        response.setHeader("Content-disposition", "attachment; filename="+new String("查询结果".getBytes("UTF-8"),"iso-8859-1")+".xls");// 设定输出文件头   
        response.setContentType("application/msexcel");// 定义输出类型 
		
		
		String[] fieldList = { "bill_id", "out_account", "transfer_id", "trade_date", "trade_type", "trade_money", "balance","currency","teller_id" };
		String[] titles = { "流水单号", "出账账号", "转账流水号", "交易日期", "交易类型", "交易金额","余额", "货币", "操作柜员" };
		List<Bill> allbills = (List<Bill>) session.getAttribute("querybill");

		Db2Excel.dBToExcel(fieldList, titles, allbills, os);

		
		
	}
	
	
}
