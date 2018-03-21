package com.dsib.dao;

import java.util.List;

import com.dsib.entity.GgRoleMenu;
import com.dsib.entity.GgRoleMenuKey;

public interface GgRoleMenuMapper {
    int deleteByPrimaryKey(GgRoleMenuKey key);

    int insert(GgRoleMenu record);

    int insertSelective(GgRoleMenu record);

    GgRoleMenu selectByPrimaryKey(GgRoleMenuKey key);

    int updateByPrimaryKeySelective(GgRoleMenu record);

    int updateByPrimaryKey(GgRoleMenu record);
    
    //根据role_code查询
    List<GgRoleMenu> listRoleMenusByRoleCode(String roleCode);
    
    int deleteByRoleCode(String roleCode);
    
    int insertAll(List<GgRoleMenu> list);
}