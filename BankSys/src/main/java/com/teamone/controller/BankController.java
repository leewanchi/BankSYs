package com.teamone.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.teamone.entity.Bill;
import com.teamone.entity.Custom;
import com.teamone.sevice.IBankService;
import com.teamone.utils.Log4jUtil;

@Controller
public class BankController {
	@Autowired
	IBankService bankServiceImpl;

	// 存款操作saveMoney
	@RequestMapping("/saveMoney")
	public String toTransfer(Bill bill, HttpSession session, Model model, Custom custom) {
		System.out.println("-存款操作----------saveMoney");

		//Log4jUtil.loadingLog4j();
		//Log4jUtil.log.warn("用户执行了存款操作");
		
		// 获取柜员存在session的信息
		Integer userId = (Integer) session.getAttribute("userId");
		if (userId != null) {
			// 存款后，更新当前账户余额
			if (bankServiceImpl.saveMoney(userId, bill, custom) == 1) {
				// 前端页面会显示存款成功
				model.addAttribute("msg", "存款成功");
			} else {
				// 前端页面会显示存款失败
				model.addAttribute("msg", "存款失败");
			}
			return "deposit";
		} else {
			return "login";
		}

	}

	// 取款操作drawMoney
	@RequestMapping("/drawMoney")
	public ModelAndView drawMoney(Bill bill, HttpSession session, Custom custom) {
		System.out.println("取款操作-------drawMoney");
		

		//Log4jUtil.loadingLog4j();
		//Log4jUtil.log.warn("用户执行了取款操作");
		
		Integer userId = (Integer) session.getAttribute("userId");
		if (userId != null) {
			/*
			 * // 获取柜员存在session的信息 User user = (User)
			 * session.getAttribute("teller");
			 */
			ModelMap mmp = new ModelMap();
			int i = bankServiceImpl.drawMoney(userId, bill, custom);
			if (i == 1) {
				mmp.addAttribute("msg", "取款成功");
			} else if(i==0) {
				mmp.addAttribute("msg", "取款失败");
			}else{
				mmp.addAttribute("msg", "取款处理中，等待经理授权");
			}
			return new ModelAndView("withdrawal", mmp);
		} else {
			return new ModelAndView("login");
		}
	}

	// 转账业务transferMoney
	@RequestMapping("/transferMoney")
	public ModelAndView transfer(HttpSession session, Bill bill, String inAccount, String outAccount) {
		
		System.out.println("转账操作-------transferMoney");
		System.out.println(bill.toString()+"===="+inAccount+"==="+outAccount);
		//Log4jUtil.loadingLog4j();
		//Log4jUtil.log.warn("用户执行了转账操作");
		
		// 获取柜员存在session的信息
		Integer userId = (Integer) session.getAttribute("userId");
		if (userId != null) {
			int i = bankServiceImpl.transferMoney(userId, bill, inAccount,outAccount);
			ModelMap mmp = new ModelMap();
			if (i == 1) {
				mmp.addAttribute("msg", "转账成功..");
			} else {
				mmp.addAttribute("msg", "转账失败..");
			}
			return new ModelAndView("transfer", mmp);
		} else {
			return new ModelAndView("login");
		}
	}
}
