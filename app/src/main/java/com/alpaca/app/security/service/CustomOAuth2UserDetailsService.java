package com.alpaca.app.security.service;

import com.alpaca.app.sample.domain.AuthVO;
import com.alpaca.app.sample.domain.MemberVO;
import com.alpaca.app.sample.mapper.MemberMapper;
import com.alpaca.app.security.dto.AuthMemberDTO;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

import java.util.stream.Collectors;

/**
 * 소셜로그인 시 가져온 사용자 정보를 핸들링(커스텀한 회원정보모델에 넣어 주고, DB에 저장)
 *
 * Created by Hyunsik Lee on 2021-08-11
 * Blog : https://hs95blue.github.io/
 * Github : https://github.com/hs95blue
 */


@Log4j2
@Service
@RequiredArgsConstructor
public class CustomOAuth2UserDetailsService extends DefaultOAuth2UserService {

    private final MemberMapper mapper;
    private final PasswordEncoder passwordEncoder;

    @Override
    public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {

        log.info("---------------------------");
        log.info("userRequest:" + userRequest); // org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest 객체
        String clientName = userRequest.getClientRegistration().getClientName();
        log.info("clientName: " + clientName); // Google로 출력
        log.info(userRequest.getAdditionalParameters());

        OAuth2User oAuth2User = super.loadUser(userRequest);

        log.info("==========================");
        oAuth2User.getAttributes().forEach((k,v) -> { // sub, picture, email, email_verified, EMAIL 등이 출력
            log.info(k + ":" + v);
        });

        String email = null;

        if(clientName.equals("Google")) {
            email = oAuth2User.getAttribute("email");
        }

        log.info("EMAIL: " + email);

       // MemberVO memberVO = saveSocialMember(email);

       // return oAuth2User;
        MemberVO memberVO = saveSocialMember(email);
        AuthMemberDTO authMemberDTO = new AuthMemberDTO(
                memberVO.getEmail(),
                memberVO.getPassword(),
                true,
                true,
                memberVO.getAuthList().stream().map(
                        role -> new SimpleGrantedAuthority("ROLE_"+ role.getAuth()))
                        .collect(Collectors.toList()),
                oAuth2User.getAttributes()
        );
        authMemberDTO.setName(memberVO.getName());
        return authMemberDTO;
    }

    private MemberVO saveSocialMember(String email) {
        // 기존에 동일한 이메일로 가입한 회원이 있는 경우 그대로 조회만
        MemberVO memberVO = mapper.findByEmail(email, true);

        if(memberVO != null) {
            return memberVO;
        }

        MemberVO newMember = MemberVO.builder().email(email)
                .name(email)
                .password(passwordEncoder.encode("1111"))
                .fromSocial(true)
                .build();

        AuthVO authVO = AuthVO.builder().email(email).auth("ROLE_USER").build();

        mapper.saveMember(newMember);
        mapper.saveAuth(authVO);

        return newMember;
    }

}
