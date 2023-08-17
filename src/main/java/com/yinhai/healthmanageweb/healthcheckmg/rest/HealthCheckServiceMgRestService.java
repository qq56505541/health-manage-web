package com.yinhai.healthmanageweb.healthcheckmg.rest;

import com.yinhai.healthmanageweb.healthcheckmg.entity.HealthCheckSetInfoEntity;
import com.yinhai.healthmanageweb.healthcheckmg.service.read.HealthCheckServiceMgReadService;
import com.yinhai.healthmanageweb.healthcheckmg.service.write.HealthCheckServiceMgWriteService;
import com.yinhai.healthmanageweb.healthcheckmg.vo.HealthCheckSetInfoHandleVo;
import com.yinhai.healthmanageweb.healthcheckmg.vo.HealthCheckSetInfoQueryVo;
import com.yinhai.ta404.core.restservice.BaseRestService;
import com.yinhai.ta404.core.restservice.annotation.RestService;
import com.yinhai.ta404.core.restservice.requestbean.PageParam;
import com.yinhai.ta404.core.restservice.resultbean.Page;
import com.yinhai.ta404.core.utils.TreeUtil;
import com.yinhai.ta404.core.utils.ValidateUtil;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * 体检套餐管理控制器
 */
@RestService("healthCheckServiceMg")
public class HealthCheckServiceMgRestService extends BaseRestService {

    @Resource
    HealthCheckServiceMgReadService healthCheckServiceMgReadService;

    /**
     * 获取省份城市的级联下拉选项
     */
    @PostMapping("getCityInfo")
    public void getCityInfo() throws Exception {
        List<Map<String, Object>> cityInfo = healthCheckServiceMgReadService.getCityInfo();
        List<Map<String, Object>> list = TreeUtil.generateTreeList(cityInfo, "id", "pid");
        setData("cityTree", list);
    }

    @PostMapping("queryHealthcheckSetInfoList")
    public void queryHealthcheckSetInfoList(HealthCheckSetInfoQueryVo healthCheckSetInfoQueryVo, PageParam pageParam) throws Exception {
        Page<HealthCheckSetInfoEntity> healthCheckSetInfos = healthCheckServiceMgReadService.queryHealthcheckSetInfoList(healthCheckSetInfoQueryVo, pageParam);
        setPageBean(healthCheckSetInfos);
    }

    @Resource
    HealthCheckServiceMgWriteService healthCheckServiceMgWriteService;

    /**
     * 新增或更新体检套餐信息
     *
     * @param healthCheckSetInfoHandleVo 待处理的表单信息
     * @param bannerFile                 封面图片对象
     * @param ruleFiles                  使用规则文件对象组
     */
    @PostMapping("saveHealthCheckSetInfo")
    public void handleHealthCheckSetInfo(HealthCheckSetInfoHandleVo healthCheckSetInfoHandleVo, @RequestPart(required = false) MultipartFile bannerFile, @RequestPart(required = false) MultipartFile[] ruleFiles) throws Exception {
        if (!ValidateUtil.isEmpty(healthCheckSetInfoHandleVo)) {
            healthCheckServiceMgWriteService.handleHealthCheckSetInfo(healthCheckSetInfoHandleVo, bannerFile, ruleFiles);
        }
    }
}
