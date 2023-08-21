package com.yinhai.healthmanageweb.healthcheckmg.service.read.impl;

import com.yinhai.healthmanageweb.healthcheckmg.entity.HealthCheckSetInfoEntity;
import com.yinhai.healthmanageweb.healthcheckmg.mapper.read.HealthCheckServiceMgReadMapper;
import com.yinhai.healthmanageweb.healthcheckmg.service.read.HealthCheckServiceMgReadService;
import com.yinhai.healthmanageweb.healthcheckmg.vo.HealthCheckSetInfoQueryVo;
import com.yinhai.healthmanageweb.healthcheckmg.vo.HealthcheckSetAttachmentInfoVo;
import com.yinhai.ta404.core.restservice.requestbean.PageParam;
import com.yinhai.ta404.core.restservice.resultbean.Page;
import com.yinhai.ta404.core.service.BaseService;
import com.yinhai.ta404.core.transaction.annotation.NoTransactional;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 体检套餐查询业务实现
 */
@Service
@NoTransactional
public class HealthCheckServiceMgReadServiceImpl extends BaseService implements HealthCheckServiceMgReadService {
    @Resource
    private HealthCheckServiceMgReadMapper healthCheckServiceMgReadMapper;

    @Override
    public List getCityInfo() {
        return healthCheckServiceMgReadMapper.getCityInfo();
    }

    @Override
    public Page<HealthCheckSetInfoEntity> queryHealthcheckSetInfoList(HealthCheckSetInfoQueryVo healthCheckSetInfoQueryVo, PageParam pageParam) {
        healthCheckServiceMgReadMapper.beginPager(pageParam);
        List<HealthCheckSetInfoEntity> list = healthCheckServiceMgReadMapper.queryHealthcheckSetInfoList(healthCheckSetInfoQueryVo);
        return healthCheckServiceMgReadMapper.endPager(list);
    }

    @Override
    public HealthcheckSetAttachmentInfoVo getFaceImage(String setId) {
        return healthCheckServiceMgReadMapper.getFaceImage(setId);
    }

    @Override
    public List<HealthcheckSetAttachmentInfoVo> getAttachment(String setId) {
        return healthCheckServiceMgReadMapper.getAttachment(setId);
    }
}
