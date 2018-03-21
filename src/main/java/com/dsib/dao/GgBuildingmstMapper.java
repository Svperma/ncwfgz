package com.dsib.dao;

import com.dsib.common.Pagination;
import com.dsib.dto.UpdateBuildingMst;
import com.dsib.entity.GgBuildingmst;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface GgBuildingmstMapper {
    int deleteByPrimaryKey(String id);

    int insert(GgBuildingmst record);

    int insertSelective(GgBuildingmst record);

    GgBuildingmst selectByPrimaryKey(String id);

    Map<String, Object> retrieveBuildingMst(String id);

    UpdateBuildingMst retrieveBuildingMstBuObject(String id);

    int updateByPrimaryKeySelective(GgBuildingmst record);

    int updateByPrimaryKey(GgBuildingmst record);

    /**
     * 查询所有
     *
     * @return 所有危房
     */
    List<GgBuildingmst> getGgBuildingmstAll(Map<String, Object> map);
    Map<String, String> getGgBuildingmstCount(Map<String, Object> map);


    List<Map<String, Object>> getGgBuildingmstPage(Pagination pagination);  ///
    List<Map<String, Object>> getGgMessageBuildingmstPage(Pagination pagination);  ///

    GgBuildingmst getByPrimaryKey(@Param("id") String id);

    List<Map<String, Object>> getGgBuildingmstAllJoin(Pagination pagination);


    List<Map<String, Object>> getCityCashStatistics(Pagination pagination);


    List<GgBuildingmst> getBuildingMstasByMap(Map<String, Object> map);


    List<Map<String, Object>> getGgBuildingmstAs(Map map);

    List<Map<String,Object>> getGgBuildingmstAllJoinMap(Map<String, Object> map);

    List<Map<String,Object>> getCityCashStatisticsToMap(Map<String, Object> map);

    int retrieveGgBuildingMst(String identityId);

    void updateByStatus(@Param("status") String status, @Param("id") String id);

    List<Map<String,Object>> getGgMessageBuildingmstExcel(Map<String, Object> map);

    void insertAll(@Param(value = "list") List<GgBuildingmst> list);
}