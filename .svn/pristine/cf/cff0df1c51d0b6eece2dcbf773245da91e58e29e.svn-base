package com.dsib.service.impl;

import com.dsib.dao.GgBuildingmstHisMapper;
import com.dsib.dto.UpdateBuildingMst;
import com.dsib.dto.UpdateBuildingMstOne;
import com.dsib.entity.GgBuildingmstHis;
import com.dsib.service.GgBuildingMstHisService;
import com.dsib.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service(value = "ggBuildingMstHisService")
public class GgBuildingMstHisServiceImpl implements GgBuildingMstHisService {

    @Autowired
    private GgBuildingmstHisMapper ggBuildingmstHisMapper;

    /**
     * 只更新his 更新状态为修改审核完成
     * @param ggBuildingmstOne
     */
    @Override
    public void updateGgBuildingMstHis(UpdateBuildingMstOne ggBuildingmstOne) {
        ggBuildingmstHisMapper.updateGgBuildingMstStstus(ggBuildingmstOne);
    }

    @Override
    public void installGgBuildingMstHis(UpdateBuildingMstOne updateBuildingMstOne) {
//        首次添加
        GgBuildingmstHis ggBuildingMstHis = this.getCreateGgBuildingMstHis(updateBuildingMstOne);
        ggBuildingMstHis.setBusinessno(StringUtil.getBusinessNo());
        ggBuildingMstHis.setId("".intern().equals(updateBuildingMstOne.getId()) ? StringUtil.getBusinessNo() : updateBuildingMstOne.getId());
        ggBuildingMstHis.setStatus(updateBuildingMstOne.getStatus()); // 待审核状态  审核中
        ggBuildingmstHisMapper.insert(ggBuildingMstHis);
        // 如果审核通过 修改所有his 此对象所有的状态为通过
        if("3".intern().equals(updateBuildingMstOne.getStatus())){
            ggBuildingmstHisMapper.updateAllStstus(updateBuildingMstOne.getId(), updateBuildingMstOne.getStatus());
        }
    }

    /**
     * 修改 his 表中审核人
     * @param ggBuildingmstOne
     */
    @Override
    public void updateGgBuildingMstAudit(UpdateBuildingMstOne ggBuildingmstOne) {
        GgBuildingmstHis ggBuildingmstHis = ggBuildingmstHisMapper.getGgBuildingmstHisByIdAndBusinessno(ggBuildingmstOne.getId(), ggBuildingmstOne.getBusinessno());
        ggBuildingmstHis.setTown(ggBuildingmstOne.getTown());
        ggBuildingmstHisMapper.updateByPrimaryKeySelective(ggBuildingmstHis);
    }

    @Override
    public void updateGgBuildingMstNoneAudit(UpdateBuildingMstOne ggBuildingmstOne) {
        GgBuildingmstHis ggBuildingmstHis = ggBuildingmstHisMapper.getGgBuildingmstHisByIdAndBusinessno(ggBuildingmstOne.getId(), ggBuildingmstOne.getBusinessno());
        ggBuildingmstHis.setStatus("2");
        ggBuildingmstHisMapper.updateByPrimaryKeySelective(ggBuildingmstHis);
    }

    @Override
    public UpdateBuildingMst getGgBuildingMstHis(String businessno) {
        return ggBuildingmstHisMapper.getGgBuildingmstHisByBusinessno(businessno);
    }

    private GgBuildingmstHis getCreateGgBuildingMstHis(UpdateBuildingMstOne one){
        GgBuildingmstHis buildingmstHis = new GgBuildingmstHis();
        buildingmstHis.setFinishamount(one.getFinishamount());
        buildingmstHis.setProgress(one.getProgress());
        buildingmstHis.setFilePath(one.getFilePath());
        buildingmstHis.setDiscription(one.getDiscription());
        buildingmstHis.setAccount(one.getAccount());
        buildingmstHis.setAddress(one.getAddress());
        buildingmstHis.setBank(one.getBank());
        buildingmstHis.setCity(one.getCity());
        buildingmstHis.setCounty(one.getCounty());
        buildingmstHis.setFinishstatus(one.getFinishstatus());
        buildingmstHis.setGrade(one.getGrade());
        buildingmstHis.setVillage(one.getVillage());
        buildingmstHis.setType(one.getType());
        buildingmstHis.setSunamount(one.getSunamount());
        buildingmstHis.setStartyear(one.getStartyear());
        buildingmstHis.setPeoplenumber(one.getPeoplenumber());
        buildingmstHis.setInputcode(one.getInputcode());
        buildingmstHis.setInputtime(one.getInputtime());
        buildingmstHis.setHouseholder(one.getHouseholder());
        buildingmstHis.setId(StringUtil.getBusinessNo());
        buildingmstHis.setIdentityid(one.getIdentityid());
        buildingmstHis.setTown(one.getTown());
        buildingmstHis.setProvince("520000");
        return buildingmstHis;
    }
}
