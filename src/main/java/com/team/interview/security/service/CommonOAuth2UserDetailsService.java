package com.team.interview.security.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.StringTokenizer;
import java.util.stream.Collectors;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.commons.io.IOUtils;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import com.team.interview.dao.MemberDAO;
import com.team.interview.dao.ProfileDAO;
import com.team.interview.security.dto.AuthMemberDTO;
import com.team.interview.vo.AuthVO;
import com.team.interview.vo.FileVO;
import com.team.interview.vo.MemberVO;

@Service
public class CommonOAuth2UserDetailsService extends DefaultOAuth2UserService {

  private final MemberDAO memberDAO;
  private final ProfileDAO profileDAO;
  private final PasswordEncoder passwordEncoder;

  public CommonOAuth2UserDetailsService(final MemberDAO memberDAO, final ProfileDAO profileDAO, final PasswordEncoder passwordEncoder) {
    this.memberDAO = memberDAO;
    this.passwordEncoder = passwordEncoder;
    this.profileDAO =  profileDAO;
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

    MemberVO memberVO = saveSocialMember(email, oAuth2User);
    AuthMemberDTO authMember = new AuthMemberDTO(
        memberVO.getEmail(),
        memberVO.getPw(),
        memberVO.getPfId(),
        memberVO.getName(),
        memberVO.getPhoneNum(),
        memberVO.getType(),
        memberVO.getLockdate(),
        0, // failureCnt
        true, // fromSocial
        'E', // enabled
        memberVO.getLogoImgId(),
        memberVO.getcEmail(),
        memberVO.getcName(),
        memberVO.getRegdate(),
        memberVO.getUpdatedate(),
        memberVO.getAuthList().stream().map(
            authVO -> new SimpleGrantedAuthority(authVO.getAuth()))
        .collect(Collectors.toList()),
        oAuth2User.getAttributes()
        );
    authMember.setName(memberVO.getName()); // 왜 생성자로 안넣고 세터로 넣는가?

    return authMember;
  }

  private MemberVO saveSocialMember(String email, OAuth2User oAuth2User){
    // 기존에 동일한 이메일로 가입한 회원이 있는 경우 그대로 조회만
    MemberVO memberVO = memberDAO.findByEmail(email, true);

    if(memberVO != null) {
      return memberVO;
    }

    // 없다면 회원 추가 패스워드는 1111 이름은 그냥 이메일 주소로(뒤에서 true?로 처리함)
    MemberVO newMemberVO = new MemberVO();
    StringTokenizer st = new StringTokenizer(email, "@");
    newMemberVO.setEmail(email);
    newMemberVO.setName(st.nextToken());
    newMemberVO.setPw(passwordEncoder.encode("1111"));
    newMemberVO.setFromSocial(true);
    newMemberVO.setType('M');

    memberDAO.insertSocialMember(newMemberVO);

    AuthVO authVO1 = new AuthVO();
    authVO1.setEmail(email);
    authVO1.setAuth("ROLE_USER");

    memberDAO.insertAuth(authVO1);

    ArrayList<AuthVO> authVOs = new ArrayList<>();
    authVOs.add(authVO1);
    newMemberVO.setAuthList(authVOs);
    return newMemberVO;

  }
}
