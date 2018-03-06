package com.teamone.entity;

import java.util.List;

public class PageBean {
	private List<Bill> list;
	private List<SysLog> slist;
	private int totalrecord;//总记录数
	private int pagesize;
	private int totalpage;//总页数
	private int currentpage;//当前页
	private int previouspage;
	private int nextpage;
	private int[] pagebar;//页码条
	public List<Bill> getList() {
		return list;
	}
	public void setList(List<Bill> list) {
		this.list = list;
	}
	public List<SysLog> getSlist() {
		return slist;
	}
	public void setSlist(List<SysLog> slist) {
		this.slist = slist;
	}
	public int getTotalrecord() {
		return totalrecord;
	}
	public void setTotalrecord(int totalrecord) {
		this.totalrecord = totalrecord;
	}
	public int getPagesize() {
		return pagesize;
	}
	public void setPagesize(int pagesize) {
		this.pagesize = pagesize;
	}
	public int getTotalpage() {
		if (this.totalrecord%this.pagesize==0) {
			this.totalpage = this.totalrecord / this.pagesize;
		}else {
			this.totalpage = this.totalrecord / this.pagesize+1;
		}
		return totalpage;
	}
	public int getCurrentpage() {
		return currentpage;
	}
	public void setCurrentpage(int currentpage) {
		this.currentpage = currentpage;
	}
	public int getPreviouspage() {
		if(this.currentpage-1<1){
			this.previouspage = 1;
		}else{
			this.previouspage = this.currentpage-1;
		}
		
		return previouspage;
	}
	
	public int getNextpage() {
		if(this.nextpage+1>=this.totalpage){
			this.nextpage = this.totalpage;
		}else{
			this.nextpage = this.currentpage+1;
		}
		
		return nextpage;
	}
	
	public int[] getPagebar() {
		int pageb[] = new int[this.totalpage];
		for(int i=0;i<this.totalpage;i++){
			pageb[i] = i+1;
		}
		this.pagebar = pageb;
		return pagebar;
	}
	
	
	
	
}
