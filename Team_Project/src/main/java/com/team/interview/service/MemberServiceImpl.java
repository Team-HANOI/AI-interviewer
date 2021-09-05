package com.team.interview.service;

import java.io.IOException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import com.team.interview.dao.MemberDAO;
import com.team.interview.vo.AuthVO;
import com.team.interview.vo.CompanyVO;
import com.team.interview.vo.FileVO;
import com.team.interview.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService{
  @Autowired
  MemberDAO memberDAO;

  @Autowired
  private PasswordEncoder passwordEncoder;

  @Override
  public MemberVO findByEmail(String email, boolean fromSocial) {
    return memberDAO.findByEmail(email, fromSocial);
  }

  @Override
  public void joinIndv(MemberVO memberVO, MultipartFile pfImg) throws IOException {
    // 이름, 이메일, 비번만 날라옴
    memberVO.setPw(passwordEncoder.encode(memberVO.getPw()));
    memberVO.setFromSocial(false);
    memberVO.setType('M');

    FileVO newFile = new FileVO();
    newFile.setFileName(pfImg.getOriginalFilename());
    newFile.setFileSize(pfImg.getSize());
    newFile.setFileContentType(pfImg.getContentType());
    newFile.setFileData(pfImg.getBytes());

    memberDAO.insertMember(memberVO);

    AuthVO authVO = new AuthVO();
    authVO.setEmail(memberVO.getEmail());
    authVO.setAuth("ROLE_USER");// 일반 회원

    memberDAO.insertAuth(authVO);


  }

  @Override
  public void joinCom(MemberVO memberVO) {
    // 이름, 이메일, 비번만 날라옴
    System.out.println(memberVO.getEmail());
    memberVO.setPw(passwordEncoder.encode(memberVO.getPw()));
    memberVO.setFromSocial(false);
    memberVO.setType('C');

    CompanyVO companyVO = new CompanyVO();
    companyVO.setEmail(memberVO.getEmail());
    companyVO.setcEmail(memberVO.getcEmail());
    companyVO.setcName(memberVO.getcName());

    AuthVO authVO = new AuthVO();
    authVO.setEmail(memberVO.getEmail());
    authVO.setAuth("ROLE_COMPANY");// 기업 회원

    memberDAO.insertMember(memberVO);
    memberDAO.insertAuth(authVO);
    memberDAO.insertCompany(companyVO);


  }

}
