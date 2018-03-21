package com.dsib.entity;

public class GgAuditKey {
    private String id;

    private Integer seriesNo;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public Integer getSeriesNo() {
        return seriesNo;
    }

    public void setSeriesNo(Integer seriesNo) {
        this.seriesNo = seriesNo;
    }
}