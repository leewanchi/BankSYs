package com.teamone.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.security.NoSuchAlgorithmException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.teamone.dto.AjaxResult;
import com.teamone.dto.ResultReturn;
import com.teamone.entity.Custom;
import com.teamone.sevice.ICustomService;

@Controller
public class CustomController {
	@Autowired
	ICustomService iCustomService;

	// private ResultReturn resultReturn;
	// AJAX校验账号是否存在，有返回1，无返回2
	@ResponseBody
	@RequestMapping(value = "/checkAccount", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	public String checkAccount(String cardId, HttpSession session) {
		//System.out.println("------ajax-----cardId--" + cardId);
		JSONObject obj = new JSONObject();
		Custom custom = iCustomService.selectCustomById(cardId);
		if (custom == null) {
			obj.put("i", 2);
		} else {
			if (custom.getStatus() == 1) {
				obj.put("i", 1);
			} else {
				obj.put("i", 3);
			}
			obj.put("customName", custom.getCustomName());
		}
		return obj.toJSONString();
	}

	// AJAX校验账号原密码和输入密码是否一致，是返回1，否返回2
	@ResponseBody
	@RequestMapping(value = "/checkPassWord", method = RequestMethod.POST)
	public AjaxResult<String> checkPassWord(String cardId, String password,
			HttpSession session) throws NoSuchAlgorithmException,
			UnsupportedEncodingException {
		System.out.println("--checkPassWord---ajax-----cardId-"+cardId+"--password"+password);
		// 返回校验密码的封装实体
		AjaxResult<String> customLogin = iCustomService.CustomLogin(cardId,
				password);
		System.out.println("------AjaxResult---"+customLogin.toString());
		return customLogin;
	}

	// AJAX校验账号和交易金额
	@ResponseBody
	@RequestMapping(value = "/checkInfo", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	public String checkInfo(String cardId, String tradeMoney,
			HttpSession session, HttpServletRequest request) {
		/*
		 * System.out.println("--------checkInfo"); String cardId =
		 * request.getParameter("cardId"); String tradeMoney =
		 * request.getParameter("tradeMoney");
		 */
		/*System.out.println("------ajax-----checkInfo--" + cardId + "====="
				+ tradeMoney);*/
		JSONObject obj = new JSONObject();
		// 根据账号查询顾客信息
		Custom custom = iCustomService.selectCustomById(cardId);
		if (custom == null) {
			// 顾客账号不存在
			obj.put("i", 2);
		} else {
			// 顾客账号存在
			if (custom.getStatus() == 1) {
				obj.put("i", 1);
			} else {
				//账号被冻结
				obj.put("i", 3);
			}
			if (custom.getBalance().compareTo(new BigDecimal(tradeMoney)) > -1) {
				// 余额充足
				obj.put("j", 4);
			} else {
				// 余额不足
				obj.put("j", 5);
			}
		}
		return obj.toJSONString();
	}

	// AJAX校验出账账号、入账账号和交易金额
	@ResponseBody
	@RequestMapping(value = "/checkAllInfo", method = RequestMethod.POST)
	public ResultReturn checkAllInfo(String outAccount, String inAccount,
			String tradeMoney, HttpSession session, HttpServletRequest request) {
		/*System.out.println("------ajax-----checkInfo--" + outAccount + "===="
				+ inAccount + "=====" + tradeMoney);*/
		ResultReturn resultReturn = new ResultReturn();
		// 根据账号查询顾客信息
		Custom out_custom = iCustomService.selectCustomById(outAccount);
		Custom in_custom = iCustomService.selectCustomById(inAccount);
		if (out_custom != null) {
			if (out_custom.getStatus() == 1) {
				//出账账号存在
				resultReturn.setOut_flag(true);
				resultReturn.setOut_msg("出账账号存在");
			} else {
				//出账账号被冻结
				resultReturn.setOut_flag(false);
				resultReturn.setOut_msg("出账账号被冻结");
			}
		} else {
			// 出账账号不存在
			resultReturn.setOut_flag(false);
			resultReturn.setOut_msg("出账账号不存在");
		}
		if (in_custom != null) {
			if (in_custom.getStatus() == 1) {
				//入账账号存在
				resultReturn.setIn_flag(true);
				resultReturn.setIn_msg("入账账号存在");
			} else {
				//账号被冻结
				resultReturn.setIn_flag(false);
				resultReturn.setIn_msg("入账账号被冻结");
			}
		} else {
			resultReturn.setIn_flag(false);
			resultReturn.setIn_msg("入账账号不存在");
		}
		if (out_custom.getBalance().compareTo(new BigDecimal(tradeMoney)) > -1) {
			// 余额充足
			resultReturn.settMoney_flag(true);
			resultReturn.settMoney_msg("余额充足");
		} else {
			// 余额不足
			resultReturn.settMoney_flag(false);
			resultReturn.settMoney_msg("余额不足");
		}

		return resultReturn;
	}
	   @ResponseBody
	   @RequestMapping(value="/searchInfo",method=RequestMethod.POST,produces="application/json;charset=UTF-8")
	   public Custom searchInfo(HttpServletRequest request,HttpSession session,HttpServletResponse response) throws IOException{
		   
		   String searchAccount = request.getParameter("cardId");
		   Custom custom=iCustomService.queryCustom(searchAccount);
	  	   
		  
	      return custom; 
	  }
	  
}
