package com.team.interview.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Files;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import com.team.interview.dao.CompanyDAO;
import com.team.interview.dao.MemberDAO;
import com.team.interview.dao.ProfileDAO;
import com.team.interview.vo.AuthVO;
import com.team.interview.vo.CompanyVO;
import com.team.interview.vo.FileVO;
import com.team.interview.vo.MemberVO;
import com.team.interview.vo.ProfileVO;

@Service
public class MemberServiceImpl implements MemberService {
  @Autowired
  MemberDAO memberDAO;
  @Autowired
  ProfileDAO profileDAO;
  @Autowired
  CompanyDAO companyDAO;

  @Autowired
  private PasswordEncoder passwordEncoder;

  @Override
  public MemberVO findByEmail(String email, boolean fromSocial) {
    return memberDAO.findByEmail(email, fromSocial);
  }

  @Override
  public void joinIndv(MemberVO memberVO, MultipartFile pfImg) throws Exception {
    // 이름, 이메일, 비번만 날라옴
    memberVO.setPw(passwordEncoder.encode(memberVO.getPw()));
    memberVO.setFromSocial(false);
    memberVO.setType('M');

    File file = new File(new File("").getAbsolutePath() + "/src/main/resources/static/image/default_pf_img.jpg");
    //    File file = new File("image/default_pf_img.jpg");
    FileItem fileItem = new DiskFileItem("originFile", Files.probeContentType(file.toPath()), false, file.getName(), (int) file.length(), file.getParentFile());


    InputStream input = new FileInputStream(file);
    OutputStream os = fileItem.getOutputStream();
    IOUtils.copy(input, os);

    MultipartFile mFile = new CommonsMultipartFile(fileItem);

    FileVO newFile = new FileVO();
    newFile.setFileName(mFile.getOriginalFilename());
    newFile.setFileSize(mFile.getSize());
    newFile.setFileContentType(mFile.getContentType());
    newFile.setFileData(mFile.getBytes());
    profileDAO.selectPfImgNextval();
    profileDAO.insertProfileImage(newFile);


    // 첫 가입시 잔디 insert
    // "0,0,0, ... ,0" 을 db에 insert(0 364개 + , 363개 = length : 727)
    ProfileVO profileVO = new ProfileVO();
    StringBuilder sb = new StringBuilder();
    for (int i = 0; i < 364; i++) {
      if(i == 363) {
        sb.append(0);
      } else {
        sb.append(0).append(",");
      }
    }
    profileVO.setJandi(sb.toString());

    profileDAO.insertProfile(profileVO);


    memberDAO.insertMember(memberVO);

    AuthVO authVO = new AuthVO();
    authVO.setEmail(memberVO.getEmail());
    authVO.setAuth("ROLE_USER");// 일반 회원

    memberDAO.insertAuth(authVO);


  }

  @Override
  public void joinCom(MemberVO memberVO, MultipartFile logoImg) throws Exception {
    // 이름, 이메일, 비번, 이미지만 날라옴
    memberVO.setPw(passwordEncoder.encode(memberVO.getPw()));
    memberVO.setFromSocial(false);
    memberVO.setType('C');

    FileVO newFile = new FileVO();

    if(logoImg.getSize() == 0) { // 날라온게 없으면 디폴트 이미지로
      File file = new File(new File("").getAbsolutePath() + "/src/main/resources/static/image/default_pf_img.jpg");
      //      File file = new File("image/default_pf_img.jpg");
      FileItem fileItem = new DiskFileItem("originFile", Files.probeContentType(file.toPath()), false, file.getName(), (int) file.length(), file.getParentFile());


      InputStream input = new FileInputStream(file);
      OutputStream os = fileItem.getOutputStream();
      IOUtils.copy(input, os);
      MultipartFile mFile = new CommonsMultipartFile(fileItem);

      newFile.setFileName(mFile.getOriginalFilename());
      newFile.setFileSize(mFile.getSize());
      newFile.setFileContentType(mFile.getContentType());
      newFile.setFileData(mFile.getBytes());
    } else {
      newFile.setFileName(logoImg.getOriginalFilename());
      newFile.setFileSize(logoImg.getSize());
      newFile.setFileContentType(logoImg.getContentType());
      newFile.setFileData(logoImg.getBytes());

    }

    CompanyVO companyVO = new CompanyVO();
    companyVO.setEmail(memberVO.getEmail());
    companyVO.setcEmail(memberVO.getcEmail());
    companyVO.setcName(memberVO.getcName());

    AuthVO authVO = new AuthVO();
    authVO.setEmail(memberVO.getEmail());
    authVO.setAuth("ROLE_COMPANY");// 기업 회원

    profileDAO.selectPfImgNextval();
    profileDAO.insertProfileImage(newFile);


    // 첫 가입시 잔디 insert
    // "0,0,0, ... ,0" 을 db에 insert(0 364개 + , 363개 = length : 727)
    ProfileVO profileVO = new ProfileVO();
    StringBuilder sb = new StringBuilder();
    for (int i = 0; i < 364; i++) {
      if(i == 363) {
        sb.append(0);
      } else {
        sb.append(0).append(",");
      }
    }
    profileVO.setJandi(sb.toString());
    profileDAO.insertProfile(profileVO);



    companyDAO.selectLogoImgNextval();
    companyDAO.insertLogoImage(newFile);

    memberDAO.insertMember(memberVO);
    memberDAO.insertAuth(authVO);
    companyDAO.insertCompany(companyVO);
  }

  @Override
  public void updateMypageProfile(MemberVO memberVO, ProfileVO profileVO, MultipartFile pfImg)
      throws Exception {
    int pfId = memberDAO.findByEmail(memberVO.getEmail(), memberVO.isFromSocial()).getPfId();
    profileVO.setPfId(pfId);

    int pfImgId = profileDAO.getProfile(pfId).getPfImgId();
    FileVO newFile = null;
    newFile = new FileVO();
    newFile.setFileId(pfImgId);
    newFile.setFileName(pfImg.getOriginalFilename());
    newFile.setFileSize(pfImg.getSize());
    newFile.setFileContentType(pfImg.getContentType());
    newFile.setFileData(pfImg.getBytes());

    memberDAO.updateMypageProfile(memberVO);
    profileDAO.updateMypageProfile(profileVO);
    if(newFile.getFileSize() != 0) {
      profileDAO.updateMypageProfileImage(newFile);
    }
  }

}
