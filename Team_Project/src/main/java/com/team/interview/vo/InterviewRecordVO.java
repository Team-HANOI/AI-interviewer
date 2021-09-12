package com.team.interview.vo;

import java.sql.Date;
import java.util.List;

public class InterviewRecordVO {

  // id(pk)
  private int iRecordId;
  // 멘토 이메일(fk)
  private String mentorEmail;
  // 면접자 이메일(fk)
  private String email;
  // 면접 유형 id(fk)
  private int iTypeId;
  // 선택한 키워드
  private String chosenKw;
  // 선택한 직군
  private String chosenPos;
  // 등록일
  private Date regdate;
  // 수정일
  private Date updatedate;

  private String type;
  private List<AnswerVO> answerVOList;

  // 메모
  private String memo;

  public InterviewRecordVO() {
  }

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

  public List<AnswerVO> getAnswerVOList() {
    return answerVOList;
  }

  public void setAnswerVOList(List<AnswerVO> answerVOList) {
    this.answerVOList = answerVOList;
  }

  public String getType() {
    return type;
  }

  public void setType(String type) {
    this.type = type;
  }

  public String getMemo() {
    return memo;
  }

  public void setMemo(String memo) {
    this.memo = memo;
  }


}
