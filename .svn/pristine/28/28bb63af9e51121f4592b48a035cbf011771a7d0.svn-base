package com.dsib.service;

import com.dsib.dto.PaymentResult;
import com.dsib.entity.GuPayment;

import java.util.List;

public interface GuPaymentService {
    List<PaymentResult> getPaymentsByOrderNo(String orderNo);

    void createGuPayment(GuPayment guPayment);

    GuPayment getPayment(String orderNo, String id);

    void updatePayment(GuPayment guPayment);

    Integer getSum(String id);

    List<GuPayment> getPaymentsById(String orderNo);
}
