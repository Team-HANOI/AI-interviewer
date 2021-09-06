package com.team.interview.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.team.interview.dao.ProfileDAO;
import com.team.interview.vo.FileVO;
import com.team.interview.vo.ProfileVO;

@Service
public class ProfileServiceImpl implements ProfileService{

  @Autowired
  private ProfileDAO profileDAO;

  @Override
  public FileVO getFile(int fileId) throws Exception{
    return profileDAO.getFile(fileId);
  }

  @Override
  public ProfileVO getProfile(int pfId) throws Exception {
    return profileDAO.getProfile(pfId);
  }

}
