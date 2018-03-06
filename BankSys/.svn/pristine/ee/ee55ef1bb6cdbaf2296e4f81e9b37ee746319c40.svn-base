package com.teamone.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.teamone.dto.AjaxResult;
import com.teamone.entity.User;
import com.teamone.sevice.IThawService;

@Controller
@RequestMapping("teller")
public class BankManagerController {
	
	@Autowired
	private IThawService ithawservice;
	
	private AjaxResult<String> result;
	private List<User> list;
	
	@RequestMapping("/index")
	public String manager(){
		return "manager";
	}
	
	@RequestMapping(value = "/getAllUser",method = RequestMethod.GET,produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public String getAllUser(){
		 List<User> userlist =ithawservice.getAllUser();
		 for(int i =0;i<userlist.size();i++){
			 System.out.println(userlist.get(i));
		 }
	        String json= JSON.toJSONString(userlist);
	        return json;
	}
	//冻结
	@ResponseBody
	@RequestMapping(value = "/userFreeze/{userId}",method = RequestMethod.POST,produces = {"application/json;charset=UTF-8"})
	public String freezeUser(@PathVariable("userId")Integer userId){
		System.out.println(userId);
		result = ithawservice.userFreeze(userId);
		System.out.println(result);
		return JSON.toJSONString(result);
	}
	//解冻
	@ResponseBody
	@RequestMapping(value = "/userThaw/{userId}",method = RequestMethod.POST,produces = {"application/json;charset=UTF-8"})
	public String thawUser(@PathVariable("userId")Integer userId){
		ithawservice.userThaw(userId);
		result = ithawservice.userThaw(userId);
		System.out.println(result);
		 return JSON.toJSONString(result);
	}
	

}
