package com.teamone.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class Transaction {
	
//	@Autowired
//	public ModelAndView modelView;
	
	@RequestMapping("/index")
	public ModelAndView index(){
		ModelAndView modelView = new ModelAndView();
	    modelView.setViewName("index");
		return modelView;
	}
	@RequestMapping("/toLogin")
	public ModelAndView toLogin(){
		ModelAndView modelView = new ModelAndView();
	    modelView.setViewName("login");
		return modelView;
	}
	@RequestMapping("/deposit")
	public ModelAndView deposit(){
		ModelAndView modelView = new ModelAndView();
		modelView.setViewName("deposit");
		return modelView;
	}
    @RequestMapping("/withdrawal")
	public ModelAndView withdrawal(){
		ModelAndView modelView = new ModelAndView();
		modelView.setViewName("withdrawal");
		return modelView;
	}
    @RequestMapping("/transfer")
    public ModelAndView transfer(){
    	ModelAndView modelView = new ModelAndView();
    	modelView.setViewName("transfer");
    	return modelView;
    }
    @RequestMapping("/checkaccount")
    public ModelAndView checkaccount(){
    	ModelAndView modelView = new ModelAndView();
    	modelView.setViewName("checkaccount");
    	return modelView;
    }
    
    @RequestMapping("/trandetail")
    public ModelAndView trandetail(){
    	ModelAndView modelView = new ModelAndView();
    	modelView.setViewName("trandetail");
    	return modelView;
    }
    @RequestMapping("/manager")
    public ModelAndView manager(){
    	ModelAndView modelView = new ModelAndView();
    	modelView.setViewName("manager");
    	return modelView;
    }
    @RequestMapping("/authorization")
    public ModelAndView authorization(){
    	ModelAndView modelView  = new ModelAndView();
    	modelView.setViewName("authorization");
    	return modelView;
    }
    @RequestMapping("/admin")
    public ModelAndView admin(){
    	ModelAndView modelView  = new ModelAndView();
    	modelView.setViewName("admin");
    	return modelView;
    }
    @RequestMapping("/searchlog")
    public ModelAndView searchlog(){
    	ModelAndView modelView  = new ModelAndView();
    	modelView.setViewName("searchlog");
    	return modelView;
    }
    @RequestMapping("/adduser")
    public ModelAndView adduser(){
    	ModelAndView modelView  = new ModelAndView();
    	modelView.setViewName("adduser");
    	return modelView;
    }
    @RequestMapping("/deleteuser")
    public ModelAndView deleteuser(){
    	ModelAndView modelView  = new ModelAndView();
    	modelView.setViewName("deleteuser");
    	return modelView;
    }
    @RequestMapping("/updateuser")
    public ModelAndView updateuser(){
    	ModelAndView modelView  = new ModelAndView();
    	modelView.setViewName("updateuser");
    	return modelView;
    }
}
