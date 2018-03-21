package com.dsib.dao;

import java.util.List;

import com.dsib.common.Pagination;
import com.dsib.entity.GgMenu;

public interface GgMenuMapper {
    int deleteByPrimaryKey(String menuCode);

    int insert(GgMenu record);

    int insertSelective(GgMenu record);

    GgMenu selectByPrimaryKey(String menuCode);

    int updateByPrimaryKeySelective(GgMenu record);

    int updateByPrimaryKey(GgMenu record);
    
    List<GgMenu> listMenus(String roleCode);
    
    List<GgMenu> listMenusByPagination(Pagination pagination);
    
    List<GgMenu> listMenusByPrimaryKey(String menuCode);
}