package com.dsib.service;

import com.dsib.common.Pagination;
import com.dsib.dto.UpdateBuildingMst;
import com.dsib.dto.UpdateBuildingMstOne;
import com.dsib.entity.GgBuildingmst;
import com.dsib.entity.GgBuildingmstHis;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;

public interface GgBuildingMstService {

    Map<String, Object> initData(Map<String,Object> map) throws Exception;
    Map<String, String> initData2(Map<String,Object> map) throws Exception;

    UpdateBuildingMst getBuildingMst(String id);
    Map<String,Object> getBuildingMstMap(String id);

    GgBuildingmst getBuildingMsts(String id);

    List<Map<String,Object>> getAllBuildingMst(Pagination pagination);
    List<Map<String,Object>> getAllMessageBuildingMst(Pagination pagination);

    List<Map<String,Object>> getAllBuildingMstjoin(Pagination pagination);
    List<Map<String,Object>> getAllBuildingMstjoinMap(Map<String, Object> map);

    Pagination getAllMessageBuildingMstContext(Pagination pagination);
    Pagination getAllBuildingMstContext(Pagination pagination);

    void updateBuilding(UpdateBuildingMstOne ggBuildingmst);

    GgBuildingmst getBuildingMstas(String id);

    List<Map<String,Object>> getCityCashStatistics(Pagination pagination);

    List<GgBuildingmst> getBuildingMstas(Map<String, Object> map);
    
    List<GgBuildingmstHis> listBuildingAudits(Pagination pagination);
    
    GgBuildingmstHis getBuildingMstHisByKey(String businessNo);

    void updateGgBuildingMst(GgBuildingmst ggBuildingmst);
    

    void installGgBuilding(UpdateBuildingMstOne ggBuildingmst);

    List<Map<String,Object>> getAllBuildingExcel(Map<String, Object> map);

    List<Map<String,Object>> getCityCashStatisticsExcel(Map<String, Object> map);

    int getGgBuildingMstByIdentityId(String identityId);

    void updateGgBuildingMstByBank(String id, String bank, String account);

    void insertAll(List<GgBuildingmst> list);
}
