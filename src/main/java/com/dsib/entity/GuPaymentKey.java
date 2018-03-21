package com.dsib.entity;

public class GuPaymentKey {
    private String orderno;

    private String id;

    public GuPaymentKey() {
    }

    public GuPaymentKey(String orderno, String id) {
        this.orderno = orderno;
        this.id = id;
    }

    public String getOrderno() {
        return orderno;
    }

    public void setOrderno(String orderno) {
        this.orderno = orderno == null ? null : orderno.trim();
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }
}