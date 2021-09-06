package com.team.interview.vo;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component("recruit")
public class RecruitVO {
	
	// properties
	private int rId;
	private String email;
	private String pos;
	private Date rStartdate;
	private Date rEnddate;
	private String kw;
	private String url;
	private String career;
	private Date regdate;
	private Date updatedate;
	

	// properties for join statement
	private String cName;
	
	// constructors
	public RecruitVO() {}

	public RecruitVO(int rId, String email, String pos, Date rStartdate, Date rEnddate, String kw, String url,
			String career, Date regdate, Date updatedate, String cName, String fileData) {
		super();
		this.rId = rId;
		this.email = email;
		this.pos = pos;
		this.rStartdate = rStartdate;
		this.rEnddate = rEnddate;
		this.kw = kw;
		this.url = url;
		this.career = career;
		this.regdate = regdate;
		this.updatedate = updatedate;
		this.cName = cName;
	}


	// getter and setter methods
	public int getId() {
		return rId;
	}

	public void setId(int r_id) {
		this.rId = r_id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPos() {
		return pos;
	}

	public void setPos(String pos) {
		this.pos = pos;
	}

	public Date getRStartdate() {
		return rStartdate;
	}

	public void setRStartdate(Date startDate) {
		this.rStartdate = startDate;
	}

	public Date getREnddate() {
		return rEnddate;
	}

	public void setREnddate(Date endDate) {
		this.rEnddate = endDate;
	}

	public String getKw() {
		return kw;
	}

	public void setKw(String keyword) {
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

	public Date getUpdatedate() {
		return updatedate;
	}

	public void setUpdatedate(Date updateDate) {
		this.updatedate = updateDate;
	}

	public String getcName() {
		return cName;
	}

	public void setcName(String cName) {
		this.cName = cName;
	}
}
