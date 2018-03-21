package com.dsib.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dsib.dao.GgRoleMenuMapper;
import com.dsib.entity.GgRoleMenu;
import com.dsib.service.GgRoleMenuService;
@Service("ggRoleMenuService")
public class GgRoleMenuServiceImpl implements GgRoleMenuService {

	@Autowired
	private GgRoleMenuMapper ggRoleMenuMapper;
	@Override
	public List<GgRoleMenu> listRoleMenusByRoleCode(String roleCode) {
		List<GgRoleMenu> list = ggRoleMenuMapper.listRoleMenusByRoleCode(roleCode);
		return list;
	}
	@Override
	public int deleteByRoleCode(String roleCode) {
		int n = ggRoleMenuMapper.deleteByRoleCode(roleCode);
		return n;
	}
	@Override
	public int insertAll(List<GgRoleMenu> list) {
		int n = ggRoleMenuMapper.insertAll(list);
		return n;
	}

}
