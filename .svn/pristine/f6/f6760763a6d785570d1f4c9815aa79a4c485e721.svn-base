package com.dsib.dao;

import java.util.List;

import com.dsib.common.Pagination;
import com.dsib.entity.GgRole;

public interface GgRoleMapper {
    int deleteByPrimaryKey(String roleCode);

    int insert(GgRole record);

    int insertSelective(GgRole record);

    GgRole selectByPrimaryKey(String roleCode);

    int updateByPrimaryKeySelective(GgRole record);

    int updateByPrimaryKey(GgRole record);

	List<GgRole> getGgRoleByObj(GgRole role);
	
	List<GgRole> listRoles(Pagination pagination);
	
	List<GgRole> listRolesAll();

}