package com.teamone.dto;

/**
 * Created by kay on 2017/8/5.
 */
public class PermissionExcution {

    public static final String EMPTY="清空权限";

    public static final String SUCCESS="分配权限成功";

    public static final String REMAIN="权限无变更";


    private boolean execute;

    private String info;


    public PermissionExcution(boolean execute, String info) {
        this.execute = execute;
        this.info = info;
    }

    public boolean isExecute() {
        return execute;
    }

    public void setExecute(boolean execute) {
        this.execute = execute;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }
}
