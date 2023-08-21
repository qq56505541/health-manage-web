package com.yinhai.healthmanageweb.healthcheckmg.rest;

import com.yinhai.healthmanageweb.healthcheckmg.entity.HealthCheckSetInfoEntity;
import com.yinhai.healthmanageweb.healthcheckmg.service.read.HealthCheckServiceMgReadService;
import com.yinhai.healthmanageweb.healthcheckmg.service.write.HealthCheckServiceMgWriteService;
import com.yinhai.healthmanageweb.healthcheckmg.vo.HealthCheckSetInfoHandleVo;
import com.yinhai.healthmanageweb.healthcheckmg.vo.HealthCheckSetInfoQueryVo;
import com.yinhai.healthmanageweb.healthcheckmg.vo.HealthcheckSetAttachmentInfoVo;
import com.yinhai.ta404.core.restservice.BaseRestService;
import com.yinhai.ta404.core.restservice.annotation.RestService;
import com.yinhai.ta404.core.restservice.requestbean.PageParam;
import com.yinhai.ta404.core.restservice.resultbean.Page;
import com.yinhai.ta404.core.utils.JsonFactory;
import com.yinhai.ta404.core.utils.ResponseExportUtil;
import com.yinhai.ta404.core.utils.TreeUtil;
import com.yinhai.ta404.core.utils.ValidateUtil;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;
import sun.misc.BASE64Encoder;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
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

    @PostMapping("deleteHealthCheckSetInfo")
    public void deleteHealthCheckSetInfo(String setId) throws Exception {
        if (!ValidateUtil.isEmpty(setId)) {
            healthCheckServiceMgWriteService.deleteHealthCheckSetInfo(setId);
        }
    }

    @PostMapping("deleteBatchHealthCheckSetInfo")
    public void deleteBatchHealthCheckSetInfo(String setIds) throws Exception {
        if (!ValidateUtil.isEmpty(setIds)) {
            healthCheckServiceMgWriteService.deleteBatchHealthCheckSetInfo(setIds);
        }
    }

    /**
     * 获取套餐的封面和附件信息
     *
     * @param setId
     */
    @PostMapping("getAttachmentInfoBySetId")
    public void getAttachmentInfoBySetId(String setId) throws Exception {
        // 获取封面图片
        HealthcheckSetAttachmentInfoVo faceImage = healthCheckServiceMgReadService.getFaceImage(setId);
        // 根据后端存储路径将图片转换为base64字符串
        if (!ValidateUtil.isEmpty(faceImage)) {
            String s = fileToBase64(faceImage.getStorageUrl() + "/" + faceImage.getAttachUuid());
            setData("imgUrl", "data:image/" + faceImage.getAttachType().substring(1) + ";base64," + s);
        }
        // 获取使用规则
        List<HealthcheckSetAttachmentInfoVo> attaches = healthCheckServiceMgReadService.getAttachment(setId);
        setData("attaches", attaches);
    }

    /**
     * 将图片文件转化为base64字符串
     *
     * @param imgUrl
     * @return java.lang.String
     */
    public static String fileToBase64(String imgUrl) {
        InputStream in = null;
        byte[] data = null;
        try {
            File file = new File(imgUrl);
            in = new FileInputStream(file);
            data = new byte[in.available()];
            in.read(data);
            in.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                in.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        BASE64Encoder encoder = new BASE64Encoder();
        return encoder.encode(data);
    }

    /**
     * 附件下载
     *
     * @param fileName  待下载的文件名
     * @param paramJson 传入参数，这里传入的是存储路径
     * @param response  响应
     */
    @PostMapping("downloadAttachFile")
    public void downloadAttachFile(String fileName, String paramJson, HttpServletResponse response) throws IOException {
        HashMap param = JsonFactory.json2bean(paramJson, HashMap.class);
        File file = new File(param.get("storageUrl") + "/" + param.get("attachUuid"));
        try (InputStream inputStream = new FileInputStream(file);) {
            ResponseExportUtil.exportFileWithStream(response, inputStream, fileName);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 根据主键删除附件（物理删除）
     *
     * @param healthcheckSetAttachmentInfoVo
     */
    @PostMapping("deleteAttachById")
    public void deleteAttachById(HealthcheckSetAttachmentInfoVo healthcheckSetAttachmentInfoVo) throws Exception {
        System.out.println(healthcheckSetAttachmentInfoVo);
        healthCheckServiceMgWriteService.deleteAttachById(healthcheckSetAttachmentInfoVo);
    }
}
