package com.team.interview.service;

import com.team.interview.vo.FileVO;
import com.team.interview.vo.ProfileVO;

public interface ProfileService {

  FileVO getFile(int fileId) throws Exception;

  ProfileVO getProfile(int pfId) throws Exception;

}
