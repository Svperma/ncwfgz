package com.dsib.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.dsib.common.Pagination;
import com.dsib.entity.GgAuditConfig;
import com.dsib.entity.GgAuditConfigList;
import com.dsib.entity.GgMenu;
import com.dsib.entity.GgUser;
import com.dsib.service.GgAuditConfigService;
import com.dsib.service.GgMenuService;
import com.dsib.service.GgRoleMenuService;
import com.dsib.service.GgRoleService;
import com.dsib.service.GgUserService;
import com.dsib.util.Md5Util;
import com.dsib.util.StringUtil;
import com.dsib.entity.GgRole;
import com.dsib.entity.GgRoleMenu;

@Controller
@RequestMapping("/adminManage")
@SessionAttributes({"pagination","menus","roleList","ggRole","roleMenu","conList","unRoledList"})
public class AdminManageController extends BaseController {

	@Resource(name="ggMenuService")
	private GgMenuService ggMenuService;
	@Resource(name="ggRoleService")
	private GgRoleService ggRoleService;
	@Resource(name="ggRoleMenuService")
	private GgRoleMenuService ggRoleMenuService;
	@Resource(name="ggAuditConfigService")
	private GgAuditConfigService ggAuditConfigService;
	@Resource(name="ggUserService")
	private GgUserService ggUserService;
	@RequestMapping("/menuManage")
	public ModelAndView menuManage(){
		ModelAndView mad = new ModelAndView();
		Pagination pagination = new Pagination();
		Map<String, String> map = new HashMap<String,String>();
		map.put("menuCode", "");
		pagination.setQueryCondition(map);
		List<GgMenu> list = ggMenuService.listMenusByPagination(pagination,"");
		pagination.setResultList(list);
		mad.addObject("pagination", pagination);
		mad.setViewName("/adminManage/menuManage");
		return mad;
	}
	
	@RequestMapping(value="/queryMenu")
	public ModelAndView queryMenu(@RequestParam String menuName){
		ModelAndView mad = new ModelAndView();
		Pagination pagination = new Pagination();
		Map<String, String> map = new HashMap<String,String>();
		map.put("menuName", menuName);
		pagination.setQueryCondition(map);
		List<GgMenu> list = ggMenuService.listMenusByPagination(pagination,"");
		pagination.setResultList(list);
		mad.addObject("pagination", pagination);
		mad.setViewName("/adminManage/menuManageResult");
		return mad;
	}
	
	@RequestMapping("/menuQueryContinue")
	public ModelAndView menuQueryContinue(){
		ModelAndView mad = new ModelAndView();
		String pageNo = request.getParameter("pageNo");
		Pagination pagination = (Pagination) session.getAttribute("pagination");
		pagination.setPageNo(Integer.valueOf(pageNo));
		List<GgMenu> list = ggMenuService.listMenusByPagination(pagination,"");
		pagination.setResultList(list);
		mad.addObject("pagination", pagination);
		mad.setViewName("/adminManage/menuManageResult");
		return mad;
	}
	
	//添加菜单
	@RequestMapping("/prepareMenuAdd")
	public ModelAndView prepareMenuAdd(){
		ModelAndView mad = new ModelAndView();
		Pagination pagination = new Pagination();
		Map<String, String> map = new HashMap<String,String>();
		map.put("menuCode", "");
		pagination.setQueryCondition(map);
		List<GgMenu> list = ggMenuService.listMenusByPagination(pagination,"");
		pagination.setResultList(list);
		mad.addObject("pagination", pagination);
		mad.setViewName("/adminManage/menuAdd");
		return mad;
	}
	
