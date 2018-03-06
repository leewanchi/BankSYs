package com.teamone.sevice;

import com.teamone.dto.UserExcution;
import com.teamone.entity.User;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.List;

/**
 * Created by teamone on 2017/7/29.
 */
public interface UserService {


    User findUserByUserName(String username);

    //创建用户
    UserExcution createUser(String userName, String password, String roleIds) throws UnsupportedEncodingException, NoSuchAlgorithmException;

    List<User> list();

    int updateUser(User user);

    int deleteUser(Integer userId);

    /**
     * 创建用户-角色关联
     * @param userId
     * @param roleIds  roleids 拼接字符串
     * @return
     */
    int createUserRoles(Integer userId,String roleIds);
}
