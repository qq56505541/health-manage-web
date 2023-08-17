package com.yinhai.healthmanageweb.healthcheckmg.mapper.read;

import com.yinhai.healthmanageweb.healthcheckmg.entity.HealthCheckSetInfoEntity;
import com.yinhai.healthmanageweb.healthcheckmg.vo.HealthCheckSetInfoQueryVo;
import com.yinhai.ta404.module.mybatis.mapper.Ta404SupportMapper;

import java.util.List;

public interface HealthCheckServiceMgReadMapper extends Ta404SupportMapper {
    List getCityInfo();

    List<HealthCheckSetInfoEntity> queryHealthcheckSetInfoList(HealthCheckSetInfoQueryVo healthCheckSetInfoQueryVo);
}
