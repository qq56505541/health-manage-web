package com.yinhai.healthmanageweb.healthcheckmg.utils;

import com.yinhai.healthmanageweb.healthcheckmg.vo.HealthcheckSetAttachmentInfoVo;
import org.apache.commons.lang.time.DateFormatUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Date;
import java.util.UUID;

public class UploadUtil {

    /**
     * 根据文件对象和保存的基路径对文件进行持久化并将保存的路径返回
     *
     * @param imageFile
     * @param basePath
     * @return java.lang.String
     */
    public static HealthcheckSetAttachmentInfoVo upload(MultipartFile imageFile, String basePath) throws IOException {
        HealthcheckSetAttachmentInfoVo healthcheckSetAttachmentInfoVo = new HealthcheckSetAttachmentInfoVo();
        // 文件真实名称处理
        String filename = imageFile.getOriginalFilename();
        healthcheckSetAttachmentInfoVo.setAttachName(filename);
        // 文件大小处理
        healthcheckSetAttachmentInfoVo.setAttachSize(imageFile.getSize());
        // 获取文件类型(后缀名)处理
        String ext = null;
        if (filename.contains(".")) {
            ext = filename.substring(filename.lastIndexOf("."));
        } else {
            ext = "";
        }
        healthcheckSetAttachmentInfoVo.setAttachType(ext);
        // 生成用于文件存储的UUID名
        String uuid = UUID.randomUUID().toString().replaceAll("-", "");
        String nfileName = uuid + ext;
        healthcheckSetAttachmentInfoVo.setAttachUuid(nfileName);// 文件保存路径处理
        String dirPath = DateFormatUtils.format(new Date(), "yyyyMMdd");
        String filepath = basePath.endsWith("/") ? basePath + dirPath : basePath + "/" + dirPath;
        healthcheckSetAttachmentInfoVo.setStorageUrl(filepath);
        // 文件流处理
        File pFile = new File(filepath);
        if (!pFile.exists()) {
            pFile.mkdirs();
        }
        File targetFile = new File(pFile.getAbsolutePath() + "/" + nfileName);
        byte[] bytes = imageFile.getBytes();
        try (OutputStream outputStream = new FileOutputStream(targetFile);) {
            outputStream.write(bytes);
        } catch (Exception e) {
            e.printStackTrace();
        }
        // imageFile.transferTo(targetFile);
        return healthcheckSetAttachmentInfoVo;
    }
}
