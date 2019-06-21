package com.gjc.hrm.domain;

import java.util.List;

public class PageBean{
    private int page;     //当前页
    private int rows;       //每页显示个数
    private int totalRecord;    //总记录数
    private int totolPage;      //总分页数
    private int startIndex;     //开始索引

    public PageBean(int page, int rows, int totalRecord) {
        this.page = page;
        this.rows = rows;
        this.totalRecord = totalRecord;
        //总分页数
        this.totolPage = (this.totalRecord + this.rows - 1) / this.rows;
        //开始索引
        this.startIndex = (this.page-1)*this.rows;
    }

    public int getPageNumber() {
        return page;
    }

    public PageBean() {
    }

    public void setPageNumber(int pageNumber) {
        this.page = pageNumber;
    }

    public int getPageSize() {
        return rows;
    }

    public void setPageSize(int pageSize) {
        this.rows = pageSize;
    }

    public int getTotalRecord() {
        return totalRecord;
    }

    public void setTotalRecord(int totalRecord) {
        this.totalRecord = totalRecord;
    }

    public int getTotolPage() {
        return totolPage;
    }

    public void setTotolPage(int totolPage) {
        this.totolPage = totolPage;
    }

    public int getStartIndex() {
        return startIndex;
    }

    public void setStartIndex(int startIndex) {
        this.startIndex = startIndex;
    }

}
