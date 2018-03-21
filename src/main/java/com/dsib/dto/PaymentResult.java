package com.dsib.dto;



import java.io.Serializable;
import java.util.Date;

public class PaymentResult implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String orderNo;

    private String id;

    private String identityId;

    private String householder;

    private String progress;

    private Integer sunamount;

    private Integer finishamount;

    private Date operatetDate;

    private Date paymentDate;

    private String paymentAmount;

    private String yetcashamount;

    public PaymentResult() {
    }

    public Integer getSunamount() {
        return sunamount;
    }

    public void setSunamount(Integer sunamount) {
        this.sunamount = sunamount;
    }

    public Integer getFinishamount() {
        return finishamount;
    }

    public void setFinishamount(Integer finishamount) {
        this.finishamount = finishamount;
    }

    public String getYetcashamount() {
        return yetcashamount;
    }

    public void setYetcashamount(String yetcashamount) {
        this.yetcashamount = yetcashamount;
    }

    public Date getOperatetDate() {
        return operatetDate;
    }

    public void setOperatetDate(Date operatetDate) {
        this.operatetDate = operatetDate;
    }

    @Override
    public String
    toString() {
        return "PaymentResult{" +
                "orderNo='" + orderNo + '\'' +
                ", id='" + id + '\'' +
                ", identityId='" + identityId + '\'' +
                ", householder='" + householder + '\'' +
                ", progress='" + progress + '\'' +
                ", paymentDate=" + paymentDate +
                ", paymentAmount='" + paymentAmount + '\'' +
                '}';
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getOrderNo() {

        return orderNo;
    }

    public void setOrderNo(String orderNo) {
        this.orderNo = orderNo;
    }

    public String getIdentityId() {
        return identityId;
    }

    public void setIdentityId(String identityId) {
        this.identityId = identityId;
    }

    public String getHouseholder() {
        return householder;
    }

    public void setHouseholder(String householder) {
        this.householder = householder;
    }

    public String getProgress() {
        return progress;
    }

    public void setProgress(String progress) {
        this.progress = progress;
    }

    public Date getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(Date paymentDate) {
        this.paymentDate = paymentDate;
    }

    public String getPaymentAmount() {
        return paymentAmount;
    }

    public void setPaymentAmount(String paymentAmount) {
        this.paymentAmount = paymentAmount;
    }

}
