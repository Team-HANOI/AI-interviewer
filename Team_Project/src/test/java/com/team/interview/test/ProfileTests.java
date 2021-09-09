package com.team.interview.test;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Files;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.sql.DataSource;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.commons.io.IOUtils;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import com.team.interview.dao.CompanyDAO;
import com.team.interview.dao.MemberDAO;
import com.team.interview.dao.ProfileDAO;
import com.team.interview.vo.AuthVO;
import com.team.interview.vo.CompanyVO;
import com.team.interview.vo.MemberVO;
import com.team.interview.vo.ProfileVO;

@SpringBootTest
public class ProfileTests {

  @Autowired
  private MemberDAO memberDAO;

  @Autowired
  private CompanyDAO companyDAO;

  @Autowired
  private ProfileDAO profileDAO;

  @Autowired
  private PasswordEncoder passwordEncoder;

  @Autowired
  private DataSource ds;


  static String newDay(String jandi) {
    StringBuilder sb = new StringBuilder(jandi);
    int indexOfComma = sb.indexOf(",");
    sb.delete(0, indexOfComma + 1);
    sb.append(",0");
    jandi = sb.toString();

    return jandi;
  }

  static String interviewComplete(String jandi) {

    StringBuilder sb = new StringBuilder(jandi);
    int lastIndexOfComma = sb.lastIndexOf(",");
    String lastCount = sb.substring(lastIndexOfComma + 1, sb.length());
    int updatedCount = Integer.parseInt(lastCount) + 1;
    sb.replace(lastIndexOfComma + 1, sb.length(), String.valueOf(updatedCount));
    jandi = sb.toString();

    return jandi;
  }

  private String randomJandi(String jandi) {
    // TODO Auto-generated method stub
    return null;
  }


  // 자정에
  // db에서 String 가져와서 newDay 호출 return 받은 String을 db에 업데이트
  //  @Test
  public void testUpdateNewDayJandiForEachProfile() {

    int total = profileDAO.getMaxNumOfPfId();

    for (int i = 1; i <= total; i++) {
      ProfileVO profileVO = profileDAO.getProfile(i);
      if(profileVO == null) {
        continue;
      }
      String jandi = profileVO.getJandi();
      jandi = newDay(jandi);
      profileVO.setJandi(jandi);

      profileDAO.updateNewDayJandi(profileVO);
    }

  }

  //  @Test
  public void testInterviewComplete() {
    int total = profileDAO.getMaxNumOfPfId();

    for (int i = 1; i <= total; i++) {
      ProfileVO profileVO = profileDAO.getProfile(i);
      if(profileVO == null) {
        continue;
      }
      String jandi = profileVO.getJandi();
      jandi = interviewComplete(jandi);
      profileVO.setJandi(jandi);

      profileDAO.updateNewDayJandi(profileVO);
    }
  }

  @Test
  public void testUpdateRandomJandi() {
    // TODO Auto-generated method stub
  }



}


