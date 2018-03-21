package com.dsib.dao;

import java.util.List;

import com.dsib.entity.GgAudit;
import com.dsib.entity.GgAuditKey;

public interface GgAuditMapper {
    int deleteByPrimaryKey(GgAuditKey key);

    int insert(GgAudit record);

    int insertSelective(GgAudit record);

    GgAudit selectByPrimaryKey(GgAuditKey key);

    int updateByPrimaryKeySelective(GgAudit record);

    int updateByPrimaryKey(GgAudit record);
    
    List<GgAudit> listAudits(String id);
}