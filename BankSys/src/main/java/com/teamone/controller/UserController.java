package com.teamone.controller;

import com.alibaba.fastjson.JSON;
import com.teamone.dto.AjaxResult;
import com.teamone.dto.UserExcution;
import com.teamone.entity.Permission;
import com.teamone.entity.Role;
import com.teamone.entity.User;
import com.teamone.sevice.RoleService;
import com.teamone.sevice.UserService;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by teamone on 2017/7/29.
 */
@Controller
@RequestMapping("user")
public class UserController {


    @Autowired
    private UserService userService;

    @Autowired
    private RoleService roleService;

    //查看个人权限
    @RequestMapping("/permissionList")
    //@RequiresPermissions("account:query")   //需要这个权限才能访问这个方法
    public String list(HttpSession session, Model model){
        User user=(User) SecurityUtils.getSubject().getSession().getAttribute("userinfo");
        //List<User> users= userService.list();
        List<Permission> permissionList=new ArrayList<Permission>();
        for(Role role :user.getRoleList()){
            for(Permission permission :role.getPermissionList()){
                permissionList.add(permission);
            }
        }
        model.addAttribute("permissionList",permissionList);
        return "permissionList";
    }


    //登录的用户个人信息
    @RequestMapping("/userinfo")
    @ResponseBody
    public User getUser(){
        User user = (User) SecurityUtils.getSubject().getSession().getAttribute("userinfo");
        return user;
    }


    //登出
    @RequestMapping("/logout")
    public String logout(HttpSession session){
        //session.invalidate();
    	Subject subject=SecurityUtils.getSubject();
    	subject.logout();
        return "login";
    }

    //user主页面跳转
    @RequestMapping("/userList")
    public String list(){
        return "usermana";
    }

    //获取role列表，用于给用户分配
    @RequestMapping(value = "/getRoleNames",method = RequestMethod.GET,produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String getRoleNames(){
        List<Role> roleList=roleService.getRoleNames();
        String json=JSON.toJSONString(roleList);
        return json;
    }

    //获取所有用户信息
    @RequestMapping(value = "/list",method = RequestMethod.GET,produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String userList(){
        List<User> userList =userService.list();
        String json= JSON.toJSONString(userList);
        return json;
    }


    //添加用户,同时也分配了角色
    @RequestMapping(value="/add",
            method = RequestMethod.POST,
            produces = {"application/json;charset=UTF-8"}
    )
    @ResponseBody
    public String addUser(HttpServletRequest request){
        String userName=request.getParameter("userName");
        String password=request.getParameter("password");
        String roleIds=request.getParameter("roleIds");
        String json="";
        UserExcution excution=null;
        try {
            excution =userService.createUser(userName,password,roleIds);
        } catch (Exception e) {
            excution=new UserExcution(false,UserExcution.FAIL);
        }
        json=JSON.toJSONString(excution);
        return json;
    }



    //删除用户
    @RequestMapping(value="/delete/{userId}",
            method = RequestMethod.POST,
            produces = {"application/json;charset=UTF-8"}
    )
    @ResponseBody
    public String deleteUser(@PathVariable("userId") Integer userId){
        userService.deleteUser(userId);
        AjaxResult result=new AjaxResult(true,"用户删除成功，角色关联清除成功");
        return JSON.toJSONString(result);
    }

    @RequestMapping(value="/update/{userId}",
            method = RequestMethod.POST,
            produces = {"application/json;charset=UTF-8"}
    )
    @ResponseBody
    public String update(@PathVariable("userId") Integer userId,HttpServletRequest request){
        String userName=request.getParameter("userName");
        String roleIds=request.getParameter("roleIds");
        //todo userService
        return JSON.toJSONString("success");
    }

}
