package com.team.interview.service;

import org.springframework.web.multipart.MultipartFile;
import com.team.interview.vo.FileVO;
import com.team.interview.vo.ProfileVO;

public interface ProfileService {

  FileVO getFile(int fileId) throws Exception;

  ProfileVO getProfile(int pfId, String email) throws Exception;


}
