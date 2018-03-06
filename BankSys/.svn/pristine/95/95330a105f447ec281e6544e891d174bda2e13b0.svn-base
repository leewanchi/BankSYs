package com.teamone.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamone.dao.SysLogMapper;
import com.teamone.entity.SysLog;
import com.teamone.entity.User;
import com.teamone.sevice.SysLogService;


@Service("SysLogServiceImpl")
public class SysLogServiceImpl implements SysLogService{

	@Autowired
	private SysLogMapper syslogmapper;
	
	@Override
	public List<SysLog> select(){
		List<SysLog> sysLogList = new ArrayList<SysLog>();
		sysLogList = syslogmapper.select();
		return sysLogList;
		
	}
}
