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

    // 이메일(아이디)
    private String email;
    // 이름(닉네임)
    private String name;
    // 비밀번호
    private String password;
    // 저장날짜
    private Date regDate;
    // 수정날짜
    private Date updateDate;
    // 활성화 여부
    private boolean enabled;
    // 소셜 여부
    private boolean fromSocial;
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
    private Set<MemberRole> roleSet = new HashSet<>();

    public void addMemberRole(MemberRole clubMemberRole){
        roleSet.add(clubMemberRole);
    }

}