	@RequestMapping("/menuAdd")
	public ModelAndView menuAdd(GgMenu ggMenu){
		ModelAndView mad = new ModelAndView();
		GgUser ggUser = (GgUser) session.getAttribute("ggUser");
		ggMenu.setCreateCode(ggUser.getUserCode());
		ggMenu.setCreateTime(new Date());
		ggMenu.setValidStatus("1");
		ggMenuService.insertSelective(ggMenu);
		mad.setViewName("redirect:/adminManage/queryMenu?menuName=");
		return mad;
	}
	@RequestMapping("/checkMenuCode")
	public void checkMenuCode(){
		try {
			String menuCode = request.getParameter("menuCode");
			Pagination pagination = new Pagination();
			Map<String, String> map = new HashMap<String,String>();
			map.put("menuCode", menuCode);
			pagination.setQueryCondition(map);
			List<GgMenu> list = ggMenuService.listMenusByPagination(pagination, null);
			String flag = "F";
			if(list != null && list.size() >0){
				flag = "Y";
			}
			PrintWriter out = response.getWriter();
			out.write(flag);
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	//更新菜单
	@RequestMapping("/menuUpdate")
	public ModelAndView menuUpdate(){
		ModelAndView mad = new ModelAndView();
		String menuCode = request.getParameter("menuCode");
		Pagination pagination = new Pagination();
		Map<String, String> map = new HashMap<String,String>();
		map.put("menuCode", menuCode);
		pagination.setQueryCondition(map);
		List<GgMenu> list = ggMenuService.listMenusByPagination(pagination, null);
		GgMenu ggMenu = null;
		if(list != null && list.size()>0){
			ggMenu = list.get(0);
		}else{
			ggMenu = new GgMenu();
		}
		mad.addObject("ggMenu", ggMenu);
		mad.setViewName("/adminManage/menuUpdate");
		return mad;
	}
	@RequestMapping("/updateMenu")
	public ModelAndView updateMenu(GgMenu ggMenu){
		ModelAndView mad = new ModelAndView();
		GgUser ggUser = (GgUser) session.getAttribute("ggUser");
		ggMenu.setCreateCode(ggUser.getUserCode());
		ggMenu.setCreateTime(new Date());
		ggMenu.setValidStatus("1");
		ggMenuService.updateByPrimaryKeySelective(ggMenu);
		mad.setViewName("redirect:/adminManage/queryMenu?menuName=");
		return mad;
	}
	
	//删除菜单
	@RequestMapping("/menuDelete")
	public ModelAndView menuDelete(){
		ModelAndView mad = new ModelAndView();
		String menuCode = request.getParameter("menuCode");
		ggMenuService.deleteByPrimaryKey(menuCode);
		mad.setViewName("redirect:/adminManage/queryMenu?menuName=");
		return mad;
	}
	
	//角色
	@RequestMapping("/menuDistribute")
	public ModelAndView menuDistribute(){
		ModelAndView mad = new ModelAndView();
		Pagination pagination = new Pagination();
		Map<String, String> map = new HashMap<String,String>();
		map.put("roleCode", "");
		pagination.setQueryCondition(map);
		List<GgRole> roleList = ggRoleService.listRoles(pagination);
		pagination.setResultList(roleList);
		mad.addObject("pagination", pagination);
		mad.setViewName("/adminManage/menuDistribute");
		return mad;
	}
	//查询角色
	@RequestMapping("/queryRole")
	public ModelAndView queryRole(@RequestParam String roleName){
		ModelAndView mad = new ModelAndView();
		Pagination pagination = new Pagination();
		Map<String, String> map = new HashMap<String,String>();
		map.put("roleName", roleName);
		pagination.setQueryCondition(map);
		List<GgRole> roleList = ggRoleService.listRoles(pagination);
		pagination.setResultList(roleList);
		mad.addObject("pagination", pagination);
		mad.setViewName("/adminManage/menuDistributeResult");
		return mad;
	}
	//翻页
	@RequestMapping("/roleQueryContinue")
	public ModelAndView roleQueryContinue(){
		ModelAndView mad = new ModelAndView();
		String pageNo = request.getParameter("pageNo");
		Pagination pagination = (Pagination) session.getAttribute("pagination");
		pagination.setPageNo(Integer.valueOf(pageNo));
		List<GgRole> roleList = ggRoleService.listRoles(pagination);
		pagination.setResultList(roleList);
		mad.addObject("pagination", pagination);
		mad.setViewName("/adminManage/menuDistributeResult");
		return mad;
	}
	
	
	//添加角色
	@RequestMapping("/prepareRoleAdd")
	public ModelAndView prepareRoleAdd(){
		ModelAndView mad = new ModelAndView();
		List<GgMenu> list = ggMenuService.listMenusByPrimaryKey("");
		JSONArray ja = JSONArray.fromObject(list);
		List<GgRole> roleList = ggRoleService.listRolesAll();
		mad.addObject("roleList", roleList);
		mad.addObject("menus", ja.toString());
		mad.setViewName("/adminManage/roleAdd");
		return mad;
	}
	
	@RequestMapping("/roleAdd")
	public ModelAndView roleAdd(){
		ModelAndView mad = new ModelAndView();
		String roleCode = request.getParameter("roleCode");
		String roleName = request.getParameter("roleName");
		String menus = request.getParameter("menus");
		//String remark = request.getParameter("remark");
		GgUser ggUser = (GgUser) session.getAttribute("ggUser");
		ggRoleService.deleteByPrimaryKey(roleCode);
		GgRole ggRole = new GgRole();
		ggRole.setRoleCode(roleCode);
		ggRole.setRoleName(roleName);
		ggRole.setUpdateCode(ggUser.getUserCode());
		ggRole.setUpdateTime(new Date());
		ggRole.setValidStatus("1");
		ggRoleService.insert(ggRole);
		List<GgRoleMenu> rmList = new ArrayList<GgRoleMenu>();
		ggRoleMenuService.deleteByRoleCode(roleCode);
		String[] ms = menus.split(",");
		GgRoleMenu ggRoleMenu = null;
		for(int i = 0;i<ms.length;i++){
			ggRoleMenu = new GgRoleMenu();
			ggRoleMenu.setRoleCode(roleCode);
			ggRoleMenu.setMenuCode(ms[i]);
			ggRoleMenu.setValidStatus("1");
			ggRoleMenu.setCreateCode(ggUser.getUserCode());
			ggRoleMenu.setCreateTime(new Date());
			ggRoleMenu.setDisplayNo(i);
			rmList.add(ggRoleMenu);
		}
		ggRoleMenuService.insertAll(rmList);
		mad.setViewName("redirect:/adminManage/queryRole?roleName=");
		return mad;
	}
	
	@RequestMapping("/roleUpdate")
	public ModelAndView roleUpdate(@RequestParam String roleCode){
		ModelAndView mad = new ModelAndView();
		GgRole ggRole = ggRoleService.selectByPrimaryKey(roleCode);
		List<GgRoleMenu> roleMenuList = ggRoleMenuService.listRoleMenusByRoleCode(roleCode);
		List<GgMenu> menuList = ggMenuService.listMenusByPrimaryKey("");
		JSONArray ja = JSONArray.fromObject(menuList);
		JSONArray roleMenu = JSONArray.fromObject(roleMenuList);
		mad.addObject("menus", ja.toString());
		mad.addObject("roleMenu", roleMenu.toString());
		mad.addObject("ggRole", ggRole);
		mad.setViewName("/adminManage/roleUpdate");
		return mad;
	}
	
	@RequestMapping("/roleDelete")
	public ModelAndView roleDelete(@RequestParam String roleCode){
		ModelAndView mad = new ModelAndView();
		ggRoleService.deleteByPrimaryKey(roleCode);
		ggRoleMenuService.deleteByRoleCode(roleCode);
		mad.setViewName("redirect:/adminManage/queryRole?roleName=");
		return mad;
	}
	//改造户信息审核流程
	@RequestMapping("/userAudit")
	public ModelAndView userAudit(){
		ModelAndView mad = new ModelAndView();
		List<GgRole> roleList = ggRoleService.listRolesAll();
		List<GgAuditConfig> conList = ggAuditConfigService.listByAuditType("1");
		String dealer = (conList == null || conList.size() < 1) ? "":conList.get(0).getRoleCode();
		session.setAttribute("dealer", dealer);
		mad.addObject("roleList", roleList);
		mad.addObject("conList", conList);
		mad.setViewName("/adminManage/userAudit");
		return mad;
	}
	
	@RequestMapping("/userAuditAdd")
	public ModelAndView userAuditAdd(GgAuditConfigList auditConfigList){
		ModelAndView mad = new ModelAndView();
		ggAuditConfigService.deleteByAuditType("1");
		ggAuditConfigService.insertAll(auditConfigList.getUserList());
		mad.setViewName("redirect:/adminManage/userAudit");
		return mad;
	}
	
	//兑付信息审核流程
	@RequestMapping("/paymentAudit")
	public ModelAndView paymentAudit(){
		ModelAndView mad = new ModelAndView();
		List<GgRole> roleList = ggRoleService.listRolesAll();
		List<GgAuditConfig> conList = ggAuditConfigService.listByAuditType("2");
		String dealer = (conList == null || conList.size() < 1) ? "":conList.get(0).getRoleCode();
		session.setAttribute("dealer", dealer);
		mad.addObject("roleList", roleList);
		mad.addObject("conList", conList);
		mad.setViewName("/adminManage/paymentAudit");
		return mad;
	}
	@RequestMapping("/paymentAuditAdd")
	public ModelAndView paymentAuditAdd(GgAuditConfigList auditConfigList){
		ModelAndView mad = new ModelAndView();
		ggAuditConfigService.deleteByAuditType("2");
		ggAuditConfigService.insertAll(auditConfigList.getPaymentList());
		mad.setViewName("redirect:/adminManage/paymentAudit");
		return mad;
	}
	
	//角色分配
	
	@RequestMapping("/distributeRole")
	public ModelAndView distributeRole(){
		ModelAndView mad = new ModelAndView();
		Pagination pagination = new Pagination();
		Map<String, String> map = new HashMap<String,String>();
		map.put("roleCode", "");
		map.put("userName", "");
		pagination.setQueryCondition(map);
		List<Map<String, String>> roledList = ggUserService.listRoledUser(pagination);
		pagination.setResultList(roledList);
		List<Map<String, String>> unRoledList = ggUserService.listUnRoledUser();
		List<GgRole> roleList = ggRoleService.listRolesAll();
		mad.addObject("roleList", roleList);
		mad.addObject("unRoledList", unRoledList);
		mad.addObject("pagination", pagination);
		mad.setViewName("/adminManage/distributeRole");
		return mad;
	}
	@RequestMapping("/queryDisRole")
	public ModelAndView queryDisRole(){
		ModelAndView mad = new ModelAndView();
		String roleCode = request.getParameter("roleCode").trim();
		String userName = request.getParameter("userName").trim();
		Pagination pagination = new Pagination();
		Map<String, String> map = new HashMap<String,String>();
		map.put("roleCode", roleCode);
		map.put("userName", userName);
		pagination.setQueryCondition(map);
		List<Map<String, String>> roledList = ggUserService.listRoledUser(pagination);
		pagination.setResultList(roledList);
		mad.addObject("pagination", pagination);
		mad.setViewName("/adminManage/distributeRoleResult");
		return mad;
	}
	
	@RequestMapping("/distributeRoleContinue")
	public ModelAndView distributeRoleContinue(){
		ModelAndView mad = new ModelAndView();
		String pageNo = request.getParameter("pageNo");
		Pagination pagination = (Pagination) session.getAttribute("pagination");
		pagination.setPageNo(Integer.valueOf(pageNo));
		List<Map<String, String>> roledList = ggUserService.listRoledUser(pagination);
		pagination.setResultList(roledList);
		mad.addObject("pagination", pagination);
		mad.setViewName("/adminManage/distributeRoleResult");
		return mad;
	}
	
	@RequestMapping("/distributeRoleAdd")
	public ModelAndView distributeRoleAdd(){
		ModelAndView mad = new ModelAndView();
		GgUser ggUser = (GgUser) session.getAttribute("ggUser");
		String roleCode = request.getParameter("roleCode");
		String userCode = request.getParameter("userCode");
		GgUser updateUser = new GgUser();
		updateUser.setUserCode(userCode);
		updateUser.setRole(roleCode);
		updateUser.setUpdator(ggUser.getUserCode());
		updateUser.setUpdateDate(new Date());
		updateUser.setValidStatus("1");
		ggUserService.updateUser(updateUser);
		mad.setViewName("redirect:/adminManage/distributeRole");
		return mad;
	}
	
	@RequestMapping("/distributeRoleDelete")
	public ModelAndView distributeRoleDelete(){
		ModelAndView mad = new ModelAndView();
		GgUser ggUser = (GgUser) session.getAttribute("ggUser");
		String userCode = request.getParameter("userCode");
		GgUser updateUser = new GgUser();
		updateUser.setUserCode(userCode);
		updateUser.setRole(" ");
		updateUser.setUpdator(ggUser.getUserCode());
		updateUser.setUpdateDate(new Date());
		updateUser.setValidStatus("1");
		ggUserService.updateUser(updateUser);
		mad.setViewName("redirect:/adminManage/distributeRole");
		return mad;
	}
	
	//修改密码
	@RequestMapping("/updatePwd")
	public void updatePwd(){
		String newPwd = request.getParameter("newPwd");
		String oldPwd = request.getParameter("oldPwd");
		GgUser ggUser = (GgUser) session.getAttribute("ggUser");
		String oldPwdMD5 = Md5Util.md5(oldPwd);
		String result = "success";
		if(oldPwdMD5.equals(ggUser.getPassword())){
			ggUser.setPassword(Md5Util.md5(newPwd));
			ggUser.setUpdator(ggUser.getUserCode());
			ggUser.setUpdateDate(new Date());
			ggUserService.updateUser(ggUser);
		}else{
			result = "pwdError";
		}
		try {
			PrintWriter out = response.getWriter();
			out.write(com.alibaba.fastjson.JSONObject.toJSONString(result));
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}
