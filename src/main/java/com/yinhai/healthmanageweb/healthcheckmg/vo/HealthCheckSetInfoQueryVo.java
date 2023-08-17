package com.yinhai.healthmanageweb.healthcheckmg.vo;

import java.io.Serializable;

public class HealthCheckSetInfoQueryVo implements Serializable {
    private static final long serialVersionUID = -7318462568807779627L;
    // 套餐编号或套餐名称
    private String setInfo;
    // 套餐适用城市名称
    private String suitCity;

    @Override
    public String toString() {
        return "HealthCheckSetInfoQueryVo{ setInfo='" + setInfo + ", suitCity='" + suitCity + '}';
    }

    public String getSetInfo() {
        return setInfo;
    }

    public void setSetInfo(String setInfo) {
        this.setInfo = setInfo;
    }

    public String getSuitCity() {
        return suitCity;
    }

    public void setSuitCity(String suitCity) {
        this.suitCity = suitCity;
    }
}
