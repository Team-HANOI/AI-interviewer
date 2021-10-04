package com.team.interview.vo;

import java.util.Date;

public class CompanyVO{
  // 가입한 이메일(fk)
  private String email;
  // 로고 이미지Id(fk)
  private int logoImgId;
  // 회사 이메일
  private String cEmail;
  // 회사 이름
  private String cName;


  // 등록일
  private Date regdate;
  // 수정일
  private Date updatedate;

  public CompanyVO() {
  }

  protected boolean canEqual(Object other) {
    return other instanceof CompanyVO;
  }

  @Override
  public int hashCode() {
    final int prime = 31;
    int result = 1;
    result = prime * result + ((cEmail == null) ? 0 : cEmail.hashCode());
    result = prime * result + ((cName == null) ? 0 : cName.hashCode());
    result = prime * result + ((email == null) ? 0 : email.hashCode());
    result = prime * result + logoImgId;
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
    CompanyVO other = (CompanyVO) obj;
    if (cEmail == null) {
      if (other.cEmail != null)
        return false;
    } else if (!cEmail.equals(other.cEmail))
      return false;
    if (cName == null) {
      if (other.cName != null)
        return false;
    } else if (!cName.equals(other.cName))
      return false;
    if (email == null) {
      if (other.email != null)
        return false;
    } else if (!email.equals(other.email))
      return false;
    if (logoImgId != other.logoImgId)
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

  @Override
  public String toString() {
    return "CompanyVO [email=" + email + ", logoImgId=" + logoImgId + ", cEmail=" + cEmail
        + ", cName=" + cName + ", regdate=" + regdate + ", updatedate=" + updatedate + "]";
  }

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public int getLogoImgId() {
    return logoImgId;
  }

  public void setLogoImgId(int logoImgId) {
    this.logoImgId = logoImgId;
  }

  public String getcEmail() {
    return cEmail;
  }

  public void setcEmail(String cEmail) {
    this.cEmail = cEmail;
  }

  public String getcName() {
    return cName;
  }

  public void setcName(String cName) {
    this.cName = cName;
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
