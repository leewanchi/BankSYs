package com.teamone.controller;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.teamone.dto.AjaxResult;
import com.teamone.sevice.IUserService;
import com.teamone.utils.Log4jUtil;

@Controller
@RequestMapping("/login")
public class UserLoginController {

	@Autowired
	private IUserService userLoginService;
	
	private AjaxResult<Integer> loginReturn;
	
	@RequestMapping("/userLogin")
	@ResponseBody
	public AjaxResult<Integer> login(HttpSession session,HttpServletRequest request) throws NoSuchAlgorithmException, UnsupportedEncodingException{


		//Log4jUtil.loadingLog4j();
		//Log4jUtil.log.warn("用户执行了登陆操作");
		
		String userId = request.getParameter("username");
		String password = request.getParameter("password");
		loginReturn = userLoginService.TellerLogin(userId,password);
		if(loginReturn.isStatus()){
			session.setAttribute("userId", loginReturn.getData());

			UsernamePasswordToken token = new UsernamePasswordToken(userId, password);
	        Subject subject = SecurityUtils.getSubject();
	            subject.login(token);
	            SecurityUtils.getSubject().getSession().setTimeout(1800000);

			return loginReturn;
			}
		return loginReturn;
	}
	

}
