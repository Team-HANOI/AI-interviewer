package com.alpaca.app.sample.mapper;

import com.alpaca.app.sample.domain.AuthVO;
import com.alpaca.app.sample.domain.MemberVO;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

/**
 * Created by Hyunsik Lee on 2021-08-11
 * Blog : https://hs95blue.github.io/
 * Github : https://github.com/hs95blue
 */

@Mapper
@Repository
public interface MemberMapper {

    /**
     * 회원가입 시 회원 저장
     *
     * @param member
     * @return 성공 횟수
     */
    int saveMember(MemberVO member);

    /**
     * 회원가입 시 회원 권한 저장
     * 1 대 다로 별개의 테이블에 저장됨
     *
     * @param authVO
     * @return 성공횟수
     */
    @Insert("INSERT INTO TBL_SEC_MEMBER_AUTH VALUES (#{email}, #{auth})")
    int saveAuth(AuthVO authVO);

    /**
     * 로그인 시 : 회원 정보 가져옴
     * 회원가입 시 : 아이디 존재 여부 체크
     * @param email
     * @param fromSocial
     * @return 회원 모델 객체
     */
    MemberVO findByEmail(@Param("email") String email, @Param("fromSocial") boolean fromSocial);



}
