package com.dsib.entity;

import java.io.Serializable;
import java.util.List;

public class GgAuditConfigList implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private List<GgAuditConfig> userList;
	private List<GgAuditConfig> paymentList;
	public List<GgAuditConfig> getUserList() {
		return userList;
	}
	public void setUserList(List<GgAuditConfig> userList) {
		this.userList = userList;
	}
	public List<GgAuditConfig> getPaymentList() {
		return paymentList;
	}
	public void setPaymentList(List<GgAuditConfig> paymentList) {
		this.paymentList = paymentList;
	}

}
