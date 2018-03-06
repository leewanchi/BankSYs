package com.teamone.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.teamone.dto.AjaxResult;
import com.teamone.entity.Bigmoney;
import com.teamone.sevice.BigMoneyService;


@Controller
@RequestMapping("bigMoney")
public class BigMoneyController {

	@Autowired
	private BigMoneyService bigMoneyService;
	
	/**
	 * 查询临时表是否有大额申请
	 * @return
	 */
	@RequestMapping(value="/getRequires",method = RequestMethod.GET,produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public String checkRequires(){
		List<Bigmoney> bigRequires = bigMoneyService.getBigBills();
		if(bigRequires == null || bigRequires.size()==0){
			AjaxResult<String> result=new AjaxResult<String>(false, "no requirs!");				
			return JSON.toJSONString(result);
		}
			
		int requireNum=bigRequires.size();
		AjaxResult<List<Bigmoney>> result=new AjaxResult<List<Bigmoney>>(true, requireNum+"", bigRequires);	
		return JSON.toJSONString(result);
	}
	
	@RequestMapping("/list")
	public String list(){
		return "bigMoneyList";
	}
	
	@RequestMapping("/applyList")
	public String applyList(){
		return "applyList";
	}
	
}
