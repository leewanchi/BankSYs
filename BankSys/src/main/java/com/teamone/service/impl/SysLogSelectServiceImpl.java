package com.teamone.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamone.dao.LogPageMapper;
import com.teamone.dao.SysLogMapper;
import com.teamone.entity.LogResult;
import com.teamone.entity.PageBean;
import com.teamone.entity.SysLog;


@Service
public class SysLogSelectServiceImpl {

	@Autowired
	public SysLogMapper syslogMapper;
	
	@Autowired
	public LogPageMapper logpageMapper;
		
		//返回所有流水单的分页结果
		public PageBean pageQuery(int startindex,int pagesize,int currentpage){
			
			List<SysLog> list = logpageMapper.pageQuery(startindex, pagesize);//返回流水分页
			System.out.println(list.size());
			LogResult lr = new LogResult();
			lr.setTotalrecord(logpageMapper.totalrecord());//返回分页总条数
			lr.setList(list);
			PageBean pageBean = new PageBean();
			pageBean.setCurrentpage(currentpage);
			pageBean.setSlist(lr.getList());
			System.out.println(pageBean.getSlist().size());
			pageBean.setPagesize(pagesize);
			pageBean.setTotalrecord(lr.getTotalrecord());
			return pageBean;//返回分页结果
		}
	
}
