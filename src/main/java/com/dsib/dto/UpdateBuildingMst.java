package com.dsib.dto;

import com.dsib.entity.GgAudit;

import java.util.Date;
import java.util.List;


public class UpdateBuildingMst {
    private String id;
    private String householder;
    private String identityid;
    private String peoplenumber;
    private String type;
    private String grade;
    private String startyear;
    private String sunamount;
    private String bank;
    private String account;
    private String province;
    private String city;
    private String county;
    private String town;
    private String village;
    private String address;
    private String progress;
    private String finishamount;
    private String finishstatus;
    private String inputcode;
    private Date inputtime;
    private String updatecode;
    private Date updatetime;
    private String confirmcode;
    private Date confirmtime;
    private String flag;
    private String businessno;
    private String discription;
    private String filePath;
    private String status;
    private String nextAudit;

    private List<GgAudit> audits;


    public String getNextAudit() {
        return nextAudit;
    }

    public void setNextAudit(String nextAudit) {
        this.nextAudit = nextAudit;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getDiscription() {
        return discription;
    }

    public void setDiscription(String discription) {
        this.discription = discription;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    public String getId() {
        return id;
    }

    public String getBusinessno() {
        return businessno;
    }

    public void setBusinessno(String businessno) {
        this.businessno = businessno;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getHouseholder() {
        return householder;
    }

    public void setHouseholder(String householder) {
        this.householder = householder;
    }

    public String getIdentityid() {
        return identityid;
    }

    public void setIdentityid(String identityid) {
        this.identityid = identityid;
    }

    public String getPeoplenumber() {
        return peoplenumber;
    }

    public void setPeoplenumber(String peoplenumber) {
        this.peoplenumber = peoplenumber;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    public String getStartyear() {
        return startyear;
    }

    public void setStartyear(String startyear) {
        this.startyear = startyear;
    }

    public String getSunamount() {
        return sunamount;
    }

    public void setSunamount(String sunamount) {
        this.sunamount = sunamount;
    }

    public String getBank() {
        return bank;
    }

    public void setBank(String bank) {
        this.bank = bank;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCounty() {
        return county;
    }

    public void setCounty(String county) {
        this.county = county;
    }

    public String getTown() {
        return town;
    }

    public void setTown(String town) {
        this.town = town;
    }

    public String getVillage() {
        return village;
    }

    public void setVillage(String village) {
        this.village = village;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getProgress() {
        return progress;
    }

    public void setProgress(String progress) {
        this.progress = progress;
    }

    public String getFinishamount() {
        return finishamount;
    }

    public void setFinishamount(String finishamount) {
        this.finishamount = finishamount;
    }

    public String getFinishstatus() {
        return finishstatus;
    }

    public void setFinishstatus(String finishstatus) {
        this.finishstatus = finishstatus;
    }

    public String getInputcode() {
        return inputcode;
    }

    public void setInputcode(String inputcode) {
        this.inputcode = inputcode;
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
        this.updatecode = updatecode;
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
        this.confirmcode = confirmcode;
    }

    public Date getConfirmtime() {
        return confirmtime;
    }

    public void setConfirmtime(Date confirmtime) {
        this.confirmtime = confirmtime;
    }

    public String getFlag() {
        return flag;
    }

    public void setFlag(String flag) {
        this.flag = flag;
    }

    public List<GgAudit> getAudits() {
        return audits;
    }

    public void setAudits(List<GgAudit> audits) {
        this.audits = audits;
    }

    public UpdateBuildingMst() {

    }
}
