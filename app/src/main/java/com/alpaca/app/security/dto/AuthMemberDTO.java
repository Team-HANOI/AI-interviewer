package com.alpaca.app.security.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import lombok.extern.log4j.Log4j2;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.oauth2.core.user.OAuth2User;

import java.util.*;
import java.util.Collection;
import java.util.Map;

/**
 * 기존 스프링 시큐리티의 회원정보를 저장하는 객체는 User,
 * 서비스에 맞게 username이외의 정보도 가져오기 위해서 커스텀한 데이터 주머니.
 * User에 username, password, authorities만 넘겨주고 나머지는 setter로 넣어준다.
 *
 *
 *
 * Created by Hyunsik Lee on 2021-08-11
 * Blog : https://hs95blue.github.io/
 * Github : https://github.com/hs95blue
 */


@Log4j2
@Getter
@Setter
@ToString
public class AuthMemberDTO extends User implements OAuth2User {

    // 몰라.. 이게뭐야?
    private static final long serialVersionUID = 1L;
    //
    //이메일
    private String email;
    //프로필id
    private String pfId;
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
    //  private MemberVO member;
    //
    //  public AuthMemberDTO(MemberVO vo) {
    //
    //    super(vo.getEmail(), vo.getPassword(), vo.getAuthList().stream()
    //        .map(auth -> new SimpleGrantedAuthority(auth.getAuth())).collect(Collectors.toList()));
    //
    //    this.member = vo;
    //  }

    /**
     * 소셜로그인 시 map형식의 데이터를 받기위한 생성자, 다른 생성자를 호출한다.
     * @param username
     * @param password
     * @param fromSocial
     * @param enabled
     * @param authorities
     * @param attr
     */
    public AuthMemberDTO(
            String username,
            String password,
            int pfId,
            String name,
            String phoneNum,
//            char type,
            Date lockdate,
            int failureCnt,
            boolean fromSocial,
            char enabled,
            Collection<? extends GrantedAuthority> authorities,
            Map<String, Object> attr) {
            this(username, password, pfId, name, phoneNum, lockdate, failureCnt, fromSocial, enabled, authorities);
            this.attr = attr;
    }

    /**
     * User에 들어갈 데이터이외에도 커스텀한 데이터를 넣기위한 생성자, User에 필요한 정보는 Super 생성자로 넣어준다.
     * @param username
     * @param password
     * @param fromSocial
     * @param enabled
     * @param authorities
     */
    public AuthMemberDTO(
            String username,
            String password,
            int pfId,
            String name,
            String phoneNum,
           // char type,
            Date lockdate,
            int failureCnt,
            boolean fromSocial,
            char enabled,
            Collection<? extends GrantedAuthority> authorities) {
        super(username, password, authorities);
        this.email = username;
        this.pw = password;
        this.fromSocial = fromSocial;
        this.enabled = enabled;
    }

    @Override
    public String getPassword() {
        return this.getPw();
    }

    @Override
    public Map<String, Object> getAttributes() {
        return null;
    }
}
