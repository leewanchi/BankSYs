package com.teamone.dto;

/**
 * Created by kay on 2017/8/6.
 */
public class UserExcution {

    public static final String USER_REPILLED="用户已存在";

    public static final String NOROLES_ATTACH="未绑定任何角色";

    public static final String SUCCESS="用户创建成功";

    public static final String FAIL="用户创建失败";

    private boolean success;

    private String info;

    public UserExcution(boolean success, String info) {
        this.success = success;
        this.info = info;
    }

    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }
}
