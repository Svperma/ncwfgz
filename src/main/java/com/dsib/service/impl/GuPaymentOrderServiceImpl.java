package com.dsib.service.impl;


import com.dsib.entity.GuPayment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dsib.common.Pagination;
import com.dsib.dao.GuPaymentOrderMapper;
import com.dsib.entity.GuPaymentOrder;
import com.dsib.service.GuPaymentOrderService;

import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;

@Service(value = "guPaymentOrderService")
public class GuPaymentOrderServiceImpl implements GuPaymentOrderService {

    @Autowired
    private GuPaymentOrderMapper guPaymentOrderMapper;

    @Override
    public List<GuPaymentOrder> getPaymentOrderByStatus(Map<String, Object> map) {
        return guPaymentOrderMapper.getPaymentOrder(map);
//        List<GuPaymentOrder> paymentOrders = guPaymentOrderMapper.getPaymentOrderByStatus(list, status, auditStstus);
//        for(GuPaymentOrder guPaymentOrder : paymentOrders){
//            String path = guPaymentOrder.getAttachmentpath();
//            guPaymentOrder.setAttachmentpath(path);
//        }
    }

    @Override
    public GuPaymentOrder getOrderByNo(String orderNo) {
        GuPaymentOrder paymentOrder = guPaymentOrderMapper.selectByPrimaryKey(orderNo);
//        String path = paymentOrder.getAttachmentpath();
//        path = path == null ? "/" : path.substring(path.lastIndexOf('/'));
//        paymentOrder.setAttachmentpath(path);
        return paymentOrder;
    }

    @Override
    public List<Map<String, Object>> getPayMentOrderByPag(Pagination pagination) {
        return guPaymentOrderMapper.getPaymentOrderByPag(pagination);
    }

	@Override
	public List<GuPaymentOrder> listPaymentAudits(Pagination pagination) {
		List<GuPaymentOrder> list = guPaymentOrderMapper.listPaymentAudits(pagination);
		return list;
	}

	@Override
	public int updateByPrimaryKey(GuPaymentOrder record) {
		int n = guPaymentOrderMapper.updateByPrimaryKey(record);
		return n;
	}

    @Override
    public List<Map<String, Object>> getPayMentOrderByExcel(Map<String, Object> map) {
        List<Map<String, Object>> paymentOrderByExcel = guPaymentOrderMapper.getPaymentOrderByExcel(map);
        for(Map<String, Object> m : paymentOrderByExcel){
            Set<Map.Entry<String, Object>> entries = m.entrySet();
            for(Map.Entry<String, Object> mp : entries) {
                if("ATTACHMENTPATH".equals(mp.getKey())){
                    String value  = mp.getValue().toString().substring(mp.getValue().toString().lastIndexOf("\\\\")+2);
                    mp.setValue(value);
                }
            }
        }
        return paymentOrderByExcel;
    }
}
