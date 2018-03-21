package com.dsib.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dsib.common.Pagination;
import com.dsib.dao.GgUserMapper;
import com.dsib.entity.GgUser;
import com.dsib.service.GgUserService;
import org.springframework.transaction.annotation.Transactional;

@Service("ggUserService")
public class GgUserServiceImpl implements GgUserService {

	private static final String INVALID = "0";

	@Autowired
	private GgUserMapper ggUserMapper;
	@Override
	public GgUser getUserByUserCode(String userCode) {
		GgUser ggUser = ggUserMapper.getUser(userCode);
		return ggUser;
	}
	@Override
	public List<Map<String, String>> listRoledUser(Pagination pagination) {
		List<Map<String, String>> list = ggUserMapper.listRoledUser(pagination);
		return list;
	}
	@Override
	public List<Map<String, String>> listUnRoledUser() {
		List<Map<String, String>> list = ggUserMapper.listUnRoledUser();
		return list;
	}
	@Override
	public void updateUser(GgUser ggUser) {
		ggUserMapper.updateUser(ggUser);
		
	}

	@Override
	@Transactional
	public void updateUser(String usercode) {
		GgUser user = ggUserMapper.getUserByRemark(usercode);
		user.setValidStatus(INVALID);
		ggUserMapper.updateUser(user);
		List<GgUser> ggUsers = ggUserMapper.selectUsersByRemark(usercode);
		for(GgUser ggUser : ggUsers){
			ggUser.setValidStatus(INVALID);
			ggUserMapper.updateUser(ggUser);
		}
	}

	@Override
	public List<Map<String, Object>> getUserAll(Pagination pagination) {
		return ggUserMapper.getAllUser(pagination);
	}

	@Override
	public Boolean deleteUser(String usercode) {
		return ggUserMapper.delGgUserByCode(usercode);
	}

	@Override
	public void saveUser(GgUser user) {
		ggUserMapper.insertGgUser(user);
	}

	@Override
	public Integer getUserByRemark(String userCode) {
		return ggUserMapper.getUsersByRemark(userCode);
	}

}
