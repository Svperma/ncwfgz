package com.dsib.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dsib.dao.GgAuditConfigMapper;
import com.dsib.entity.GgAuditConfig;
import com.dsib.entity.GgAuditConfigKey;
import com.dsib.service.GgAuditConfigService;
@Service("ggAuditConfigService")
public class GgAuditConfigServiceImpl implements GgAuditConfigService {

	@Autowired
	private GgAuditConfigMapper ggAuditConfigMapper;
	

	@Override
	public int deleteByAuditType(String auditType) {
		int n = ggAuditConfigMapper.deleteByAuditType(auditType);
		return n;
	}

	@Override
	public int insertAll(List<GgAuditConfig> list) {
		int n = ggAuditConfigMapper.insertAll(list);
		return n;
	}

	@Override
	public List<GgAuditConfig> listByAuditType(String auditType) {
		List<GgAuditConfig> list = ggAuditConfigMapper.listByAuditType(auditType);
		return list;
	}

	@Override
	public GgAuditConfig retrieveByAudit(String type, String auditCode) {
		return ggAuditConfigMapper.retrieveByAudit(type, auditCode);
	}

	@Override
	public int deleteByPrimaryKey(GgAuditConfigKey key) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insert(GgAuditConfig record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertSelective(GgAuditConfig record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public GgAuditConfig selectByPrimaryKey(GgAuditConfigKey key) {
		GgAuditConfig auditConfig = ggAuditConfigMapper.selectByPrimaryKey(key);
		return auditConfig;
	}

	@Override
	public int updateByPrimaryKeySelective(GgAuditConfig record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByPrimaryKey(GgAuditConfig record) {
		// TODO Auto-generated method stub
		return 0;
	}

}
