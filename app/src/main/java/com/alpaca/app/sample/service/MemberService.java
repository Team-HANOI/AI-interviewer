package com.alpaca.app.sample.service;

import com.alpaca.app.sample.domain.MemberVO;
import com.alpaca.app.sample.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Hyunsik Lee on 2021-09-01.
 * Blog : https://hs95blue.github.io/
 * Github : https://github.com/hs95blue
 */
@Service
public class MemberService {
    @Autowired
    MemberMapper mapper;

    public MemberVO findByEmail(String email, boolean fromSocial) {
        return mapper.findByEmail(email, fromSocial);
    }

}
