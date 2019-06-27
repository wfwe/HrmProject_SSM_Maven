package com.gjc.hrm.domain;

import com.alibaba.fastjson.annotation.JSONField;

import java.util.Date;

public class LoadInf {
    private Integer id;

    private String loadTitle;

    private String loadName;

    private String loadPath;

    private Integer loadUser;

    @JSONField(format = "yyyy-MM-dd HH:mm:ss")
    private Date loadCreatedate;

    private String loadRemark;

    private Integer canLoadUser;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getLoadTitle() {
        return loadTitle;
    }

    public void setLoadTitle(String loadTitle) {
        this.loadTitle = loadTitle == null ? null : loadTitle.trim();
    }

    public String getLoadName() {
        return loadName;
    }

    public void setLoadName(String loadName) {
        this.loadName = loadName == null ? null : loadName.trim();
    }

    public String getLoadPath() {
        return loadPath;
    }

    public void setLoadPath(String loadPath) {
        this.loadPath = loadPath == null ? null : loadPath.trim();
    }

    public Integer getLoadUser() {
        return loadUser;
    }

    public void setLoadUser(Integer loadUser) {
        this.loadUser = loadUser;
    }

    public Date getLoadCreatedate() {
        return loadCreatedate;
    }

    public void setLoadCreatedate(Date loadCreatedate) {
        this.loadCreatedate = loadCreatedate;
    }

    public String getLoadRemark() {
        return loadRemark;
    }

    public void setLoadRemark(String loadRemark) {
        this.loadRemark = loadRemark == null ? null : loadRemark.trim();
    }

    public Integer getCanLoadUser() {
        return canLoadUser;
    }

    public void setCanLoadUser(Integer canLoadUser) {
        this.canLoadUser = canLoadUser;
    }
}