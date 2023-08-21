package com.yinhai.healthmanageweb.healthcheckmg.service.write;

import com.yinhai.healthmanageweb.healthcheckmg.vo.HealthCheckSetInfoHandleVo;
import com.yinhai.healthmanageweb.healthcheckmg.vo.HealthcheckSetAttachmentInfoVo;
import org.springframework.web.multipart.MultipartFile;

/**
* 体检套餐管理增删改接口
*/
public interface HealthCheckServiceMgWriteService {
    void handleHealthCheckSetInfo(HealthCheckSetInfoHandleVo healthCheckSetInfoHandleVo, MultipartFile bannerFile, MultipartFile[] ruleFiles) throws Exception;

    void deleteHealthCheckSetInfo(String setId) throws Exception;

    void deleteBatchHealthCheckSetInfo(String setIds) throws Exception;

    void deleteAttachById(HealthcheckSetAttachmentInfoVo healthcheckSetAttachmentInfoVo) throws Exception;
}
