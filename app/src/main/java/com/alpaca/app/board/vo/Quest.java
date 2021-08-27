package com.alpaca.app.board.vo;

import org.springframework.stereotype.Component;

@Component(value="quest")
public class Quest {

    private String q_id;
	private String email;
    private String ssml;
    private String content;
    private String pos;
    private String kwList;
    private String rCnt;

    Quest(){}
    private String regdate;
    private String updatedate;

	public String getQ_id() {
		return q_id;
	}
	public void setQ_id(String q_id) {
		this.q_id = q_id;
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
	public String getPos() {
		return pos;
	}
	public void setPos(String pos) {
		this.pos = pos;
	}
	public String getKwList() {
		return kwList;
	}
	public void setKwList(String kwList) {
		this.kwList = kwList;
	}
	public String getrCnt() {
		return rCnt;
	}
	public void setrCnt(String rCnt) {
		this.rCnt = rCnt;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getUpdatedate() {
		return updatedate;
	}
	public void setUpdatedate(String updatedate) {
		this.updatedate = updatedate;
	}
    




}