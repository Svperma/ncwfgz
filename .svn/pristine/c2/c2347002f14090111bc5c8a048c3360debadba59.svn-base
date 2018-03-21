package com.dsib.service;

import java.util.List;
import java.util.Map;

import com.dsib.common.Pagination;
import com.dsib.entity.GgUser;

public interface GgUserService {

	GgUser getUserByUserCode(String userCode);
	
	List<Map<String, String>> listRoledUser(Pagination pagination);
	
	List<Map<String, String>> listUnRoledUser();
	
	void updateUser(GgUser ggUser);

	void updateUser(String usercode);

	List<Map<String,Object>> getUserAll(Pagination pagination);

	Boolean deleteUser(String usercode);

	void saveUser(GgUser user);

	Integer getUserByRemark(String userCode);
}
