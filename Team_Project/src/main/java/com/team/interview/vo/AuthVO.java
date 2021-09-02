package com.team.interview.vo;

public class AuthVO {
  private String email;
  private String auth;

  public AuthVO() {
  }

  public String getEmail() {
    return this.email;
  }

  public String getAuth() {
    return this.auth;
  }

  public void setEmail(final String email) {
    this.email = email;
  }

  public void setAuth(final String auth) {
    this.auth = auth;
  }


  protected boolean canEqual(final Object other) {
    return other instanceof AuthVO;
  }

  @Override
  public int hashCode() {
    final int prime = 31;
    int result = 1;
    result = prime * result + ((auth == null) ? 0 : auth.hashCode());
    result = prime * result + ((email == null) ? 0 : email.hashCode());
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
    AuthVO other = (AuthVO) obj;
    if (auth == null) {
      if (other.auth != null)
        return false;
    } else if (!auth.equals(other.auth))
      return false;
    if (email == null) {
      if (other.email != null)
        return false;
    } else if (!email.equals(other.email))
      return false;
    return true;
  }

  @Override
  public String toString() {
    return "AuthVO [email=" + email + ", auth=" + auth + "]";
  }


}
