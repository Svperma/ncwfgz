package com.dsib.service.impl;

import com.dsib.dao.GuPaymentMapper;
import com.dsib.dao.GuPaymentOrderMapper;
import com.dsib.dao.GuPaymentTempMapper;
import com.dsib.dto.ParameterGgBuildingMst;
import com.dsib.dto.PaymentResult;
import com.dsib.dto.UpdateBuildingMst;
import com.dsib.dto.UploadParameter;
import com.dsib.entity.*;
import com.dsib.service.GgBuildingMstService;
import com.dsib.service.GuPaymentTempService;
import com.dsib.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


@Service(value = "ggPaymentTemService")
public class GuPaymentTempServiceImpl implements GuPaymentTempService {

    private static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

    @Autowired
    private GuPaymentTempMapper guPaymentTempMapper;
    @Autowired
    private GuPaymentOrderMapper guPaymentOrderMapper;
    @Autowired
    private GuPaymentMapper guPaymentMapper;
    @Resource(name = "ggBuildingMstService")
    private GgBuildingMstService ggBuildingMstService;

    // 添加临时表
    @Override
    @Transactional
//    @Rollback
    public void insertOrderTem(UploadParameter uploadParameter) throws ParseException {
        String orderNo = uploadParameter.getOrderno();
        orderNo = orderNo == null || "".equals(orderNo) ? StringUtil.getBusinessNo() : orderNo;
        uploadParameter.setOrderno(orderNo);
        List<ParameterGgBuildingMst> list = uploadParameter.getList();
        for (ParameterGgBuildingMst p : list) {
            GuPaymentTempKey guPaymentTempKey = new GuPaymentTempKey();
            guPaymentTempKey.setId(p.getId());
            guPaymentTempKey.setOrderno(orderNo);
            GuPaymentTemp gu = guPaymentTempMapper.selectByPrimaryKey(guPaymentTempKey);
            if (gu != null) {
                GuPaymentTemp guParameterTem = getGuParameterTemp(gu, orderNo, p);
                guPaymentTempMapper.updateByPrimaryKeySelective(guParameterTem);
            } else {
                GuPaymentTemp guParameterTem = getGuParameterTemp(new GuPaymentTemp(), orderNo, p);
                guPaymentTempMapper.insert(guParameterTem);
            }
        }
        GuPaymentOrder order = guPaymentOrderMapper.selectByPrimaryKey(orderNo);
        if (order == null) {
            GuPaymentOrder guPaymentOrder = this.getGuPaymentOrder(uploadParameter, new GuPaymentOrder(), "0");
            guPaymentOrderMapper.insert(guPaymentOrder);
        } else {
            guPaymentOrderMapper.updateByPrimaryKey(this.getGuPaymentOrder(uploadParameter, order, "0"));
        }
    }

    private GuPaymentTemp getGuParameterTemp(GuPaymentTemp guPaymentTemp, String orderOn, ParameterGgBuildingMst p) {
        guPaymentTemp.setId(p.getId());
        guPaymentTemp.setAccount(p.getAccount());
        guPaymentTemp.setBank(p.getBank());
        guPaymentTemp.setInputcode(p.getInputcode());
        guPaymentTemp.setOperatetdate(new Date());
        guPaymentTemp.setPaymentdate(new Date());
        guPaymentTemp.setInputtime(new Date());
        guPaymentTemp.setPaymentamount(p.getPaymentamount());
        guPaymentTemp.setProgress(p.getProgress());
        guPaymentTemp.setOrderno(orderOn);
        guPaymentTemp.setId(p.getId());
        return guPaymentTemp;
    }

