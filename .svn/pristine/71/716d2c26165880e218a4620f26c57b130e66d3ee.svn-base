package com.dsib.dao;

import com.dsib.dto.PaymentResult;
import com.dsib.entity.GuPayment;
import com.dsib.entity.GuPaymentKey;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface GuPaymentMapper {
    int deleteByPrimaryKey(GuPaymentKey key);

    int insert(GuPayment record);

    int insertSelective(GuPayment record);

    GuPayment selectByPrimaryKey(GuPaymentKey key);

    int updateByPrimaryKeySelective(GuPayment record);

    int updateByPrimaryKey(GuPayment record);

    List<PaymentResult> retrievePaymentByOrderNo(@Param("orderNo") String orderNo);

    Integer getSum(String id);

    List<GuPayment> retrievePayments(String orderNo);
}