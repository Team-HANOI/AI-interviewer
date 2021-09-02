package com.team.interview.security.service;

import java.util.ArrayList;
import java.util.stream.Collectors;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;
import com.team.interview.dao.MemberDAO;
import com.team.interview.security.dto.AuthMemberDTO;
import com.team.interview.vo.AuthVO;
import com.team.interview.vo.MemberVO;

@Service
public class CustomOAuth2UserDetailsService extends DefaultOAuth2UserService {

  private final MemberDAO memberDAO;
  private final PasswordEncoder passwordEncoder;
  
  public CustomOAuth2UserDetailsService(final MemberDAO memberDAO, final PasswordEncoder passwordEncoder) {
    this.memberDAO = memberDAO;
    this.passwordEncoder = passwordEncoder;
}

  @Override
  public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {

    System.out.println("---------------------------");
    System.out.println("userRequest:" + userRequest); // org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest 객체
    String clientName = userRequest.getClientRegistration().getClientName();
    System.out.println("clientName: " + clientName); // Google로 출력
    System.out.println(userRequest.getAdditionalParameters());

    OAuth2User oAuth2User = super.loadUser(userRequest);

    System.out.println("==========================");
    oAuth2User.getAttributes().forEach((k,v) -> { // sub, picture, email, email_verified, EMAIL 등이 출력
      System.out.println(k + ":" + v);
    });

    String email = null;

    if(clientName.equals("Google")) {
      email = oAuth2User.getAttribute("email");
    }

    System.out.println("EMAIL: " + email);

    //        MemberVO memberVO = saveSocialMember(email); // 조금 뒤에 사용
    //
    //        return oAuth2User;

    MemberVO member = saveSocialMember(email);
    AuthMemberDTO authMember = new AuthMemberDTO(
        member.getEmail(),
        member.getPassword(),
        true,
        member.isEnabled(),
        member.getAuthList().stream().map(
            authVO -> new SimpleGrantedAuthority(authVO.getAuth()))
        .collect(Collectors.toList()),
        oAuth2User.getAttributes()
        );
    authMember.setName(member.getName()); // 왜 생성자로 안넣고 세터로 넣는가?

    return authMember;
  }

  private MemberVO saveSocialMember(String email) {
    // 기존에 동일한 이메일로 가입한 회원이 있는 경우 그대로 조회만
    MemberVO memberVO = memberDAO.findByEmail(email, true);

    if(memberVO != null) {
      return memberVO;
    }

    // 없다면 회원 추가 패스워드는 1111 이름은 그냥 이메일 주소로(뒤에서 true?로 처리함)
    MemberVO memberVO1 = new MemberVO();
    memberVO1.setEmail(email);
    memberVO1.setName(email);
    memberVO1.setPassword(passwordEncoder.encode("1111"));
    memberVO1.setFromSocial(true);

    memberDAO.insertMember(memberVO1);

    AuthVO authVO1 = new AuthVO();
    authVO1.setEmail(email);
    authVO1.setAuth("ROLE_USER");

    memberDAO.insertAuth(authVO1);

    ArrayList<AuthVO> authVOs = new ArrayList<>();
    authVOs.add(authVO1);
    memberVO1.setAuthList(authVOs);

    return memberVO1;
  }
}
