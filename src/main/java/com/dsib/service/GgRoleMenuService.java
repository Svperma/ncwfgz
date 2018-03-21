package com.dsib.service;

import java.util.List;

import com.dsib.entity.GgRoleMenu;

public interface GgRoleMenuService {

	//根据role_code查询
    List<GgRoleMenu> listRoleMenusByRoleCode(String roleCode);
    
    int deleteByRoleCode(String roleCode);
    int insertAll(List<GgRoleMenu> list);
}
