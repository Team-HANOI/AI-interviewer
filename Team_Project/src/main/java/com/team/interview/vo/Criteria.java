package com.team.interview.vo;

import org.springframework.web.util.UriComponentsBuilder;

public class Criteria {

  private int pageNum; // 현재 페이지 번호
  private int amount; // 한 페이지당 보여줄 데이터의 개수

  private String type;
  private String keyword;
  private String email; // 로그인 사용자 이메일

  public Criteria() {
    this(1, 10); // 기본값을 1 페이지, 10 amount로 하자
  }

  public Criteria(int pageNum, int amount) {
    this.pageNum = pageNum;
    this.amount = amount;
  }

  // 검색 조건이 T, W, C로 구성되어있으므로 검색 조건을 배열로 만들어서 한번에 처리하기 위함
  // getTypeArr()을 이용해서 MyBatis의 동적 태그를 활용하자
  public String[] getTypeArr() {
    return type == null ? new String[] {} : type.split("");
  }

  public String getListLink() {
    UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
        .queryParam("pageNum", this.getPageNum())
        .queryParam("amount", this.getAmount())
        .queryParam("type", this.getType())
        .queryParam("keyword", this.getKeyword());
    return builder.toUriString();
  }


  @Override
  public String toString() {
    return "Criteria [pageNum=" + pageNum + ", amount=" + amount + ", type=" + type + ", keyword="
        + keyword + ", email=" + email + "]";
  }

  public int getPageNum() {
    return pageNum;
  }

  public void setPageNum(int pageNum) {
    this.pageNum = pageNum;
  }

  public int getAmount() {
    return amount;
  }

  public void setAmount(int amount) {
    this.amount = amount;
  }

  public String getType() {
    return type;
  }

  public void setType(String type) {
    this.type = type;
  }

  public String getKeyword() {
    return keyword;
  }

  public void setKeyword(String keyword) {
    this.keyword = keyword;
  }

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }


}
