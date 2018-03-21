<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<HTML>
<HEAD>
	<TITLE> ZTREE DEMO - checkbox</TITLE>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="${basePath }/css/demo.css" type="text/css">
	<link rel="stylesheet" href="${basePath }/css/zTreeStyle/zTreeStyle.css" type="text/css">
	<script type="text/javascript" src="${basePath }/js/jquery-1.4.4.min.js"></script>
	<script type="text/javascript" src="${basePath }/js/jquery.ztree.core.js"></script>
	<script type="text/javascript" src="${basePath }/js/jquery.ztree.excheck.js"></script>
	<!--
	<script type="text/javascript" src="../../../js/jquery.ztree.exedit.js"></script>
	-->
	
</HEAD>

<BODY>
<div class="content_wrap" style="width:90%;padding-top:50px;margin: 0 auto;">
<fieldset style="border-top:1px solid #ccc;">
 <legend style="margin-left:1em;font-size: 20px;font-family: '微软雅黑';font-weight: 300;">&nbsp;&nbsp; 添加角色 &nbsp;&nbsp;  </legend>
	<div class="zTreeDemoBackground" style="width:100%;height:auto;padding:20px 0;margin-left:2em;">
		<form action="${basePath }/adminManage/roleAdd" name="fm" method="post" enctype="multipart/form-data" target="resultFrame">
			<div style="width:60%;height:auto;">
				
				<span style="display:inline-block;width:300px;">
					角色代码：<input type="text" id="roleCode" name="roleCode" placeholder="" style="height:30px;width:200px;" value="${sessionScope.ggRole.roleCode }">
				</span>
				<span style="display:inline-block;width:300px;">
					角色名称：<input type="text" id="roleName" name="roleName" style="height:30px;width:200px;" value="${sessionScope.ggRole.roleName }">
				</span>
			</div>
			<input type="hidden" id="hiddenMenuId" name="menus" value="">
		</form>
	</div>
	<div class="zTreeDemoBackground" style="width:100%;margin-left:2em;">
		菜单权限：
		<ul id="treeDemo" class="ztree" style="width:60%;"></ul>
	</div>
	<div class="zTreeDemoBackground" style="text-align:center;width:800px;padding:3em 0;">
		<a href="javascript:getCheckedId();" style="display:inline-block;padding:0px 18px;height:38px;background-color:#1E9FFF;border-radius:2px;line-height:38px;color:#fff;opacity:.9;text-decoration:none;">提交</a>
		<a href="javascript:history.go(-1);" style="display:inline-block;padding:0px 18px;height:38px;background-color:#FF901E;border-radius:2px;line-height:38px;color:#fff;opacity:.9;text-decoration:none;">取消</a>
	</div>
	
	<div id="menus" style="display:none;">${sessionScope.menus }</div>
	<div id="roleMenu" style="display:none;">${sessionScope.roleMenu }</div>
	</fieldset>
</div>
</BODY>
<SCRIPT type="text/javascript">
		//<!--
		var setting = {
			check: {
				enable: true
			},
			data: {
				simpleData: {
					enable: true
				}
			},
			
		};
		 String.prototype.startWith=function(str){  
			  if(str==null||str==""||this.length==0||str.length>this.length)  
			   return false;  
			  if(this.substr(0,str.length)==str)  
			     return true;  
			  else  
			     return false;  
			  return true;  
			};  
		function getCheckedId(){
			var roleCode = document.getElementById("roleCode").value;
			var roleName = document.getElementById("roleName").value;
			if(roleCode == ""){
				alert("角色代码不能为空");
				return;
			}
			if(roleName == ""){
				alert("角色名称不能为空");
				return;
			}
			var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
			var nodes = treeObj.getCheckedNodes(true);
			if(nodes == null || nodes.length == 0){
				alert("请选择菜单");
				return;
			}
			var menus = "";
			for(var i=0;i<nodes.length;i++){
				menus += nodes[i].id+",";
			}
			menus = menus.substring(0,menus.length);
			document.getElementById("hiddenMenuId").value = menus;
			//window.open("${basePath }/adminManage/roleAdd?roleCode="+roleCode+"&roleName="+roleName+"&menus="+menus+"&remark="+remark,"resultFrame");
			fm.submit();
		}
		
		var zNodes = new Array();
		var hiddenMenu = document.getElementById("menus");
		if(hiddenMenu != null){
			var menuVal = hiddenMenu.innerHTML;
			var navArray = eval("("+menuVal+")");
			var roleMenu = eval("("+document.getElementById("roleMenu").innerHTML+")");
			for(var i=0;i<navArray.length;i++){
				var dataItem = navArray[i];
				var menuItem = "";
				for(var n=0;n<roleMenu.length;n++){
					var role = roleMenu[n];
					if(dataItem.menuCode == role.menuCode){
						menuItem = {
							id : dataItem.menuCode,
							pId : dataItem.upperCode,
							name : dataItem.menuName,
							checked:true 
						};
						break;
					}
				}
				if(menuItem == ""){
					menuItem = {
						id : dataItem.menuCode,
						pId : dataItem.upperCode,
						name : dataItem.menuName
					};
				}
				zNodes[i] = menuItem;
			}
		}
		/* var zNodes =[
			{ id:1, pId:0, name:"随意勾选 1", open:true},
			{ id:11, pId:1, name:"随意勾选 1-1", open:true},
			{ id:111, pId:11, name:"随意勾选 1-1-1"},
			{ id:112, pId:11, name:"随意勾选 1-1-2"},
			{ id:12, pId:1, name:"随意勾选 1-2", open:true},
			{ id:121, pId:12, name:"随意勾选 1-2-1"},
			{ id:122, pId:12, name:"随意勾选 1-2-2"},
			{ id:2, pId:0, name:"随意勾选 2", checked:true, open:true},
			{ id:21, pId:2, name:"随意勾选 2-1"},
			{ id:22, pId:2, name:"随意勾选 2-2", open:true},
			{ id:221, pId:22, name:"随意勾选 2-2-1", checked:true},
			{ id:222, pId:22, name:"随意勾选 2-2-2"},
			{ id:23, pId:2, name:"随意勾选 2-3"}
		]; */
		
		var code;
		function showCode(str) {
			if (!code) code = $("#code");
			code.empty();
			code.append("<li>"+str+"</li>");
		}
		
		$(document).ready(function(){
			$.fn.zTree.init($("#treeDemo"), setting, zNodes);
		});
		//-->
	</SCRIPT>
</HTML>