package com.team.interview.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import com.team.interview.vo.CompanyVO;
import com.team.interview.vo.FileVO;

@Mapper
@Repository
public interface CompanyDAO {
  int selectLogoImgNextval() throws Exception;
  int insertLogoImage(FileVO pfImg);

  int insertCompany(CompanyVO companyVO);

  CompanyVO findByEmail(String email);
}
