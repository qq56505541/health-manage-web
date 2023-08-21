package com.yinhai.healthmanageweb.healthcheckmg.mapper.write;

import com.yinhai.healthmanageweb.healthcheckmg.vo.HealthCheckSetInfoHandleVo;
import com.yinhai.healthmanageweb.healthcheckmg.vo.HealthcheckSetAttachmentInfoVo;
import com.yinhai.ta404.module.mybatis.mapper.Ta404SupportMapper;

public interface HealthCheckServiceMgWriteMapper extends Ta404SupportMapper {
    void handleHealthCheckSetInfo(HealthCheckSetInfoHandleVo healthCheckSetInfoHandleVo);

    void saveAttachment(HealthcheckSetAttachmentInfoVo healthcheckSetAttachmentInfoVo);

    void deleteHealthCheckSetInfo(String setId);

    int deleteHealthCheckSetInfos(String[] ids);

    int deleteAttachById(String attachId);
}
