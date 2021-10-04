package com.team.interview.vo;

import java.util.Date;

public class KeywordVO {
	
	
	private int kwid;
	private String kw;
	private Date regdate;
	private Date updatedate;
	
	public KeywordVO() {}
	public KeywordVO(int kwid, String kw, Date regdate, Date updatedate) {

		this.kwid = kwid;
		this.kw = kw;
		this.regdate = regdate;
		this.updatedate = updatedate;
		
	}
	public int getKwid() {
		return kwid;
	}
	public void setKwid(int kwid) {
		this.kwid = kwid;
	}
	public String getKw() {
		return kw;
	}
	public void setKw(String kw) {
		this.kw = kw;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Date getUpdatedate() {
		return updatedate;
	}
	public void setUpdatedate(Date updatedate) {
		this.updatedate = updatedate;
	}
	
	

}
