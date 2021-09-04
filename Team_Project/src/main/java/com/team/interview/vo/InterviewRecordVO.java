package com.team.interview.vo;

import java.sql.Date;

public class InterviewRecordVO {
	
	private int iRecordId;
	private String mentorEmail;
	private String email;
	private int iTypeId;
	private String chosenKw;
	private String chosenPos;
	private Date regDate;
	private Date upDatedate;
	
	public int getiRecordId() {
		return iRecordId;
	}
	public void setiRecordId(int iRecordId) {
		this.iRecordId = iRecordId;
	}
	public String getMentorEmail() {
		return mentorEmail;
	}
	public void setMentorEmail(String mentorEmail) {
		this.mentorEmail = mentorEmail;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getiTypeId() {
		return iTypeId;
	}
	public void setiTypeId(int iTypeId) {
		this.iTypeId = iTypeId;
	}
	public String getChosenKw() {
		return chosenKw;
	}
	public void setChosenKw(String chosenKw) {
		this.chosenKw = chosenKw;
	}
	public String getChosenPos() {
		return chosenPos;
	}
	public void setChosenPos(String chosenPos) {
		this.chosenPos = chosenPos;
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
