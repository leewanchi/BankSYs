package com.teamone.dto;

public class AjaxResult<T> {

	private boolean status;//执行状态
	private String statusInfo;//返回信息
	private T data;//封装数据

    /**
     * 执行成功
     * @param status 状态
     * @param statusInfo 返回信息
     * @param data 封装数据
     */
    public AjaxResult( T data,boolean status) {
        this.data = data;
        this.status = status;
    }
    
    /**
     * 执行失败||成功冻结
     * @param status 状态
     * @param statusInfo 返回信息
     */
    public AjaxResult(boolean status,String statusInfo){
		this.status = status;
		this.statusInfo=statusInfo;
    }
    
    
    

	public AjaxResult(boolean status, String statusInfo, T data) {
		
		this.status = status;
		this.statusInfo = statusInfo;
		this.data = data;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public String getStatusInfo() {
		return statusInfo;
	}

	public void setStatusInfo(String statusInfo) {
		this.statusInfo = statusInfo;
	}

	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}

	@Override
	public String toString() {
		return "AjaxResult [status=" + status + ", statusInfo=" + statusInfo + ", data=" + data + "]";
	}
    
}
