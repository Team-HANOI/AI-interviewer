package com.team.interview.vo;

import java.util.Date;
import java.util.List;

public class MemberVO {
  //이메일
  private String email;
  //프로필id
  private int pfId;
  //패스워드
  private String pw;
  //이름
  private String name;
  //회원상태 / 활성화:E 비활성화(탈퇴):D 잠금:L 비활성화(휴면):S
  private char enabled;
  //소셜로그인 여부 true:1 false:0
  private boolean fromSocial;
  //전화번호(핸드폰)
  private String phoneNum;
  //회원구분  일반:M 기업:C 관리자:A
  private char type;
  //잠금날짜 (몇시간 잠금했는지 판단할때 사용)
  private Date lockdate;
  //비밀번호 실패횟수
  private int failureCnt;
  //등록일
  private Date regdate;
  //수정일
  private Date updatedate;

  private List<AuthVO> authList;


  // 기업 회원 컬럼

  // 로고 이미지Id(fk)
  private String logoImgId;
  // 회사 이메일
  private String cEmail;
  // 회사 이름
  private String cName;

  public MemberVO() {
  }
  protected boolean canEqual(Object other) {
    return other instanceof MemberVO;
  }
  @Override
  public int hashCode() {
    final int prime = 31;
    int result = 1;
    result = prime * result + ((authList == null) ? 0 : authList.hashCode());
    result = prime * result + ((cEmail == null) ? 0 : cEmail.hashCode());
    result = prime * result + ((cName == null) ? 0 : cName.hashCode());
    result = prime * result + ((email == null) ? 0 : email.hashCode());
    result = prime * result + enabled;
    result = prime * result + failureCnt;
    result = prime * result + (fromSocial ? 1231 : 1237);
    result = prime * result + ((lockdate == null) ? 0 : lockdate.hashCode());
    result = prime * result + ((logoImgId == null) ? 0 : logoImgId.hashCode());
    result = prime * result + ((name == null) ? 0 : name.hashCode());
    result = prime * result + pfId;
    result = prime * result + ((phoneNum == null) ? 0 : phoneNum.hashCode());
    result = prime * result + ((pw == null) ? 0 : pw.hashCode());
    result = prime * result + ((regdate == null) ? 0 : regdate.hashCode());
    result = prime * result + type;
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
    MemberVO other = (MemberVO) obj;
    if (authList == null) {
      if (other.authList != null)
        return false;
    } else if (!authList.equals(other.authList))
      return false;
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
    if (enabled != other.enabled)
      return false;
    if (failureCnt != other.failureCnt)
      return false;
    if (fromSocial != other.fromSocial)
      return false;
    if (lockdate == null) {
      if (other.lockdate != null)
        return false;
    } else if (!lockdate.equals(other.lockdate))
      return false;
    if (logoImgId == null) {
      if (other.logoImgId != null)
        return false;
    } else if (!logoImgId.equals(other.logoImgId))
      return false;
    if (name == null) {
      if (other.name != null)
        return false;
    } else if (!name.equals(other.name))
      return false;
    if (pfId != other.pfId)
      return false;
    if (phoneNum == null) {
      if (other.phoneNum != null)
        return false;
    } else if (!phoneNum.equals(other.phoneNum))
      return false;
    if (pw == null) {
      if (other.pw != null)
        return false;
    } else if (!pw.equals(other.pw))
      return false;
    if (regdate == null) {
      if (other.regdate != null)
        return false;
    } else if (!regdate.equals(other.regdate))
      return false;
    if (type != other.type)
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
    return "MemberVO [email=" + email + ", pfId=" + pfId + ", pw=" + pw + ", name=" + name
        + ", enabled=" + enabled + ", fromSocial=" + fromSocial + ", phoneNum=" + phoneNum
        + ", type=" + type + ", lockdate=" + lockdate + ", failureCnt=" + failureCnt + ", regdate="
        + regdate + ", updatedate=" + updatedate + ", authList=" + authList + ", logoImgId="
        + logoImgId + ", cEmail=" + cEmail + ", cName=" + cName + "]";
  }
  public String getEmail() {
    return email;
  }
  public void setEmail(String email) {
    this.email = email;
  }
  public int getPfId() {
    return pfId;
  }
  public void setPfId(int pfId) {
    this.pfId = pfId;
  }
  public String getPw() {
    return pw;
  }
  public void setPw(String pw) {
    this.pw = pw;
  }
  public String getName() {
    return name;
  }
  public void setName(String name) {
    this.name = name;
  }
  public char getEnabled() {
    return enabled;
  }
  public void setEnabled(char enabled) {
    this.enabled = enabled;
  }
  public boolean isFromSocial() {
    return fromSocial;
  }
  public void setFromSocial(boolean fromSocial) {
    this.fromSocial = fromSocial;
  }
  public String getPhoneNum() {
    return phoneNum;
  }
  public void setPhoneNum(String phoneNum) {
    this.phoneNum = phoneNum;
  }
  public char getType() {
    return type;
  }
  public void setType(char type) {
    this.type = type;
  }
  public Date getLockdate() {
    return lockdate;
  }
  public void setLockdate(Date lockdate) {
    this.lockdate = lockdate;
  }
  public int getFailureCnt() {
    return failureCnt;
  }
  public void setFailureCnt(int failureCnt) {
    this.failureCnt = failureCnt;
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
  public List<AuthVO> getAuthList() {
    return authList;
  }
  public void setAuthList(List<AuthVO> authList) {
    this.authList = authList;
  }
  public String getLogoImgId() {
    return logoImgId;
  }
  public void setLogoImgId(String logoImgId) {
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
}
