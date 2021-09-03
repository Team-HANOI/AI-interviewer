package com.team.interview.vo;

import java.sql.Date;

public class ProfileVO {

		private String name;
		private int pfImgId;
	    private String bio;
	    private int lev;
	    private String pSkill;
	    private String gSkill;
	    private String attendCnt;
	    private Date regdate;
	    private Date updatedate;
	    private int exp;
	    private String pos;
	    private String githubUrl;
	    private int pfId;
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public int getPfImgId() {
			return pfImgId;
		}
		public void setPfImgId(int pfImgId) {
			this.pfImgId = pfImgId;
		}
		public String getBio() {
			return bio;
		}
		public void setBio(String bio) {
			this.bio = bio;
		}
		public int getLev() {
			return lev;
		}
		public void setLev(int lev) {
			this.lev = lev;
		}
		public String getpSkill() {
			return pSkill;
		}
		public void setpSkill(String pSkill) {
			this.pSkill = pSkill;
		}
		public String getgSkill() {
			return gSkill;
		}
		public void setgSkill(String gSkill) {
			this.gSkill = gSkill;
		}
		public String getAttendCnt() {
			return attendCnt;
		}
		public void setAttendCnt(String attendCnt) {
			this.attendCnt = attendCnt;
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
		public int getExp() {
			return exp;
		}
		public void setExp(int exp) {
			this.exp = exp;
		}
		public String getPos() {
			return pos;
		}
		public void setPos(String pos) {
			this.pos = pos;
		}
		public String getGithubUrl() {
			return githubUrl;
		}
		public void setGithubUrl(String githubUrl) {
			this.githubUrl = githubUrl;
		}
		public int getPfId() {
			return pfId;
		}
		public void setPfId(int pfId) {
			this.pfId = pfId;
		}
	    
}