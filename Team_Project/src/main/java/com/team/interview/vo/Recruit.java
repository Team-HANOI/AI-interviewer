package com.team.interview.vo;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component("recruit")
public class Recruit {
	// properties
	private int r_id;
	private String email;
	private String pos;
	private Date r_startDate;
	private Date r_endDate;
	private String kw;
	private String url;
	private String career;
	private Date regdate;
	private Date updateDate;
	
	// properties for join statement
	private String cName;
	private String fileData;
	
	// constructors
	public Recruit() {}
	
	public Recruit(
			int id, 
			String email, 
			String pos, 
			Date startDate, 
			Date endDate, 
			String keyword, 
			String url,
			String career, 
			Date regdate, 
			Date updateDate) {
		this.r_id = id;
		this.email = email;
		this.pos = pos;
		this.r_startDate = startDate;
		this.r_endDate = endDate;
		this.kw = keyword;
		this.url = url;
		this.career = career;
		this.regdate = regdate;
		this.updateDate = updateDate;
	}

	// getter and setter methods
	public int getId() {
		return r_id;
	}

	public void setId(int r_id) {
		this.r_id = r_id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPosition() {
		return pos;
	}

	public void setPos(String pos) {
		this.pos = pos;
	}

	public Date getStartDate() {
		return r_startDate;
	}

	public void setStartDate(Date startDate) {
		this.r_startDate = startDate;
	}

	public Date getEndDate() {
		return r_endDate;
	}

	public void setEndDate(Date endDate) {
		this.r_endDate = endDate;
	}

	public String getKeyword() {
		return kw;
	}

	public void setKeyword(String keyword) {
		this.kw = keyword;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getCareer() {
		return career;
	}

	public void setCareer(String career) {
		this.career = career;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public String getcName() {
		return cName;
	}

	public void setcName(String cName) {
		this.cName = cName;
	}

	public String getFileData() {
		return fileData;
	}

	public void setFileData(String fileData) {
		this.fileData = fileData;
	}
}
