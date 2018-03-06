package com.teamone.security;

import com.teamone.entity.Permission;
import com.teamone.entity.Role;
import com.teamone.entity.User;
import com.teamone.sevice.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by teamone on 2017/7/29.
 */
public class MyRealm extends AuthorizingRealm {

    @Autowired
    private UserService userService;


    /**
     * 授权
     * @param principalCollection
     * @return
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {

        String username = (String)principalCollection.getPrimaryPrincipal();
        User user = userService.findUserByUserName(username);
        SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
        for(Role role :user.getRoleList()){
            authorizationInfo.addRole(role.getRoleName());
            for(Permission permission :role.getPermissionList()){
                authorizationInfo.addStringPermission(permission.getPermission());
            }
        }
        return authorizationInfo;
    }


    /**
     * 认证 登录
     * @param authenticationToken
     * @return
     * @throws AuthenticationException
     */

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        UsernamePasswordToken usernamePasswordToke = (UsernamePasswordToken)authenticationToken;
        String username =  usernamePasswordToke.getUsername();
        User user = userService.findUserByUserName(username);
        if(user==null){
            return null;
        }else {
            AuthenticationInfo info = new SimpleAuthenticationInfo(user.getUserName(), user.getPassword(), getName());
            //将用户信息放入session
            SecurityUtils.getSubject().getSession().setAttribute("userinfo",user);
            List<String> permissionList=new ArrayList<String>();
            for(Role role :user.getRoleList()){
                for(Permission permission :role.getPermissionList()){
                    permissionList.add(permission.getPermission());
                }
            }
            SecurityUtils.getSubject().getSession().setAttribute("USER_PERMISSION",permissionList);
            return info;
        }

    }

    // 清除缓存
    public void clearCached() {
        PrincipalCollection principals = SecurityUtils.getSubject().getPrincipals();
        super.clearCache(principals);
    }
}

