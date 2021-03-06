package com.dsib.service;

import com.dsib.dto.ParameterGgBuildingMst;
import com.dsib.dto.PaymentResult;
import com.dsib.dto.UploadParameter;
import com.dsib.entity.GuPaymentTemp;

import java.text.ParseException;
import java.util.List;

public interface GuPaymentTempService {

   void insertOrderTem(UploadParameter uploadParameter) throws ParseException;

    void insertOrder(UploadParameter uploadParameter) throws ParseException;

    List<ParameterGgBuildingMst> getTempByOrderNo(String orderNo);

    List<GuPaymentTemp> getTemps(String orderNo);

    List<PaymentResult> getTempByOrderNos(String orderNo);
}
