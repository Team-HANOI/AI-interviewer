package com.team.interview.vo;

import java.sql.Date;

public class InterviewAnswerVO {

	private int answerId;
	private int voiceNum;
	private int iRecordId;
	private int qId;
	private String content;
	private int rCnt;
	private Date regDate;
	private Date upDatedate;
	
	public InterviewAnswerVO() {}

	public int getAnswerId() {
		return answerId;
	}

	public void setAnswerId(int answerId) {
		this.answerId = answerId;
	}

	public int getVoiceNum() {
		return voiceNum;
	}

	public void setVoiceNum(int voiceNum) {
		this.voiceNum = voiceNum;
	}

	public int getiRecordId() {
		return iRecordId;
	}

	public void setiRecordId(int iRecordId) {
		this.iRecordId = iRecordId;
	}

	public int getqId() {
		return qId;
	}

	public void setqId(int qId) {
		this.qId = qId;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getrCnt() {
		return rCnt;
	}

	public void setrCnt(int rCnt) {
		this.rCnt = rCnt;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public Date getUpDatedate() {
		return upDatedate;
	}

	public void setUpDatedate(Date upDatedate) {
		this.upDatedate = upDatedate;
	}
	
	
	
	
}
