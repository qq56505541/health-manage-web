package com.yinhai.healthmanageweb.healthcheckmg.vo;

import java.io.Serializable;

public class HealthcheckSetAttachmentInfoVo implements Serializable {

    private static final long serialVersionUID = -75703244774555544L;
    private String attachId;
    private String attachName;
    private String attachType;
    private Long attachSize;
    private String attachUuid;
    private String storageUrl;
    private String attachCategory;
    private String status = "1";
    private String setId;

    @Override
    public String toString() {
        return "HealthcheckSetAttachmentInfoVo{" +
                "attachId='" + attachId + '\'' +
                ", attachName='" + attachName + '\'' +
                ", attachType='" + attachType + '\'' +
                ", attachSize=" + attachSize +
                ", attachUuid='" + attachUuid + '\'' +
                ", storageUrl='" + storageUrl + '\'' +
                ", attachCategory='" + attachCategory + '\'' +
                ", status='" + status + '\'' +
                ", setId='" + setId + '\'' +
                '}';
    }

    public String getAttachId() {
        return attachId;
    }

    public void setAttachId(String attachId) {
        this.attachId = attachId;
    }

    public String getAttachName() {
        return attachName;
    }

    public void setAttachName(String attachName) {
        this.attachName = attachName;
    }

    public String getAttachType() {
        return attachType;
    }

    public void setAttachType(String attachType) {
        this.attachType = attachType;
    }

    public Long getAttachSize() {
        return attachSize;
    }

    public void setAttachSize(Long attachSize) {
        this.attachSize = attachSize;
    }

    public String getAttachUuid() {
        return attachUuid;
    }

    public void setAttachUuid(String attachUuid) {
        this.attachUuid = attachUuid;
    }

    public String getStorageUrl() {
        return storageUrl;
    }

    public void setStorageUrl(String storageUrl) {
        this.storageUrl = storageUrl;
    }

    public String getAttachCategory() {
        return attachCategory;
    }

    public void setAttachCategory(String attachCategory) {
        this.attachCategory = attachCategory;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getSetId() {
        return setId;
    }

    public void setSetId(String setId) {
        this.setId = setId;
    }
}
