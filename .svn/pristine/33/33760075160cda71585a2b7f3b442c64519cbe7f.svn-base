package com.dsib.dao;

import java.util.List;
import java.util.Map;

import com.dsib.common.Pagination;
import com.dsib.entity.GgUser;

public interface GgUserMapper {
	public GgUser getUser(String userCode);
	/**
	 * 查看个人中心
	 * @hslt
	 * @param map
	 * @return
	 */
	public List<Map<String, Object>> queryPersonsAll(Pagination map);
	/**
	 * qiye更新用户信息
	 * @param ggUser
	 */
	public void updateUser(GgUser ggUser);
	/**
	 * 发送消息查询方法
	 * @author hslt
	 * @param map
	 * @return
	 */
	public List<Map<String, Object>> getNoticeUser(Pagination map);
	/**
	 * @author hslt
	 * @param user
	 * @return
	 */
	public List<GgUser> selectNotice4User(GgUser user);
	/**
	 * @author hslt
	 * @param user
	 * @return
	 */
	public List<GgUser> selectUserName(GgUser user);
	/**
	 * 企业个人中心信息查看
	 * @author hslt
	 * @param map
	 * @return
	 */
	public List<Map<String, Object>> queryPersonsAllEnterprise(Pagination map);
	
	/**
	 * 插入gguser
	 * @param ggUser
	 */
	public void insertGgUser(GgUser ggUser);
	
	public GgUser queryGgUser(GgUser ggUser);
	
	public GgUser getUserByRemark(String userCode);
	
	public List<Map<String, Object>> selectUserManage(Pagination map);
	
	public boolean delGgUserByCode(String userCode);
	
	public boolean updateJingJiUser(GgUser ggUser);
	
	public boolean insertGgUserManager(GgUser ggUser);
	
	List<Map<String, String>> listRoledUser(Pagination pagination);
	
	List<Map<String, String>> listUnRoledUser();

	List<Map<String,Object>> getAllUser(Pagination pagination);

	Integer getUsersByRemark(String userCode);

	List<GgUser> selectUsersByRemark(String usercode);
}
