package com.yinhai.healthmanageweb.healthcheckmg.vo;

import java.io.Serializable;
import java.util.Date;

public class HealthCheckSetInfoHandleVo implements Serializable {
    private static final long serialVersionUID = 582566284798938989L;
    //套餐流水号
    private String setId;
    //套餐名称
    private String setName;
    //套餐售价
    private Double setPrice;
    //适用城市
    private String suitCity;
    //订购数量
    private Integer orderQuantity;
    //适用标签
    private String suitLabel;
    //启用状态（0 禁用 1 启用）
    private String status;
    //有效期至
    private Date expireTime;
    //套餐描述
    private String setDesc;


    public String getSetId() {
        return setId;
    }

    public void setSetId(String setId) {
        this.setId = setId;
    }

    public String getSetName() {
        return setName;
    }

    public void setSetName(String setName) {
        this.setName = setName;
    }

    public Double getSetPrice() {
        return setPrice;
    }

    public void setSetPrice(Double setPrice) {
        this.setPrice = setPrice;
    }

    public String getSuitCity() {
        return suitCity;
    }

    public void setSuitCity(String suitCity) {
        this.suitCity = suitCity;
    }

    public Integer getOrderQuantity() {
        return orderQuantity;
    }

    public void setOrderQuantity(Integer orderQuantity) {
        this.orderQuantity = orderQuantity;
    }

    public String getSuitLabel() {
        return suitLabel;
    }

    public void setSuitLabel(String suitLabel) {
        this.suitLabel = suitLabel;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getExpireTime() {
        return expireTime;
    }

    public void setExpireTime(Date expireTime) {
        this.expireTime = expireTime;
    }

    public String getSetDesc() {
        return setDesc;
    }

    public void setSetDesc(String setDesc) {
        this.setDesc = setDesc;
    }

}