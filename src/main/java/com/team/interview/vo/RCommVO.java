package com.team.interview.vo;

import java.util.Date;

public class RCommVO {
  private String name;
  private int comId;
  private int reviewId;
  private String email;
  private String content;
  private int prtComId;
  private int seq;
  private int lev;
  private Date regdate;
  private Date updatedate;



  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public int getComId() {
    return comId;
  }

  public void setComId(int comId) {
    this.comId = comId;
  }

  public int getReviewId() {
    return reviewId;
  }

  public void setReviewId(int reviewId) {
    this.reviewId = reviewId;
  }

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public String getContent() {
    return content;
  }

  public void setContent(String content) {
    this.content = content;
  }

  public int getPrtComId() {
    return prtComId;
  }

  public void setPrtComId(int prtComId) {
    this.prtComId = prtComId;
  }

  public int getSeq() {
    return seq;
  }

  public void setSeq(int seq) {
    this.seq = seq;
  }

  public int getLev() {
    return lev;
  }

  public void setLev(int lev) {
    this.lev = lev;
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
