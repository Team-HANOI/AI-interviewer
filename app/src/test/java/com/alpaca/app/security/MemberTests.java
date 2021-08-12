package com.alpaca.app.security;

import com.alpaca.app.sample.domain.AuthVO;
import com.alpaca.app.sample.domain.MemberVO;
import com.alpaca.app.sample.mapper.MemberMapper;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.util.stream.IntStream;

/**
 * Created by Hyunsik Lee on 2021-08-11
 * Blog : https://hs95blue.github.io/
 * Github : https://github.com/hs95blue
 */


@SpringBootTest
public class MemberTests {

    @Autowired
    private MemberMapper mapper;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Test
    public void insertDummies() {
    //1 - 80까지는 USER만 지정
    //81- 90까지는 USER,MANAGER
    //91- 100까지는 USER,MANAGER,ADMIN

        IntStream.rangeClosed(1,100).forEach(i -> {
        MemberVO member = MemberVO.builder()
                .email("user"+i+"@hyunsik.com")
                .name("사용자"+i)
                .fromSocial(false)
                .password(  passwordEncoder.encode("1111") )
                .build();
        //default role
        AuthVO authVO = new AuthVO();
        authVO.setEmail(member.getEmail());
        authVO.setAuth("ROLE_USER");

        if(i > 80){
          authVO.setAuth("ROLE_MANAGER");
        }

        if(i > 90){
          authVO.setAuth("ROLE_ADMIN");
        }

        mapper.saveMember(member);
        mapper.saveAuth(authVO);
    });

}

    @Test
    public void testRead() {

        MemberVO result = mapper.findByEmail("user95@hyunsik.com", false);

        System.out.println(result);

    }

}
