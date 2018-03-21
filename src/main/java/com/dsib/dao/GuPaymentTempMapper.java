package com.dsib.dao;

import com.dsib.dto.ParameterGgBuildingMst;
import com.dsib.dto.PaymentResult;
import com.dsib.entity.GuPaymentTemp;
import com.dsib.entity.GuPaymentTempKey;

import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface GuPaymentTempMapper {
    int deleteByPrimaryKey(GuPaymentTempKey key);

    int insert(GuPaymentTemp record);

    int insertSelective(GuPaymentTemp record);

    GuPaymentTemp selectByPrimaryKey(GuPaymentTempKey key);

    int updateByPrimaryKeySelective(GuPaymentTemp record);

    int updateByPrimaryKey(GuPaymentTemp record);

    List<ParameterGgBuildingMst> retrieveByOrderNo(@Param("orderNo") String orderNo);

    void deleteAll(@Param("ids") List<String> ids, @Param("orderNo") String orderNo);

    List<PaymentResult> getTempByOrderNos(String orderNo);

    List<GuPaymentTemp> getTempByOrderNo(@Param("orderNo") String orderNo);
}