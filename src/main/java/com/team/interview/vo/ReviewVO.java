package com.team.interview.vo;

import java.sql.Date;
import org.springframework.stereotype.Component;

@Component("review")
public class ReviewVO { // db 컬럼명과 동일!, 컬럼보다 수 많은 건 괜찮음
  private String name;

  private int reviewId;
  private int fileId;
  private String email;
  private String pos;
  private String company;
  private String title;
  private String content;
  private int commCnt;
  private int likeCnt;
  private int viewCnt;
  private Date regdate;
  private Date updatedate;
  private boolean temp;

  // private int pfImgId;



  public ReviewVO() {}

  // public ReviewVO(String name, int reviewId, int fileId, String email, String pos, String
  // company,
  // String title, String content, int commCnt, int likeCnt, int viewCnt, Date regdate,
  // Date updatedate, boolean temp) {
  // name = this.name;
  // reviewId = this.reviewId;
  // fileId = this.fileId;
  // email = this.email;
  // pos = this.pos;
  // company = this.company;
  // title = this.title;
  // content = this.content;
  // commCnt = this.commCnt;
  // likeCnt = this.likeCnt;
  // viewCnt = this.viewCnt;
  // regdate = this.regdate;
  // updatedate = this.updatedate;
  // temp = this.temp;
  // }



  public int getReviewId() {
    return reviewId;
  }

  public void setReviewId(int reviewId) {
    this.reviewId = reviewId;
  }


  public int getFileId() {
    return fileId;
  }

  public void setFileId(int fileId) {
    this.fileId = fileId;
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

  public String getCompany() {
    return company;
  }

  public void setCompany(String company) {
    this.company = company;
  }

  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public String getContent() {
    return content;
  }

  public void setContent(String content) {
    this.content = content;
  }

  public int getCommCnt() {
    return commCnt;
  }

  public void setCommCnt(int commCnt) {
    this.commCnt = commCnt;
  }

  public int getLikeCnt() {
    return likeCnt;
  }

  public void setLikeCnt(int likeCnt) {
    this.likeCnt = likeCnt;
  }

  public int getViewCnt() {
    return viewCnt;
  }

  public void setViewCnt(int viewCnt) {
    this.viewCnt = viewCnt;
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

  public boolean isTemp() {
    return temp;
  }

  public void setTemp(boolean temp) {
    this.temp = temp;
  }

  // public int getPfImgId() {
  // return pfImgId;
  // }
  //
  // public void setPfImgId(int pfImgId) {
  // this.pfImgId = pfImgId;
  // }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }



}
