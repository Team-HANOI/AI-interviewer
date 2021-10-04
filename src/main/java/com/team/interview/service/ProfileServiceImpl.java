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
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import com.team.interview.dao.MemberDAO;
import com.team.interview.dao.ProfileDAO;
import com.team.interview.vo.FileVO;
import com.team.interview.vo.MemberVO;
import com.team.interview.vo.ProfileVO;

@Service
public class ProfileServiceImpl implements ProfileService{

  @Autowired
  MemberDAO memberDAO;

  @Autowired
  private ProfileDAO profileDAO;

  @Override
  public FileVO getFile(int fileId) throws Exception{
    return profileDAO.getFile(fileId);
  }


  @Override
  public ProfileVO getProfile(int pfId, String email) throws Exception {
    ProfileVO profile = profileDAO.getProfile(pfId);

    // 프로필이 없으면 프로필, 프로필 이미지를 insert해준다.
    if(profile == null) {
       File file = new File(new File("").getAbsolutePath() + "/src/main/resources/static/image/default_pf_img.jpg");
//      File file = new File("/image/default_pf_img.jpg");
      FileItem fileItem = new DiskFileItem("originFile", Files.probeContentType(file.toPath()), false, file.getName(), (int) file.length(), file.getParentFile());

      InputStream input = new FileInputStream(file);
      OutputStream os = fileItem.getOutputStream();
      IOUtils.copy(input, os);
      // Or faster..
      // IOUtils.copy(new FileInputStream(file), fileItem.getOutputStream());

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

      // member테이블에 pf_id가 null이니까 update해준다
      // 방금 profile 만들었으니까 currval을 사용한다
      memberDAO.updatePfIdByEmail(email);

      // 멤버 가져와서 pfId 가져온다
      MemberVO member = memberDAO.findByEmail(email, true);
      // 다시 getProfile 가져와서 리턶난다
      return profileDAO.getProfile(member.getPfId());
    }

    return profile;
  }

}
