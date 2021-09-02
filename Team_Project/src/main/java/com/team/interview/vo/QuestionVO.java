package com.team.interview.vo;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class QuestionVO {

	private int qid;
	private String email;
	private String ssml;
	private String content;
	private String qtype;
	private String kwlist;
	private int rcnt;
	private Date regdate;
	private Date updatedate;

	public QuestionVO() {
	}

	public QuestionVO(int qid, String email, String ssml, String content, String qtype, String kwlist, int rcnt,
			Date regdate, Date updatedate) {
		this.qid = qid;
		this.email = email;
		this.ssml = ssml;
		this.content = content;
		this.qtype = qtype;
		this.kwlist = kwlist;
		this.rcnt = rcnt;
		this.regdate = regdate;
		this.updatedate = updatedate;
	}

	public int getQid() {
		return qid;
	}

	public void setQid(int qid) {
		this.qid = qid;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSsml() {
		return ssml;
	}

	public void setSsml(String ssml) {
		this.ssml = ssml;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getQtype() {
		return qtype;
	}

	public void setQtype(String qtype) {
		this.qtype = qtype;
	}

	public String getKwlist() {
		return kwlist;
	}

	public void setKwlist(String kwlist) {
		this.kwlist = kwlist;
	}

	public int getRcnt() {
		return rcnt;
	}

	public void setRcnt(int rcnt) {
		this.rcnt = rcnt;
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
