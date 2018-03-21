package com.dsib.dao;

import com.dsib.entity.GgCode;
import com.dsib.entity.GgCodeKey;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface GgCodeMapper {
    int deleteByPrimaryKey(GgCodeKey key);

    int insert(GgCode record);

    int insertSelective(GgCode record);

    GgCode selectByPrimaryKey(GgCodeKey key);

    int updateByPrimaryKeySelective(GgCode record);

    int updateByPrimaryKey(GgCode record);

    List<GgCode> getGgCode(String codeType);
    
    List<GgCode> getGgCodeByObj(GgCode code);

    GgCode getProvince(@Param("codeType") String codeType, @Param("provinceCode") String provinceCode);

    List<GgCode> getCity(@Param("codeType") String codeType, @Param("provinceCode") String provinceCode);
}