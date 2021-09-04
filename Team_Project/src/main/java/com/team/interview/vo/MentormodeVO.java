package com.team.interview.vo;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class MentormodeVO {

	private int mentorId;
	private String applEmail;
	private String mentorEmail;
	private Date startDate;
	private Date endDate;
	private String content;
	private String title;
	private String method;
	private String field;
	private String bio;
	private Date regDate;
	private Date updateDate;

	public MentormodeVO() {
	}

	public MentormodeVO(int mentorId, String applEmail, String mentorEmail, Date startDate, Date endDate,
			String content, String title, String method, String field, String bio, Date regDate, Date updateDate) {

		this.mentorId = mentorId;
		this.applEmail = applEmail;
		this.mentorEmail = mentorEmail;
		this.startDate = startDate;
		this.endDate = endDate;
		this.content = content;
		this.title = title;
		this.method = method;
		this.field = field;
		this.bio = bio;
		this.regDate = regDate;
		this.updateDate = updateDate;

	}

	public int getMentorId() {
		return mentorId;
	}

	public void setMentorId(int mentorId) {
		this.mentorId = mentorId;
	}

	public String getApplEmail() {
		return applEmail;
	}

	public void setApplEmail(String applEmail) {
		this.applEmail = applEmail;
	}

	public String getMentorEmail() {
		return mentorEmail;
	}

	public void setMentorEmail(String mentorEmail) {
		this.mentorEmail = mentorEmail;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getMethod() {
		return method;
	}

	public void setMethod(String method) {
		this.method = method;
	}

	public String getField() {
		return field;
	}

	public void setField(String field) {
		this.field = field;
	}

	public String getBio() {
		return bio;
	}

	public void setBio(String bio) {
		this.bio = bio;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

}
