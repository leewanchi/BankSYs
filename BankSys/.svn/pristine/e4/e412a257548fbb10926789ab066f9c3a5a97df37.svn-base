package com.teamone.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by kay on 2017/7/31.
 * 银行主要页面的跳转
 */
@Controller
@RequestMapping("account")
public class BankPageController {

    //主页
    @RequestMapping("/index")
    public String index(){
        return "index";
    }

    //存钱
    @RequestMapping("/deposit")
    public String deposit(){
        return "deposit";
    }

    //查看账户
    @RequestMapping("/checkaccount")
    public String checkAccount(){
        return "checkaccount";
    }
   

    //转账页面
    @RequestMapping("/transfer")
    public String transfer(){
        return "transfer";
    }

    //取钱
    @RequestMapping("/withdrawal")
    public String withdrawal(){

        return "withdrawal";
    }
    //取钱
    @RequestMapping("/systemLog")
    public String systemLog(){

        return "searchlog";
    }

}
