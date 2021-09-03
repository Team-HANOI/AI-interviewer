package com.team.interview.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import com.team.interview.vo.CompanyVO;

@Mapper
@Repository
public interface CompanyDAO {
  int insertCompany(CompanyVO companyVO);

  CompanyVO findByEmail(String email);
}
