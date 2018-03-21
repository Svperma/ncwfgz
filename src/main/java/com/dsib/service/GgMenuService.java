package com.dsib.service;

import java.util.List;

import com.dsib.common.Pagination;
import com.dsib.entity.GgMenu;

public interface GgMenuService {

	//查询按钮
	List<GgMenu> listMenus(String roleCode);
	
	List<GgMenu> listMenusByPagination(Pagination pagination,String other);
	
	int insertSelective(GgMenu record);
	
	int deleteByPrimaryKey(String menuCode);
	
	int updateByPrimaryKeySelective(GgMenu record);
	
	List<GgMenu> listMenusByPrimaryKey(String menuCode);
}
