package com.dsib.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dsib.common.Pagination;
import com.dsib.dao.GgMenuMapper;
import com.dsib.entity.GgMenu;
import com.dsib.service.GgMenuService;
@Service("ggMenuService")
public class GgMenuServiceImpl implements GgMenuService {

	@Autowired
	private GgMenuMapper ggMenuMapper;
	@Override
	public List<GgMenu> listMenus(String roleCode) {
		List<GgMenu> list = ggMenuMapper.listMenus(roleCode);
		return list;
	}
	@Override
	public List<GgMenu> listMenusByPagination(Pagination pagination,
			String other) {
		List<GgMenu> list = ggMenuMapper.listMenusByPagination(pagination);
		return list;
	}
	@Override
	public int insertSelective(GgMenu record) {
		int n = ggMenuMapper.insertSelective(record);
		return n;
	}
	@Override
	public int deleteByPrimaryKey(String menuCode) {
		int n = ggMenuMapper.deleteByPrimaryKey(menuCode);
		return n;
	}
	@Override
	public int updateByPrimaryKeySelective(GgMenu record) {
		int n = ggMenuMapper.updateByPrimaryKeySelective(record);
		return n;
	}
	@Override
	public List<GgMenu> listMenusByPrimaryKey(String menuCode) {
		List<GgMenu> list = ggMenuMapper.listMenusByPrimaryKey(menuCode);
 		return list;
	}

}
