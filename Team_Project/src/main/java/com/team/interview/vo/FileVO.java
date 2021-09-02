package com.team.interview.vo;

import java.sql.Timestamp;
import java.util.Date;
import org.springframework.stereotype.Component;

@Component("fileVO")
public class FileVO {
  private int fileId;
  private String fileName;
  private long fileSize;
  private String fileContentType;
  private Timestamp fileUploadDate;
  private byte[] fileData;
  private Date regdate;
  private Date updatedate;


  public int getFileId() {
    return fileId;
  }

  public void setFileId(int fileId) {
    this.fileId = fileId;
  }

  public String getFileName() {
    return fileName;
  }

  public void setFileName(String fileName) {
    this.fileName = fileName;
  }

  public long getFileSize() {
    return fileSize;
  }

  public void setFileSize(long fileSize) {
    this.fileSize = fileSize;
  }

  public String getFileContentType() {
    return fileContentType;
  }

  public void setFileContentType(String fileContentType) {
    this.fileContentType = fileContentType;
  }

  public Timestamp getFileUploadDate() {
    return fileUploadDate;
  }

  public void setFileUploadDate(Timestamp fileUploadDate) {
    this.fileUploadDate = fileUploadDate;
  }

  public byte[] getFileData() {
    return fileData;
  }

  public void setFileData(byte[] fileData) {
    this.fileData = fileData;
  }

  public Date getRegdate() {
    return regdate;
  }

  public void setRegdate(Date regdate) {
    this.regdate = regdate;
  }

  public Date getUpdatedate() {
    return updatedate;
  }

  public void setUpdatedate(Date updatedate) {
    this.updatedate = updatedate;
  }


}
