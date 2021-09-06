package com.team.interview.security.dto;

import java.util.Collection;
import java.util.Date;
import java.util.Map;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.oauth2.core.user.OAuth2User;

public class AuthMemberDTO extends User implements OAuth2User {

  private static final long serialVersionUID = 1L;

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
  //회원구분  일반:M 기업:C
  private char type;
  //잠금날짜 (몇시간 잠금했는지 판단할때 사용)
  private Date lockdate;
  //비밀번호 실패횟수
  private int failureCnt;

  //등록일
  private Date regdate;
  //수정일
  private Date updatedate;

  private Map<String, Object> attr;

  //기업 회원 관련 필드

  // 로고 이미지Id(fk)
  private int logoImgId;
  // 회사 이메일
  private String cEmail;
  // 회사 이름
  private String cName;



  //  private MemberVO member;
  //
  //  public AuthMemberDTO(MemberVO vo) {
  //
  //    super(vo.getEmail(), vo.getPassword(), vo.getAuthList().stream()
  //        .map(auth -> new SimpleGrantedAuthority(auth.getAuth())).collect(Collectors.toList()));
  //
  //    this.member = vo;
  //  }

  public AuthMemberDTO(
      String username,
      String password,
      int pfId,
      String name,
      String phoneNum,
      char type,
      Date lockdate,
      int failureCnt,
      boolean fromSocial,
      char enabled,
      int logoImgId,
      String cEmail,
      String cName,
      Date regdate,
      Date updatedate,
      Collection<? extends GrantedAuthority> authorities,
      Map<String, Object> attr) {
    this(username, password, pfId, name, phoneNum, type, lockdate, failureCnt, fromSocial, enabled, logoImgId, cEmail, cName, regdate, updatedate, authorities);
    this.attr = attr;
  }

  public AuthMemberDTO(
      String username,
      String password,
      int pfId,
      String name,
      String phoneNum,
      char type,
      Date lockdate,
      int failureCnt,
      boolean fromSocial,
      char enabled,
      int logoImgId,
      String cEmail,
      String cName,
      Date regdate,
      Date updatedate,
      Collection<? extends GrantedAuthority> authorities) {
    super(username, password, authorities);
    this.email = username;
    this.pw = password;
    this.pfId = pfId;
    this.name = name;
    this.phoneNum = phoneNum;
    this.type = type;
    this.lockdate = lockdate;
    this.failureCnt = failureCnt;
    this.fromSocial = fromSocial;
    this.enabled = enabled;
    this.logoImgId = logoImgId;
    this.cEmail = cEmail;
    this.cName = cName;
    this.regdate = regdate;
    this.updatedate = updatedate;
  }

  @Override
  public Map<String, Object> getAttributes() {
    return this.attr;
  }

  @Override
  public String toString() {
    return "AuthMemberDTO [email=" + email + ", pfId=" + pfId + ", pw=" + pw + ", name=" + name
        + ", enabled=" + enabled + ", fromSocial=" + fromSocial + ", phoneNum=" + phoneNum
        + ", type=" + type + ", lockdate=" + lockdate + ", failureCnt=" + failureCnt + ", regdate="
        + regdate + ", updatedate=" + updatedate + ", attr=" + attr + ", logoImgId=" + logoImgId
        + ", cEmail=" + cEmail + ", cName=" + cName + "]";
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

  @Override
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

  public Map<String, Object> getAttr() {
    return attr;
  }

  public void setAttr(Map<String, Object> attr) {
    this.attr = attr;
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

  public static long getSerialversionuid() {
    return serialVersionUID;
  }


}
