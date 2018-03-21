package com.dsib.entity;

import java.util.Date;

public class GuPayment extends GuPaymentKey {
    private String bank;

    private String account;

    private String progress;

    private Integer paymentamount;

    private Date operatetdate;

    private Date paymentdate;

    private String inputcode;

    private Date inputtime;

    private String updatecode;

    private Date updatetime;

    private String confirmcode;

    private Date confirmtime;

    private Integer yetcashamount;

    public Integer getYetcashamount() {
        return yetcashamount;
    }

    public void setYetcashamount(Integer yetcashamount) {
        this.yetcashamount = yetcashamount;
    }

    public String getBank() {
        return bank;
    }

    public void setBank(String bank) {
        this.bank = bank == null ? null : bank.trim();
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account == null ? null : account.trim();
    }

    public String getProgress() {
        return progress;
    }

    public void setProgress(String progress) {
        this.progress = progress == null ? null : progress.trim();
    }

    public Integer getPaymentamount() {
        return paymentamount;
    }

    public void setPaymentamount(Integer paymentamount) {
        this.paymentamount = paymentamount;
    }

    public Date getOperatetdate() {
        return operatetdate;
    }

    public void setOperatetdate(Date operatetdate) {
        this.operatetdate = operatetdate;
    }

    public Date getPaymentdate() {
        return paymentdate;
    }

    public void setPaymentdate(Date paymentdate) {
        this.paymentdate = paymentdate;
    }

    public String getInputcode() {
        return inputcode;
    }

    public void setInputcode(String inputcode) {
        this.inputcode = inputcode == null ? null : inputcode.trim();
    }

    public Date getInputtime() {
        return inputtime;
    }

    public void setInputtime(Date inputtime) {
        this.inputtime = inputtime;
    }

    public String getUpdatecode() {
        return updatecode;
    }

    public void setUpdatecode(String updatecode) {
        this.updatecode = updatecode == null ? null : updatecode.trim();
    }

    public Date getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime(Date updatetime) {
        this.updatetime = updatetime;
    }

    public String getConfirmcode() {
        return confirmcode;
    }

    public void setConfirmcode(String confirmcode) {
        this.confirmcode = confirmcode == null ? null : confirmcode.trim();
    }

    public Date getConfirmtime() {
        return confirmtime;
    }

    public void setConfirmtime(Date confirmtime) {
        this.confirmtime = confirmtime;
    }
}