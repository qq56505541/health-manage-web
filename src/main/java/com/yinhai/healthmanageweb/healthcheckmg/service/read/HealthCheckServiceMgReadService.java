package com.yinhai.healthmanageweb.healthcheckmg.service.read;

import com.yinhai.healthmanageweb.healthcheckmg.entity.HealthCheckSetInfoEntity;
import com.yinhai.healthmanageweb.healthcheckmg.vo.HealthCheckSetInfoQueryVo;
import com.yinhai.ta404.core.restservice.requestbean.PageParam;
import com.yinhai.ta404.core.restservice.resultbean.Page;

import java.util.List;
import java.util.Map;

/**
* 体检套餐查询业务接口
*/
public interface HealthCheckServiceMgReadService {
    List<Map<String, Object>> getCityInfo();

    Page<HealthCheckSetInfoEntity> queryHealthcheckSetInfoList(HealthCheckSetInfoQueryVo healthCheckSetInfoQueryVo, PageParam pageParam);
}
