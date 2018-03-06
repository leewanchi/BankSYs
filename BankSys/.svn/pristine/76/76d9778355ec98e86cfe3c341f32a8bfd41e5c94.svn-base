package com.teamone.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.teamone.entity.Bill;
import com.teamone.entity.PageBean;
import com.teamone.entity.QueryInfo;
import com.teamone.entity.SysLog;
import com.teamone.service.impl.BillSearchServiceImpl;
import com.teamone.service.impl.SysLogSelectServiceImpl;
import com.teamone.sevice.SysLogService;

@Controller
@RequestMapping("sys")
public class SysLogController {
	
	@Autowired
	public SysLogService sysLogService;
	@Autowired
	public SysLogSelectServiceImpl sysLogSelectServiceImpl;

	@RequestMapping("/queryLog")
	public ModelAndView sysLog(HttpSession session,HttpServletRequest request){
		
		ModelAndView modelView = new ModelAndView();
		PageBean pageQuery = null;
		QueryInfo queryInfo = new QueryInfo();
			
		String current = request.getParameter("currentpage");
		if(current == null){
			pageQuery = sysLogSelectServiceImpl.pageQuery(queryInfo.getStartindex(),queryInfo.getPagesize(),queryInfo.getCurrentpage());//若当前页为空，查找第一页
		}else{
			int currentpage  = Integer.valueOf(current);
			queryInfo.setCurrentpage(currentpage);
			pageQuery = sysLogSelectServiceImpl.pageQuery(queryInfo.getStartindex(),queryInfo.getPagesize(),queryInfo.getCurrentpage());//查找当前页内容
		}
		
		session.setAttribute("pageQuery", pageQuery);
		modelView.setViewName("/searchlog");
		return modelView;
	}
}

















