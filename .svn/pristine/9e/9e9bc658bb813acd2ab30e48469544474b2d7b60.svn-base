package com.dsib.dao;

import java.util.List;
import java.util.Map;

import com.dsib.common.Pagination;
import com.dsib.dto.UpdateBuildingMst;
import com.dsib.dto.UpdateBuildingMstOne;
import com.dsib.entity.GgBuildingmstHis;
import org.apache.ibatis.annotations.Param;

public interface GgBuildingmstHisMapper {
    int deleteByPrimaryKey(String businessno);

    int insert(GgBuildingmstHis record);

    int insertSelective(GgBuildingmstHis record);

    GgBuildingmstHis selectByPrimaryKey(String businessno);

    int updateByPrimaryKeySelective(GgBuildingmstHis record);

    int updateByPrimaryKey(GgBuildingmstHis record);

    GgBuildingmstHis selectById(@Param("id") String id,@Param("businessno") String businessno);

    List<GgBuildingmstHis> listBuildingAudits(Pagination pagination);

    UpdateBuildingMst getGgBuildingmstHisByBusinessno(String id);

    void updateGgBuildingMstStstus(UpdateBuildingMstOne ggBuildingmstOne);

    GgBuildingmstHis getGgBuildingmstHisByIdAndBusinessno(@Param("id") String id, @Param("businessno") String businessno);

    void updateAllStstus(@Param("id") String id, @Param("status") String status);

}