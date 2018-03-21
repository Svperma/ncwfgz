package com.dsib.service;

import java.util.List;

import com.dsib.entity.GgAuditConfig;
import com.dsib.entity.GgAuditConfigKey;

public interface GgAuditConfigService {

	int deleteByPrimaryKey(GgAuditConfigKey key);

    int insert(GgAuditConfig record);

    int insertSelective(GgAuditConfig record);

    GgAuditConfig selectByPrimaryKey(GgAuditConfigKey key);

    int updateByPrimaryKeySelective(GgAuditConfig record);

    int updateByPrimaryKey(GgAuditConfig record);
    
    int deleteByAuditType(String auditType);
    
    int insertAll(List<GgAuditConfig> list);
    
    List<GgAuditConfig> listByAuditType(String auditType);

    GgAuditConfig retrieveByAudit(String type, String auditCode);
}
