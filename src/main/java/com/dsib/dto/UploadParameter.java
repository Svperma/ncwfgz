package com.dsib.dto;

import org.springframework.web.multipart.MultipartFile;

import java.util.Date;
import java.util.List;

public class UploadParameter {
    private String orderno;

    private Date orderdate;

    private String sumquantity;

    private String sumamount;

    private MultipartFile file;

    private String inputCode;

    private String filePath;

    private String auditstatus;
    
    private String auditcode;

    private String updateCode;

    private String confirmCode;


    private List<ParameterGgBuildingMst> list;

    public UploadParameter() {
    }

    public String getOrderno() {

        return orderno;
    }

    public void setOrderno(String orderno) {
        this.orderno = orderno;
    }

    public Date getOrderdate() {
        return orderdate;
    }

    public void setOrderdate(Date orderdate) {
        this.orderdate = orderdate;
    }

    public String getSumquantity() {
        return sumquantity;
    }

    public void setSumquantity(String sumquantity) {
        this.sumquantity = sumquantity;
    }

    public String getSumamount() {
        return sumamount;
    }

    public void setSumamount(String sumamount) {
        this.sumamount = sumamount;
    }

    public MultipartFile getFile() {
        return file;
    }

    public void setFile(MultipartFile file) {
        this.file = file;
    }

    public List<ParameterGgBuildingMst> getList() {
        return list;
    }

    public void setList(List<ParameterGgBuildingMst> list) {
        this.list = list;
    }

    public String getInputCode() {
        return inputCode;
    }

    public void setInputCode(String inputCode) {
        this.inputCode = inputCode;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    public String getConfirmCode() {
        return confirmCode;
    }

    public void setConfirmCode(String confirmCode) {
        this.confirmCode = confirmCode;
    }

    public String getUpdateCode() {
        return updateCode;
    }

    public void setUpdateCode(String updateCode) {
        this.updateCode = updateCode;
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

	@Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        UploadParameter that = (UploadParameter) o;

        if (orderno != null ? !orderno.equals(that.orderno) : that.orderno != null) return false;
        if (orderdate != null ? !orderdate.equals(that.orderdate) : that.orderdate != null) return false;
        if (sumquantity != null ? !sumquantity.equals(that.sumquantity) : that.sumquantity != null) return false;
        if (sumamount != null ? !sumamount.equals(that.sumamount) : that.sumamount != null) return false;
        if (file != null ? !file.equals(that.file) : that.file != null) return false;
        return list != null ? list.equals(that.list) : that.list == null;
    }



}
