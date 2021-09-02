package com.team.interview.security.dto;

import java.util.Collection;
import java.util.Map;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.oauth2.core.user.OAuth2User;

public class AuthMemberDTO extends User implements OAuth2User {

  private static final long serialVersionUID = 1L;

  private String email;
  private String password;
  private String name;
  private boolean fromSocial;
  private boolean enabled;

  private Map<String, Object> attr;



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
      boolean fromSocial,
      boolean enabled,
      Collection<? extends GrantedAuthority> authorities,
      Map<String, Object> attr) {
    this(username, password, fromSocial, enabled, authorities);
    this.attr = attr;
  }

  public AuthMemberDTO(
      String username, 
      String password, 
      boolean fromSocial,
      boolean enabled,
      Collection<? extends GrantedAuthority> authorities) {
    super(username, password, authorities);
    this.email = username;
    this.password = password;
    this.fromSocial = fromSocial;
    this.enabled = enabled;
  }

  @Override
  public Map<String, Object> getAttributes() {
    return this.attr;
  }

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  @Override
  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }

  @Override
  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public boolean isFromSocial() {
    return fromSocial;
  }

  public void setFromSocial(boolean fromSocial) {
    this.fromSocial = fromSocial;
  }

  @Override
  public boolean isEnabled() {
    return enabled;
  }

  public void setEnabled(boolean enabled) {
    this.enabled = enabled;
  }

  public Map<String, Object> getAttr() {
    return attr;
  }

  public void setAttr(Map<String, Object> attr) {
    this.attr = attr;
  }

  public static long getSerialversionuid() {
    return serialVersionUID;
  }

  @Override
  public String toString() {
    return "AuthMemberDTO [email=" + email + ", password=" + password + ", name=" + name
        + ", fromSocial=" + fromSocial + ", enabled=" + enabled + ", attr=" + attr + "]";
  }

}
