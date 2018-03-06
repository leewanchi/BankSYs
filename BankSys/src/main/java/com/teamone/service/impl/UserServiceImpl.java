package com.teamone.service.impl;

import com.teamone.dao.UserMapper;
import com.teamone.dto.UserExcution;
import com.teamone.entity.User;
import com.teamone.sevice.UserService;
import com.teamone.utils.MD5Utils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.List;

/**
 * Created by teamone on 2017/7/29.
 */
@Service("userServiceImpl")
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;


    public User findUserByUserName(String username) {
        User user=null;
        try {
            user =userMapper.selectByuserName(username);
        }catch (Exception e){
            e.printStackTrace();
            //throw e;
        }
        return user;
    }


    //todo 创建用户 +建立用户-角色关联
    @Transactional
    public UserExcution createUser(String userName, String password, String roleIds) throws UnsupportedEncodingException, NoSuchAlgorithmException {
        User user=new User();
        int uIdLong = (int) (System.currentTimeMillis()/1000);
        User u = userMapper.selectByuserName(userName);
        if(u!=null){
        	return new UserExcution(false,UserExcution.USER_REPILLED);
        }
        user.setUserId(uIdLong);
        user.setUserName(userName);
        user.setPassword(MD5Utils.encryptPassword(password));
        user.setStatus(1);
        userMapper.insert(user);

        if(null==roleIds || "".equals(roleIds)){
            return new UserExcution(false,UserExcution.NOROLES_ATTACH);
        }

        Integer userId=uIdLong;   //新建用户之后获取ID
        System.out.println("userid-----------"+userId+"---------");
        roleIds=roleIds.substring(0,roleIds.lastIndexOf(","));
        System.out.println(userId+"-----------"+roleIds);
        userMapper.createUserRole(userId,Long.parseLong(roleIds));
        //userMapper.createUserRole(1505979143,new Long(1));
        
//        String[] rids=roleIds.split(",");
//        for (int i=0;i<rids.length;i++){
//        	System.out.println(userId+"-----------"+rids[i]);
//            userMapper.createUserRole(userId,Long.parseLong(rids[i]));
//        }
        return new UserExcution(true,UserExcution.SUCCESS);
    }

    public List<User> list() {
        return userMapper.getAllUsers();
    }


    public int updateUser(User user) {
        return userMapper.updateByPrimaryKey(user);
    }

    //删除用户，清除user_role关联
    public int deleteUser(Integer userId) {
        int count=userMapper.deleteUserRoles(userId);
        count+=userMapper.deleteByPrimaryKey(userId);
        return count;
    }

    public int createUserRoles(Integer userId, String roleIds) {
        int count=0;
        String[] rIds=roleIds.split(",");
        for (int i=0;i<rIds.length;i++){
           count+= userMapper.createUserRole(userId,Long.parseLong(rIds[i]));
        }
        return count;
    }
}