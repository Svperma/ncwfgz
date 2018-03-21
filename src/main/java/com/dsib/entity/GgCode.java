package com.dsib.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class GgCode extends GgCodeKey implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String codecname;

    private String codetname;

    private String codeename;

    private String creatorcode;

    private Date createtime;

    private String updatercode;

    private Date updatetime;

    private Date validdate;

    private Date invaliddate;

    private String validind;

    private String remark;

    private String flag;

    private BigDecimal displayno;

    public String getCodecname() {
        return codecname;
    }

    public void setCodecname(String codecname) {
        this.codecname = codecname == null ? null : codecname.trim();
    }

    public String getCodetname() {
        return codetname;
    }

    public void setCodetname(String codetname) {
        this.codetname = codetname == null ? null : codetname.trim();
    }

    public String getCodeename() {
        return codeename;
    }

    public void setCodeename(String codeename) {
        this.codeename = codeename == null ? null : codeename.trim();
    }

    public String getCreatorcode() {
        return creatorcode;
    }

    public void setCreatorcode(String creatorcode) {
        this.creatorcode = creatorcode == null ? null : creatorcode.trim();
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public String getUpdatercode() {
        return updatercode;
    }

    public void setUpdatercode(String updatercode) {
        this.updatercode = updatercode == null ? null : updatercode.trim();
    }

    public Date getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime(Date updatetime) {
        this.updatetime = updatetime;
    }

    public Date getValiddate() {
        return validdate;
    }

    public void setValiddate(Date validdate) {
        this.validdate = validdate;
    }

    public Date getInvaliddate() {
        return invaliddate;
    }

    public void setInvaliddate(Date invaliddate) {
        this.invaliddate = invaliddate;
    }

    public String getValidind() {
        return validind;
    }

    public void setValidind(String validind) {
        this.validind = validind == null ? null : validind.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public String getFlag() {
        return flag;
    }

    public void setFlag(String flag) {
        this.flag = flag == null ? null : flag.trim();
    }

    public BigDecimal getDisplayno() {
        return displayno;
    }

    public void setDisplayno(BigDecimal displayno) {
        this.displayno = displayno;
    }
}