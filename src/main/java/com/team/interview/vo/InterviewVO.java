package com.team.interview.vo;

import java.util.ArrayList;
import java.util.Date;

public class InterviewVO {

    private int postingId;
    private String url;
    private String cname;
    private String logoUrl;
    private String kw;
    private String pos;
    private String regdate;
    private Date pdatedate;
    private ArrayList<String> kwList;
    
    
    
	public ArrayList<String> getKwList() {
		return kwList;
	}
	public void setKwList(ArrayList<String> kwList) {
		this.kwList = kwList;
	}
	public int getPostingId() {
		return postingId;
	}
	public void setPostingId(int postingId) {
		this.postingId = postingId;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	
	
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getLogoUrl() {
		return logoUrl;
	}
	public void setLogoUrl(String logoUrl) {
		this.logoUrl = logoUrl;
	}
	public String getKw() {
		return kw;
	}
	public void setKw(String kw) {
		this.kw = kw;
	}
	public String getPos() {
		return pos;
	}
	public void setPos(String pos) {
		this.pos = pos;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public Date getPdatedate() {
		return pdatedate;
	}
	public void setPdatedate(Date pdatedate) {
		this.pdatedate = pdatedate;
	}
	
    
    
}
