package com.yinhai.healthmanageweb.healthcheckmg.service.write.impl;

import com.yinhai.healthmanageweb.healthcheckmg.mapper.write.HealthCheckServiceMgWriteMapper;
import com.yinhai.healthmanageweb.healthcheckmg.service.write.HealthCheckServiceMgWriteService;
import com.yinhai.healthmanageweb.healthcheckmg.utils.UploadUtil;
import com.yinhai.healthmanageweb.healthcheckmg.vo.HealthCheckSetInfoHandleVo;
import com.yinhai.healthmanageweb.healthcheckmg.vo.HealthcheckSetAttachmentInfoVo;
import com.yinhai.ta404.core.exception.AppException;
import com.yinhai.ta404.core.service.BaseService;
import com.yinhai.ta404.core.transaction.annotation.TaTransactional;
import com.yinhai.ta404.core.utils.ValidateUtil;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.File;

/**
 * 体检套餐管理增删改实现
 */
@Service
@TaTransactional
public class HealthCheckServiceMgWriteServiceImpl extends BaseService implements HealthCheckServiceMgWriteService {
    @Resource
    HealthCheckServiceMgWriteMapper healthCheckServiceMgWriteMapper;

    public static final String UPLOAD_ATTACH_PATH = "f:/down";

    public static final String UPLOAD_FACE_PATH = "f:/down";

    @Override
    public void handleHealthCheckSetInfo(HealthCheckSetInfoHandleVo healthCheckSetInfoHandleVo, MultipartFile file, MultipartFile[] ruleFiles) throws Exception {
        // 判断setId是否为空，若为空则设置setId，这里采用内置的方法获取序列，再拼接处想要的编号样式返回
        String SetId = healthCheckSetInfoHandleVo.getSetId();
        if (ValidateUtil.isEmpty(SetId) || "undefined".equals(SetId)) {
            String setId = healthCheckServiceMgWriteMapper.executeForSequence("set_id_seq");
            healthCheckSetInfoHandleVo.setSetId("TJXM" + String.format("%06d", Integer.parseInt(setId)));
        }
        healthCheckServiceMgWriteMapper.handleHealthCheckSetInfo(healthCheckSetInfoHandleVo);
        // 判断封面图片文件是否存在，若存在则调用方法将文件持久化到磁盘，同时将文件基本信息新增至数据库
        if (null != file) {
            HealthcheckSetAttachmentInfoVo face = UploadUtil.upload(file, UPLOAD_FACE_PATH);
            face.setAttachCategory("0");
            face.setSetId(healthCheckSetInfoHandleVo.getSetId());
            // 将文件保存至数据库
            healthCheckServiceMgWriteMapper.saveAttachment(face);
        }
        // 判断规则文件对象组是否存在，若存在则调用方法将文件持久化到磁盘，同时将文件基本信息新增至数据库
        if (null != ruleFiles && ruleFiles.length != 0) {
            for (MultipartFile ruleFile: ruleFiles) {
                if (null != ruleFile) {
                    HealthcheckSetAttachmentInfoVo attach = UploadUtil.upload(ruleFile, UPLOAD_ATTACH_PATH);
                    attach.setAttachCategory("1");
                    attach.setSetId(healthCheckSetInfoHandleVo.getSetId());
                    //// 将文件保存至数据库
                    healthCheckServiceMgWriteMapper.saveAttachment(attach);
                }
            }
        }
    }

    @Override
    public void deleteHealthCheckSetInfo(String setId) throws Exception {
        healthCheckServiceMgWriteMapper.deleteHealthCheckSetInfo(setId);
    }

    @Override
    public void deleteBatchHealthCheckSetInfo(String setIds) throws Exception {
        String[] ids = setIds.split(",");
        int i = healthCheckServiceMgWriteMapper.deleteHealthCheckSetInfos(ids);
        if (i != ids.length) {
            throw new AppException("删除选中信息出错");
        }
    }

    @Override
    public void deleteAttachById(HealthcheckSetAttachmentInfoVo healthcheckSetAttachmentInfoVo) throws Exception {
        // 1.从数据库删除附件信息
        int count = healthCheckServiceMgWriteMapper.deleteAttachById(healthcheckSetAttachmentInfoVo.getAttachId());
        if (1 == count) {
            // 2.从物理路径删除附件文件
            File file = new File(healthcheckSetAttachmentInfoVo.getStorageUrl() + "/" + healthcheckSetAttachmentInfoVo.getAttachUuid());
            file.delete();
        }
    }
}
