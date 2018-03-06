package com.teamone.aop;

import java.util.Date;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.teamone.dao.LogMapper;
import com.teamone.entity.Bill;
import com.teamone.entity.Custom;
import com.teamone.entity.Log;

/*
 * 
 * 定义一个切面=切点（pointcut）+增强方法（advise）
 * 
 * */
@Aspect
@Component
public class DealInterceptor {
	@Autowired
	LogMapper logMapper;

	@Pointcut("execution(* com.teamone.service.impl.BankServiceImpl.*(..))")
	private void anyMethod() {
	}// 定义一个切入点

	/*
	 * @Before(value = "anyMethod()") private void before(){
	 * System.out.println("=====前置通知======"); }
	 */
	@After(value = "anyMethod()")
	private void after(JoinPoint jp) {
		Custom custom = new Custom();
		Bill bill = new Bill();
		Log log = new Log();
		String name = jp.getSignature().getName();
		System.out.println("=====后置通知======调用了" + name + "方法=====");
		Object[] args = jp.getArgs();

		if (args.length > 0) {
			for (Object object : args) {
				if (object instanceof Custom) {
					custom = (Custom) object;
				}
				;
				if (object instanceof Bill) {
					bill = (Bill) object;
				}
				;
			}
		}
		// 存款记录日志
		if (name.equals("saveMoney")) {
			log.setInAccount(custom.getCardId());
			log.setTradeDate(new Date());
			log.setTradeMoney(bill.getTradeMoney());
			log.setCurrency("人民币");
			log.setTradeType(1);
			int i = logMapper.insertSelective(log);
		}
		// 取款记录日志
		if (name.equals("drawMoney")) {
			log.setOutAccount(custom.getCardId());
			log.setTradeDate(new Date());
			log.setTradeMoney(bill.getTradeMoney());
			log.setCurrency("人民币");
			log.setTradeType(2);
			int i = logMapper.insertSelective(log);
		}
		// 转账记录日志
		if (name.equals("transferMoney")) {
			log.setOutAccount(custom.getCardId());
			log.setInAccount(bill.getAccount());
			log.setTradeDate(new Date());
			log.setTradeMoney(bill.getTradeMoney());
			log.setCurrency("人民币");
			log.setTradeType(3);
			int i = logMapper.insertSelective(log);

		}
	}
}
