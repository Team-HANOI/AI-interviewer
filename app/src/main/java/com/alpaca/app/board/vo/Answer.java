package com.alpaca.app.board.vo;

import org.springframework.stereotype.Component;

@Component("answer")
public class Answer{

	
private String answerId;
private String voiceNum;

    private String iRecordId;
private String qId;
private String content;
private String rCnt;
private String regdate;
private String updatedate;
private String aIdSq;


public String getAnswerId() {
	return answerId;
}

public void setAnswerId(String answerId) {
	this.answerId = answerId;
}

public String getVoiceNum() {
	return voiceNum;
}

public void setVoiceNum(String voiceNum) {
	this.voiceNum = voiceNum;
}

public String getiRecordId() {
	return iRecordId;
}

public void setiRecordId(String iRecordId) {
	this.iRecordId = iRecordId;
}

public String getqId() {
	return qId;
}

public void setqId(String qId) {
	this.qId = qId;
}

public String getContent() {
	return content;
}

public void setContent(String content) {
	this.content = content;
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

public String getaIdSq() {
	return aIdSq;
}

public void setaIdSq(String aIdSq) {
	this.aIdSq = aIdSq;
}
}