package com.teamone.entity;

public class QueryInfo {
	private int currentpage = 1;//用户查看的当前页
	private int pagesize = 10;//页面大小
	private int startindex;//数据在数据库中的起始位置
	public int getCurrentpage() {
		return currentpage;
	}
	public void setCurrentpage(int currentpage) {
		this.currentpage = currentpage;
	}
	public int getPagesize() {
		return pagesize;
	}
	public void setPagesize(int pagesize) {
		this.pagesize = pagesize;
	}
	public int getStartindex() {
		this.startindex = (this.currentpage-1)*this.pagesize;
		return startindex;
	}
	
	
	
}
