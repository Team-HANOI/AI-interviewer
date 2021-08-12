package com.alpaca.app.security.service;

import com.alpaca.app.sample.domain.MemberVO;
import com.alpaca.app.sample.mapper.MemberMapper;
import com.alpaca.app.security.dto.AuthMemberDTO;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.stream.Collectors;

/**
 * Created by Hyunsik Lee on 2021-08-11
 * Blog : https://hs95blue.github.io/
 * Github : https://github.com/hs95blue
 */

@Log4j2
@Service
@RequiredArgsConstructor
public class CustomUserDetailsService implements UserDetailsService {
    private final MemberMapper mapper;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        log.info("CustomUserDetailsService loadUserByUsername" + username);
        MemberVO memberVO = mapper.findByEmail(username, false); // username이 실제로는 MemberVO에서 email을 의미.

        if(memberVO == null) {
            throw new UsernameNotFoundException("Check Email or Social ");
        }

        log.info("----------------------------");
        log.info(memberVO);

        AuthMemberDTO authMemberDTO = new AuthMemberDTO(
                memberVO.getEmail(),
                memberVO.getPassword(),
                memberVO.isFromSocial(),
                memberVO.isEnabled(),
                memberVO.getAuthList().stream()
                        .map(auth -> new SimpleGrantedAuthority(auth.getAuth()))
                        .collect(Collectors.toList()));


        authMemberDTO.setName(memberVO.getName());
        authMemberDTO.setFromSocial(memberVO.isFromSocial());

        return authMemberDTO;
    }
}
