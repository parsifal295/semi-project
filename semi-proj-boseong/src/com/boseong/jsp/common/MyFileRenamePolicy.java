package com.boseong.jsp.common;

import com.oreilly.servlet.multipart.FileRenamePolicy;
import java.io.File;

public class MyFileRenamePolicy implements FileRenamePolicy {

  @Override
  public File rename(File arg0) {
    String originName = arg0.getName();
    String currentTime =
        new java.text.SimpleDateFormat("yyyyMMddHHmmss").format(new java.util.Date());
    // generate 5 digits random number
    int randomNumber = (int) (Math.random() * 90000) + 10000;
    String extension = originName.substring(originName.lastIndexOf("."));
    String changeName = "BS_" + currentTime + "_" + randomNumber + extension;

    // 기존파일을 수정된 파일명으로 적용시켜서 반환
    return new File(arg0.getParent(), changeName);
  }
}
