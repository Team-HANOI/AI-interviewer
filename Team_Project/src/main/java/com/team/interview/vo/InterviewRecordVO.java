package com.team.interview.vo;

import java.sql.Date;

public class InterviewRecordVO {

  private int iRecordId;
  private String mentorEmail;
  private String email;
  private int iTypeId;
  private String chosenKw;
  private String chosenPos;
  private Date regdate;
  private Date updatedate;

  public InterviewRecordVO() {
  }

  protected boolean canEqual(Object other) {
    return other instanceof MemberVO;
  }

  @Override
  public String toString() {
    return "InterviewRecordVO [iRecordId=" + iRecordId + ", mentorEmail=" + mentorEmail + ", email="
        + email + ", iTypeId=" + iTypeId + ", chosenKw=" + chosenKw + ", chosenPos=" + chosenPos
        + ", regdate=" + regdate + ", updatedate=" + updatedate + "]";
  }

  @Override
  public int hashCode() {
    final int prime = 31;
    int result = 1;
    result = prime * result + ((chosenKw == null) ? 0 : chosenKw.hashCode());
    result = prime * result + ((chosenPos == null) ? 0 : chosenPos.hashCode());
    result = prime * result + ((email == null) ? 0 : email.hashCode());
    result = prime * result + iRecordId;
    result = prime * result + iTypeId;
    result = prime * result + ((mentorEmail == null) ? 0 : mentorEmail.hashCode());
    result = prime * result + ((regdate == null) ? 0 : regdate.hashCode());
    result = prime * result + ((updatedate == null) ? 0 : updatedate.hashCode());
    return result;
  }

  @Override
  public boolean equals(Object obj) {
    if (this == obj)
      return true;
    if (obj == null)
      return false;
    if (getClass() != obj.getClass())
      return false;
    InterviewRecordVO other = (InterviewRecordVO) obj;
    if (chosenKw == null) {
      if (other.chosenKw != null)
        return false;
    } else if (!chosenKw.equals(other.chosenKw))
      return false;
    if (chosenPos == null) {
      if (other.chosenPos != null)
        return false;
    } else if (!chosenPos.equals(other.chosenPos))
      return false;
    if (email == null) {
      if (other.email != null)
        return false;
    } else if (!email.equals(other.email))
      return false;
    if (iRecordId != other.iRecordId)
      return false;
    if (iTypeId != other.iTypeId)
      return false;
    if (mentorEmail == null) {
      if (other.mentorEmail != null)
        return false;
    } else if (!mentorEmail.equals(other.mentorEmail))
      return false;
    if (regdate == null) {
      if (other.regdate != null)
        return false;
    } else if (!regdate.equals(other.regdate))
      return false;
    if (updatedate == null) {
      if (other.updatedate != null)
        return false;
    } else if (!updatedate.equals(other.updatedate))
      return false;
    return true;
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

}
