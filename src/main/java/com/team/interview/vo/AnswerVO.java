package com.team.interview.vo;

import java.sql.Date;
import org.springframework.stereotype.Component;

@Component("answer")
public class AnswerVO{


  private int answerId;
  private int voiceNum;
  private int iRecordId;
  private int q_id;
  private String content;
  private int rCnt;
  private Date regdate;
  private Date updatedate;
  private int aIdSq;
  private int pfImgId;
  private String memberName;
  private String qContent;


  // 조인
  private QuestionVO questionVO;
  private FileVO fileVO;


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
  public int getQ_id() {
    return q_id;
  }
  public void setQ_id(int q_id) {
    this.q_id = q_id;
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
  public int getaIdSq() {
    return aIdSq;
  }
  public void setaIdSq(int aIdSq) {
    this.aIdSq = aIdSq;
  }
  public int getPfImgId() {
    return pfImgId;
  }
  public void setPfImgId(int pfImgId) {
    this.pfImgId = pfImgId;
  }
  public String getMemberName() {
    return memberName;
  }
  public void setMemberName(String memberName) {
    this.memberName = memberName;
  }
  public String getqContent() {
    return qContent;
  }
  public void setqContent(String qContent) {
    this.qContent = qContent;
  }
  public QuestionVO getQuestionVO() {
    return questionVO;
  }
  public void setQuestionVO(QuestionVO questionVO) {
    this.questionVO = questionVO;
  }
  public FileVO getFileVO() {
    return fileVO;
  }
  public void setFileVO(FileVO fileVO) {
    this.fileVO = fileVO;
  }



}