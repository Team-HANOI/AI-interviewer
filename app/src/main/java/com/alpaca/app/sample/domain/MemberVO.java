package com.alpaca.app.sample.domain;

import lombok.*;

import java.util.*;

/**
 * Created by Hyunsik Lee on 2021-08-11
 * Blog : https://hs95blue.github.io/
 * Github : https://github.com/hs95blue
 */
@Builder
@ToString(exclude = "roleSet")
@NoArgsConstructor
@AllArgsConstructor
@Data
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
    //회원구분  일반:M 기업:C
    //private char type;
    //잠금날짜 (몇시간 잠금했는지 판단할때 사용)
    private Date lockdate;
    //비밀번호 실패횟수
    private int failureCnt;

    //등록일
    private Date regdate;
    //수정일
    private Date updatedate;
    // 권한 목록( 한 아이디가 여러개의 권한 가질 수 있음.)
    /*@Builder.Default
    private List<AuthVO> authList = new ArrayList<>();*/

    /**
     *  setter 대신 사용, 조회할 때 쓰면될 듯.
     *  아직은 좀 헷갈림.
     * @param  auth 권한 객체
     */
    /*public void addAuthList(AuthVO auth){
        this.authList.add(auth);
    }*/


    @Builder.Default
    private Set<AuthVO> roleSet = new HashSet<>();

    public void addMemberRole(AuthVO authVO){
        roleSet.add(authVO);
    }

}
