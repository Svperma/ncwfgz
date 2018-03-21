package com.dsib.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dsib.dao.GgAuditMapper;
import com.dsib.entity.GgAudit;
import com.dsib.entity.GgAuditKey;
import com.dsib.service.GgAuditService;
@Service("ggAuditService")
public class GgAuditServiceImpl implements GgAuditService {

	@Autowired
	private GgAuditMapper ggAuditMapper;
	@Override
	public int deleteByPrimaryKey(GgAuditKey key) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insert(GgAudit record) {
		int n = ggAuditMapper.insert(record);
		return n;
	}

	@Override
	public int insertSelective(GgAudit record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public GgAudit selectByPrimaryKey(GgAuditKey key) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateByPrimaryKeySelective(GgAudit record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByPrimaryKey(GgAudit record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<GgAudit> listAudits(String id) {
		List<GgAudit> list = ggAuditMapper.listAudits(id);
		return list;
	}

}
