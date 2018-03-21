package com.dsib.service.impl;

import com.dsib.dao.GuPaymentMapper;
import com.dsib.dto.PaymentResult;
import com.dsib.entity.GuPayment;
import com.dsib.entity.GuPaymentKey;
import com.dsib.service.GuPaymentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service(value = "guPaymentService")
public class GuPaymentServiceImpl implements GuPaymentService {

    @Autowired
    public GuPaymentMapper guPaymentMapper;

    @Override
    public List<PaymentResult> getPaymentsByOrderNo(String orderNo) {
        return guPaymentMapper.retrievePaymentByOrderNo(orderNo);
    }

    @Override
    public void createGuPayment(GuPayment guPayment) {
        guPaymentMapper.insert(guPayment);
    }

    @Override
    public GuPayment getPayment(String orderNo, String id) {
        GuPaymentKey guPaymentKey = new GuPaymentKey(orderNo, id);
        return guPaymentMapper.selectByPrimaryKey(guPaymentKey);
    }

    @Override
    public void updatePayment(GuPayment guPayment) {
        guPaymentMapper.updateByPrimaryKey(guPayment);
    }

    @Override
    public Integer getSum(String id) {
        return guPaymentMapper.getSum(id);
    }

    @Override
    public List<GuPayment> getPaymentsById(String orderNo) {

        return guPaymentMapper.retrievePayments(orderNo);
    }


}
