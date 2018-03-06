package com.teamone.common;

import org.apache.shiro.subject.Subject;
import org.apache.shiro.util.StringUtils;
import org.apache.shiro.web.filter.authz.AuthorizationFilter;
import org.apache.shiro.web.util.WebUtils;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.List;

/**
 * Created by kay on 2017/8/1.
 * 权限对比
 */
public class RoleAuthFilter extends AuthorizationFilter {

    @Override
    protected boolean isAccessAllowed(ServletRequest req, ServletResponse resp, Object arg2)
            throws Exception {
        HttpServletRequest request = (HttpServletRequest) req;
        //获取请求路径
        String path = request.getServletPath();
        Subject subject = getSubject(req, resp);
        if (null != subject.getPrincipals()) {
            //根据session中存放的用户权限，比对路径，如果拥有该权限则放行

            List<String> permissionList= (List<String>) request.getSession().getAttribute("USER_PERMISSION");

            //todo 权限检查
            if (null != permissionList && permissionList.contains(path)) {
                return true;
            }

        }
        return false;
    }

    /**
     * 会话超时或权限校验未通过的，统一返回401，由前端页面弹窗提示
     */
    @Override
    protected boolean onAccessDenied(ServletRequest request, ServletResponse response)
            throws IOException {
        if (isAjax((HttpServletRequest) request)) {
            WebUtils.toHttp(response).sendError(401);
        } else {
            String unauthorizedUrl = getUnauthorizedUrl();
            if (StringUtils.hasText(unauthorizedUrl)) {
                WebUtils.issueRedirect(request, response, unauthorizedUrl);
            } else {
                WebUtils.toHttp(response).sendError(401);
            }
        }

        return false;
    }

    //判断是否是ajax请求
    private boolean isAjax(HttpServletRequest request) {
        String header = request.getHeader("x-requested-with");
        if (null != header && "XMLHttpRequest".endsWith(header)) {
            return true;
        }
        return false;
    }
}