    // 添加正式表
    @Override
    @Transactional
    public void insertOrder(UploadParameter uploadParameter) throws ParseException {
        //添加正式表，更新order表 删除临时表数据 同一事物
        String orderNo = uploadParameter.getOrderno();
        orderNo = orderNo == null || "".equals(orderNo) ? StringUtil.getBusinessNo() : orderNo;
        uploadParameter.setOrderno(orderNo);
        List<ParameterGgBuildingMst> list = uploadParameter.getList();
        List<String> ids = new ArrayList<>();
        for (ParameterGgBuildingMst p : list) {
            ids.add(p.getId());
            GuPaymentKey key = new GuPaymentKey();
            key.setId(p.getId());
            key.setOrderno(orderNo);
            GuPayment guPayment = guPaymentMapper.selectByPrimaryKey(key);
            if (guPayment != null) {
                GuPayment updatePaument = this.createPayment(uploadParameter, p, guPayment);
                guPaymentMapper.updateByPrimaryKeySelective(updatePaument);
                continue;
            } else {
                GuPayment insertPaument = this.createPayment(uploadParameter, p, new GuPayment());
                guPaymentMapper.insert(insertPaument);
                continue;
            }
        }



//        guPaymentTempMapper.deleteAll(ids, orderNo);
        GuPaymentOrder order = guPaymentOrderMapper.selectByPrimaryKey(orderNo);
        if (order == null) {
            GuPaymentOrder guPaymentOrder = getGuPaymentOrder(uploadParameter, new GuPaymentOrder(),"1");
            guPaymentOrderMapper.insert(guPaymentOrder);
        } else {
            guPaymentOrderMapper.updateByPrimaryKey(getGuPaymentOrder(uploadParameter,order,"1"));
        }
    }


    private GuPaymentOrder getGuPaymentOrder(UploadParameter uploadParameter, GuPaymentOrder guPaymentOrder, String status ) {

        guPaymentOrder.setOrderno(uploadParameter.getOrderno());
        guPaymentOrder.setOrderdate(uploadParameter.getOrderdate());
        guPaymentOrder.setSumamount(Integer.parseInt(uploadParameter.getSumamount()));
        guPaymentOrder.setAttachmentpath(uploadParameter.getFilePath());
        guPaymentOrder.setSumquantity(Integer.parseInt(uploadParameter.getSumquantity()));
        guPaymentOrder.setSumquantity(Integer.parseInt(uploadParameter.getSumquantity()));
        guPaymentOrder.setInputtime(new Date());
        guPaymentOrder.setUpdatecode(uploadParameter.getUpdateCode());
        guPaymentOrder.setUpdatetime(new Date());
        guPaymentOrder.setInputcode(uploadParameter.getInputCode());
        guPaymentOrder.setStatus(status);
        guPaymentOrder.setAuditstatus(uploadParameter.getAuditstatus());
        guPaymentOrder.setAuditcode(uploadParameter.getAuditcode());
        return guPaymentOrder;
    }

    private GuPayment createPayment(UploadParameter uploadParameter, ParameterGgBuildingMst p, GuPayment guPayment) {
        guPayment.setId(p.getId());
        guPayment.setAccount(p.getAccount());
        guPayment.setBank(p.getBank());
        guPayment.setInputcode(p.getInputcode());
        guPayment.setPaymentdate(new Date());
        guPayment.setUpdatecode(uploadParameter.getUpdateCode());
        guPayment.setOperatetdate(new Date());
        guPayment.setInputtime(new Date());
        guPayment.setUpdatetime(new Date());
        guPayment.setPaymentdate(p.getPaymentdate());
//        int paymentampunt = p.getPaymentamount() + (p.getFinishamount() == null || "".equals(p.getFinishamount())? 0 : p.getFinishamount())
        guPayment.setPaymentamount(p.getPaymentamount());
        guPayment.setProgress(p.getProgress());
        guPayment.setOrderno(uploadParameter.getOrderno());
        guPayment.setId(p.getId());
        guPayment.setYetcashamount(p.getYetcashamount());
        return guPayment;
    }

    @Override
    public List<ParameterGgBuildingMst> getTempByOrderNo(String orderNo) {
        return guPaymentTempMapper.retrieveByOrderNo(orderNo);
    }

    @Override
    public List<GuPaymentTemp> getTemps(String orderNo) {
        return guPaymentTempMapper.getTempByOrderNo(orderNo);
    }

    @Override
    public List<PaymentResult> getTempByOrderNos(String orderNo) {
        return guPaymentTempMapper.getTempByOrderNos(orderNo);
    }
}
