package com.dsib.dao;

import com.dsib.common.Pagination;
import com.dsib.entity.GuPaymentOrder;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface GuPaymentOrderMapper {
    int deleteByPrimaryKey(String orderno);

    int insert(GuPaymentOrder record);

    int insertSelective(GuPaymentOrder record);

    GuPaymentOrder selectByPrimaryKey(String orderno);

    int updateByPrimaryKeySelective(GuPaymentOrder record);

    int updateByPrimaryKey(GuPaymentOrder record);

    List<GuPaymentOrder> getPaymentOrder(Map<String, Object> map);
    List<GuPaymentOrder> getPaymentOrderByStatus(@Param("userCodes") List<String> userCodes,
                                                 @Param("status") String status,
                                                 @Param("auditStatus") String auditStatus);

    List<Map<String,Object>> getPaymentOrderByPag(Pagination pagination);
    
    List<GuPaymentOrder> listPaymentAudits(Pagination pagination);

    List<Map<String,Object>> getPaymentOrderByExcel(Map<String, Object> map);
}