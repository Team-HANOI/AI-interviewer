package com.team.interview.vo;

import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;

@Component
public class MentormodeVO {

  private int mentorId;
  private String applEmail;
  private String mentorEmail;
  private String startDate;
  private String endDate;
  private String content;
  private String title;
  private String method;
  private String field;
  private String bio;
  private Date regDate;
  private Date updateDate;
  //멘토링날짜
  private Date mentorDate;
  //회사이름
  private String company;
  //멘토이름
  private String mentorName;
  //지원자이름
  private String applName;

  public MentormodeVO() {
  }

  public MentormodeVO(int mentorId, String applEmail, String mentorEmail, String startDate,
      String endDate, String content, String title, String method, String field, String bio,
      Date regDate, Date updateDate, Date mentorDate, String company, String mentorName) {
    super();
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
    this.mentorDate = mentorDate;
    this.company = company;
    this.mentorName = mentorName;
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

  public String getStartDate() {
    return startDate;
  }

  public void setStartDate(String startDate) {
    this.startDate = startDate;
  }

  public String getEndDate() {
    return endDate;
  }

  public void setEndDate(String endDate) {
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

  public Date getMentorDate() {
    return mentorDate;
  }

  public void setMentorDate(Date mentorDate) {
    this.mentorDate = mentorDate;
  }

  public String getCompany() {
    return company;
  }

  public void setCompany(String company) {
    this.company = company;
  }

  public String getMentorName() {
    return mentorName;
  }

  public void setMentorName(String mentorName) {
    this.mentorName = mentorName;
  }

  public String getApplName() {
    return applName;
  }

  public void setApplName(String applName) {
    this.applName = applName;
  }




}
