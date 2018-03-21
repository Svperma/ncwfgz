package com.dsib.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dsib.common.Pagination;
import com.dsib.dao.GgRoleMapper;
import com.dsib.entity.GgRole;
import com.dsib.service.GgRoleService;
@Service("ggRoleService")
public class GgRoleServiceImpl implements GgRoleService {

	@Autowired
	private GgRoleMapper ggRoleMapper;
	@Override
	public List<GgRole> listRoles(Pagination pagination) {
		List<GgRole> list = ggRoleMapper.listRoles(pagination);
		return list;
	}
	@Override
	public List<GgRole> listRolesAll() {
		List<GgRole> list = ggRoleMapper.listRolesAll();
		return list;
	}
	@Override
	public int insert(GgRole record) {
		int n = ggRoleMapper.insert(record);
		return n;
	}
	@Override
	public int deleteByPrimaryKey(String key) {
		int n = ggRoleMapper.deleteByPrimaryKey(key);
		return n;
	}
	@Override
	public GgRole selectByPrimaryKey(String roleCode) {
		GgRole ggRole = ggRoleMapper.selectByPrimaryKey(roleCode);
		return ggRole;
	}
	

}
