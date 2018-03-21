package com.dsib.service;


import com.dsib.common.Pagination;
import com.dsib.entity.GuPaymentOrder;

import java.util.List;
import java.util.Map;

public interface GuPaymentOrderService {

    List<GuPaymentOrder> getPaymentOrderByStatus(Map<String, Object> map);

    GuPaymentOrder getOrderByNo(String orderNo);

    List<Map<String, Object>> getPayMentOrderByPag(Pagination pagination);
    
    List<GuPaymentOrder> listPaymentAudits(Pagination pagination);
    
    int updateByPrimaryKey(GuPaymentOrder record);

    List<Map<String,Object>> getPayMentOrderByExcel(Map<String, Object> map);
}
