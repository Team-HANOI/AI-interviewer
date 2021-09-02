package com.team.interview.vo;

import java.util.Date;
import java.util.List;

public class MemberVO {
  private String email;
  private String name;
  private String password; 
  private Date regDate;
  private Date updateDate;
  private boolean enabled;
  private boolean fromSocial;
  private List<AuthVO> authList;

  public MemberVO() {
  }

  public String getEmail() {
    return email;
  }
  public void setEmail(String email) {
    this.email = email;
  }
  public String getName() {
    return name;
  }
  public void setName(String name) {
    this.name = name;
  }
  public String getPassword() {
    return password;
  }
  public void setPassword(String password) {
    this.password = password;
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
  public boolean isEnabled() {
    return enabled;
  }
  public void setEnabled(boolean enabled) {
    this.enabled = enabled;
  }
  public boolean isFromSocial() {
    return fromSocial;
  }
  public void setFromSocial(boolean fromSocial) {
    this.fromSocial = fromSocial;
  }
  public List<AuthVO> getAuthList() {
    return authList;
  }
  public void setAuthList(List<AuthVO> authList) {
    this.authList = authList;
  }


  protected boolean canEqual(Object other) {
    return other instanceof MemberVO;
  }

  @Override
  public String toString() {
    return "MemberVO [email=" + email + ", name=" + name + ", password=" + password + ", regDate="
        + regDate + ", updateDate=" + updateDate + ", enabled=" + enabled + ", fromSocial="
        + fromSocial + ", authList=" + authList + "]";
  }
  @Override
  public int hashCode() {
    final int prime = 31;
    int result = 1;
    result = prime * result + ((authList == null) ? 0 : authList.hashCode());
    result = prime * result + ((email == null) ? 0 : email.hashCode());
    result = prime * result + (enabled ? 1231 : 1237);
    result = prime * result + (fromSocial ? 1231 : 1237);
    result = prime * result + ((name == null) ? 0 : name.hashCode());
    result = prime * result + ((password == null) ? 0 : password.hashCode());
    result = prime * result + ((regDate == null) ? 0 : regDate.hashCode());
    result = prime * result + ((updateDate == null) ? 0 : updateDate.hashCode());
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
    if (email == null) {
      if (other.email != null)
        return false;
    } else if (!email.equals(other.email))
      return false;
    if (enabled != other.enabled)
      return false;
    if (fromSocial != other.fromSocial)
      return false;
    if (name == null) {
      if (other.name != null)
        return false;
    } else if (!name.equals(other.name))
      return false;
    if (password == null) {
      if (other.password != null)
        return false;
    } else if (!password.equals(other.password))
      return false;
    if (regDate == null) {
      if (other.regDate != null)
        return false;
    } else if (!regDate.equals(other.regDate))
      return false;
    if (updateDate == null) {
      if (other.updateDate != null)
        return false;
    } else if (!updateDate.equals(other.updateDate))
      return false;
    return true;
  }

}
