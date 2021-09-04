package com.team.interview.security.service;

import java.util.stream.Collectors;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import com.team.interview.dao.CompanyDAO;
import com.team.interview.dao.MemberDAO;
import com.team.interview.security.dto.AuthMemberDTO;
import com.team.interview.vo.CompanyVO;
import com.team.interview.vo.MemberVO;

@Service
public class CommonUserDetailsService implements UserDetailsService{

  private final MemberDAO memberDAO;
  private final CompanyDAO companyDAO;

  public CommonUserDetailsService(final MemberDAO memberDAO, final CompanyDAO companyDAO) {
    this.memberDAO = memberDAO;
    this.companyDAO = companyDAO;
  }

  @Override
  public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
    System.out.println("CustomUserDetailsService loadUserByUsername: " + username);
    MemberVO memberVO = memberDAO.findByEmail(username, false); // username이 실제로는 MemberVO에서 email을 의미.

    if(memberVO == null) {
      throw new UsernameNotFoundException("Check Email or Social ");
    }

    if(memberVO.getType() == 'C') {
      CompanyVO companyVO = companyDAO.findByEmail(username);
      memberVO.setLogoImgId(companyVO.getLogoImgId());
      memberVO.setcEmail(companyVO.getcEmail());
      memberVO.setcName(companyVO.getcName());
    }

    System.out.println("----------------------------");
    System.out.println(memberVO);

    AuthMemberDTO authMemberDTO = new AuthMemberDTO(
        memberVO.getEmail(),
        memberVO.getPw(),
        memberVO.getPfId(),
        memberVO.getName(),
        memberVO.getPhoneNum(),
        memberVO.getType(),
        memberVO.getLockdate(),
        memberVO.getFailureCnt(),
        true, // fromSocial
        memberVO.getEnabled(),
        memberVO.getLogoImgId(),
        memberVO.getcEmail(),
        memberVO.getcName(),
        memberVO.getAuthList().stream()
        .map(auth -> new SimpleGrantedAuthority(auth.getAuth())).collect(Collectors.toList()));
    authMemberDTO.setName(memberVO.getName());
    authMemberDTO.setFromSocial(memberVO.isFromSocial());

    return authMemberDTO;
  }
}
