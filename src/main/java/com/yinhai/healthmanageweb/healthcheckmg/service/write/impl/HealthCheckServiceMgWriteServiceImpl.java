package com.yinhai.healthmanageweb.healthcheckmg.service.write.impl;

import com.yinhai.healthmanageweb.healthcheckmg.mapper.write.HealthCheckServiceMgWriteMapper;
import com.yinhai.healthmanageweb.healthcheckmg.service.write.HealthCheckServiceMgWriteService;
import com.yinhai.healthmanageweb.healthcheckmg.vo.HealthCheckSetInfoHandleVo;
import com.yinhai.ta404.core.service.BaseService;
import com.yinhai.ta404.core.transaction.annotation.TaTransactional;
import com.yinhai.ta404.core.utils.ValidateUtil;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;

/**
 * 体检套餐管理增删改实现
 */
@Service
@TaTransactional
public class HealthCheckServiceMgWriteServiceImpl extends BaseService implements HealthCheckServiceMgWriteService {
    @Resource
    HealthCheckServiceMgWriteMapper healthCheckServiceMgWriteMapper;

    @Override
    public void handleHealthCheckSetInfo(HealthCheckSetInfoHandleVo healthCheckSetInfoHandleVo, MultipartFile file, MultipartFile[] ruleFiles) throws Exception {
        // 判断setId是否为空，若为空则设置setId，这里采用内置的方法获取序列，再拼接为想要的编号样式返回
        String SetId = healthCheckSetInfoHandleVo.getSetId();
        if (ValidateUtil.isEmpty(SetId) || "undefined".equals(SetId)) {
            String setId = healthCheckServiceMgWriteMapper.executeForSequence("set_id_seq");
            healthCheckSetInfoHandleVo.setSetId("TJXM" + String.format("%06d", Integer.parseInt(setId)));
        }
        healthCheckServiceMgWriteMapper.handleHealthCheckSetInfo(healthCheckSetInfoHandleVo);
    }
}
