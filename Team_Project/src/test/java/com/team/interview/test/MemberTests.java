package com.team.interview.test;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Files;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Iterator;
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
import com.team.interview.vo.AuthVO;
import com.team.interview.vo.CompanyVO;
import com.team.interview.vo.FileVO;
import com.team.interview.vo.MemberVO;

@SpringBootTest
public class MemberTests {

  @Autowired
  private MemberDAO memberDAO;

  @Autowired
  private CompanyDAO companyDAO;

  @Autowired
  private PasswordEncoder passwordEncoder;

  @Autowired
  private DataSource ds;


  //  @Test
  public void insertDummies() {
    // 1 - 90까지는 USER
    // 91- 100까지는 USER,COMPANY,ADMIN

    for (int i = 1; i <= 100; i++) {
      MemberVO memberVO = new MemberVO();
      memberVO.setEmail("user" + i + "@alpaca.com");
      memberVO.setPw(passwordEncoder.encode("1111"));
      memberVO.setName("사용자" + i);
      memberVO.setFromSocial(false);
      memberVO.setType('M');
      // default role
      AuthVO authVO = new AuthVO();
      authVO.setEmail(memberVO.getEmail());
      authVO.setAuth("ROLE_USER");// 일반 회원

      if (i > 80 && i <= 90) {
        CompanyVO companyVO = new CompanyVO();
        memberVO.setType('C');

        companyVO.setEmail(memberVO.getEmail());
        companyVO.setcEmail("master@baekjoon.com");
        companyVO.setcName("baekjoon");

        authVO.setAuth("ROLE_COMPANY");// 기업회원
        memberDAO.insertMember(memberVO);
        memberDAO.insertAuth(authVO);
        companyDAO.insertCompany(companyVO);
        continue;
      }

      if (i > 90) {
        memberVO.setType('A');
        authVO.setAuth("ROLE_ADMIN");
      }

      memberDAO.insertMember(memberVO);
      memberDAO.insertAuth(authVO);
    }

  }

  //  @Test
  public void testRead() {

    MemberVO result = memberDAO.findByEmail("user95@alpaca.com", false);

    System.out.println(result);

  }



  //  @Test
  public void testUpdateMember() {

    String sql = "UPDATE TBL_MEMBER SET pw = ?, from_social = '0', type = 'M' WHERE email = 'shguddnr2@Naver.com'";

    Connection con = null;
    PreparedStatement pstmt = null;

    try {
      con = ds.getConnection();
      pstmt = con.prepareStatement(sql);

      pstmt.setString(1, passwordEncoder.encode("1234"));

      pstmt.executeUpdate();

    }catch(Exception e) {
      e.printStackTrace();
    }finally {
      if(pstmt != null) { try { pstmt.close();  } catch(Exception e) {} }
      if(con != null) { try { con.close();  } catch(Exception e) {} }

    }
  }
  @Test
  public void testUpdateToDefaultProfileImage() {

    String sql = "UPDATE TBL_PF_IMG"
        + "   SET "
        + "    file_name = ?"
        + "    ,file_size = ?"
        + "    ,file_content_type = ?"
        + "    ,file_upload_date = current_timestamp"
        + "    ,file_data = ?"
        + "    ,regdate = sysdate"
        + "    ,updatedate = sysdate"
        + " WHERE pf_img_id = 1";

    Connection con = null;
    PreparedStatement pstmt = null;

    try {
      con = ds.getConnection();
      pstmt = con.prepareStatement(sql);

      File file = new File(new File("").getAbsolutePath() + "/src/main/resources/static/image/default_pf_img.jpg");
      FileItem fileItem = new DiskFileItem("originFile", Files.probeContentType(file.toPath()), false, file.getName(), (int) file.length(), file.getParentFile());

      InputStream input = new FileInputStream(file);
      OutputStream os = fileItem.getOutputStream();
      IOUtils.copy(input, os);
      MultipartFile mFile = new CommonsMultipartFile(fileItem);

      pstmt.setString(1, mFile.getOriginalFilename());
      pstmt.setLong(2, mFile.getSize());
      pstmt.setString(3, mFile.getContentType());
      pstmt.setBytes(4, mFile.getBytes());

      pstmt.executeUpdate();

    }catch(Exception e) {
      e.printStackTrace();
    }finally {
      if(pstmt != null) { try { pstmt.close();  } catch(Exception e) {} }
      if(con != null) { try { con.close();  } catch(Exception e) {} }

    }
  }


}


