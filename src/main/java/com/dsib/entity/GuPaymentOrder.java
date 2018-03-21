package com.dsib.entity;

import java.io.Serializable;
import java.util.Date;

public class GuPaymentOrder implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String orderno;

    private Date orderdate;

    private Integer sumquantity;

    private Integer sumamount;

    private String attachmentpath;

    private String status;
    
    private String auditstatus;
    
    private String auditcode;

    private String inputcode;

    private Date inputtime;

    private String updatecode;

    private Date updatetime;

    private String confirmcode;

    private Date confirmtime;

    public String getOrderno() {
        return orderno;
    }

    public void setOrderno(String orderno) {
        this.orderno = orderno == null ? null : orderno.trim();
    }

    public Date getOrderdate() {
        return orderdate;
    }

    public void setOrderdate(Date orderdate) {
        this.orderdate = orderdate;
    }

    public Integer getSumquantity() {
        return sumquantity;
    }

    public void setSumquantity(Integer sumquantity) {
        this.sumquantity = sumquantity;
    }

    public Integer getSumamount() {
        return sumamount;
    }

    public void setSumamount(Integer sumamount) {
        this.sumamount = sumamount;
    }

    public String getAttachmentpath() {
        return attachmentpath;
    }

    public void setAttachmentpath(String attachmentpath) {
        this.attachmentpath = attachmentpath == null ? null : attachmentpath.trim();
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
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

	public String getAuditstatus() {
		return auditstatus;
	}

	public void setAuditstatus(String auditstatus) {
		this.auditstatus = auditstatus;
	}

	public String getAuditcode() {
		return auditcode;
	}

	public void setAuditcode(String auditcode) {
		this.auditcode = auditcode;
	}
}