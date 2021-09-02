package com.team.interview.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.sql.DataSource;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.password.PasswordEncoder;
import com.team.interview.dao.MemberDAO;
import com.team.interview.vo.MemberVO;

@SpringBootTest
public class MemberTests {

  @Autowired
  private PasswordEncoder pwencoder;

  @Autowired
  private DataSource ds;

  @Autowired
  private MemberDAO md;

  //  @Test
  public void testInsertMember() {

    String sql = "insert into tbl_member(email, name, password) values (?,?,?)";

    for(int i = 0; i < 100; i++) {

      Connection con = null;
      PreparedStatement pstmt = null;

      try {
        con = ds.getConnection();
        pstmt = con.prepareStatement(sql);

        pstmt.setString(3, pwencoder.encode("1111"));


        pstmt.setString(1, "user"+i+"@cgkim449.com");
        pstmt.setString(2,"사용자"+i);

        pstmt.executeUpdate();

      }catch(Exception e) {
        e.printStackTrace();
      }finally {
        if(pstmt != null) { try { pstmt.close();  } catch(Exception e) {} }
        if(con != null) { try { con.close();  } catch(Exception e) {} }

      }
    }//end for
  }

  //  @Test
  public void testInsertAuth() {


    String sql = "insert into tbl_member_auth (email, auth) values (?,?)";

    for(int i = 0; i < 100; i++) {

      Connection con = null;
      PreparedStatement pstmt = null;

      try {
        con = ds.getConnection();
        pstmt = con.prepareStatement(sql);


        if(i <80) {

          pstmt.setString(1, "user"+i+"@cgkim449.com");
          pstmt.setString(2,"ROLE_USER");

        }else if (i <90) {

          pstmt.setString(1, "user"+i+"@cgkim449.com");
          pstmt.setString(2,"ROLE_MEMBER");

        }else {

          pstmt.setString(1, "user"+i+"@cgkim449.com");
          pstmt.setString(2,"ROLE_ADMIN");

        }

        pstmt.executeUpdate();

      }catch(Exception e) {
        e.printStackTrace();
      }finally {
        if(pstmt != null) { try { pstmt.close();  } catch(Exception e) {} }
        if(con != null) { try { con.close();  } catch(Exception e) {} }

      }
    }//end for
  }

  @Test
  public void testFindByEmail() {
    MemberVO memberVO = md.findByEmail("user90@cgkim449.com", false);
    System.out.println(memberVO);
  }


}


