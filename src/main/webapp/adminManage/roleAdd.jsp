<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
		<div style="width:60%;height:auto;">
			
			<span style="display:inline-block;width:300px;">
				角色代码：<input type="text" id="roleCode"  placeholder="" style="height:30px;width:200px;" value="">
			</span>
			<span style="display:inline-block;width:300px;">
				角色名称：<input type="text" id="roleName" style="height:30px;width:200px;" value="">
			</span>
		</div>
		<%-- <hr/>
		
		<form action="" name="fm" method="post" enctype="multipart/form-data">
			<div style="width:80%;height:auto;margin-top:1em;">
				<p>审核流程：</p>
				<div style="width:100%;height:auto;">
					<table id="userTable" cellpadding="0" cellspacing="0" border="0" style="display:inline-block;width:49%;">
					<tr><th colspan="3" style="font-weight: bold;">改造户信息审核流程:</th></tr>
					<tr>
						<td>下级审核人</td>
						<td>
							<input name="userList[0].roleCode" id="userRoleCode0" value="" type="hidden">
							<input name="userList[0].auditType" value="1" type="hidden">
							<input name="userList[0].validStatus" value="1" type="hidden">
							<select name="userList[0].auditCode" id="userAuditCode0">
								<option value="">请选择审核人</option>
								<c:forEach items="${roleList }" var="role">
									<option value="${role.roleCode }">${role.roleName }</option>
								</c:forEach>
							</select>
						</td>
						<td id="usertd0"><button type="button" onclick="addUserAudit('userTable',0)">添加审核人</button>
						<button type="button" onclick="deleteUserAudit(1)">删除</button></td>
					</tr>
				</table>
				<table id="paymentTable" cellpadding="0" cellspacing="0" border="0" style="display:inline-block;width:49%;">
					<tr><td colspan="3" style="font-weight: bold;">兑付信息审核流程:</td></tr>
					<tr>
						<td>下级审核人</td>
						<td>
							<input name="paymentList[0].roleCode" id="paymentRoleCode0" value="" type="hidden">
							<input name="paymentList[0].auditType" value="2" type="hidden">
							<input name="paymentList[0].validStatus" value="1" type="hidden">
							<select name="paymentList[0].auditCode" id="paymentAuditCode0">
								<option value="">请选择审核人</option>
								<c:forEach items="${roleList }" var="role">
									<option value="${role.roleCode }">${role.roleName }</option>
								</c:forEach>
							</select>
						</td>
						<td id="paymenttd0"><button type="button" onclick="addPaymentAudit('paymentTable',0)">添加审核人</button>
							<button type="button" onclick="deletePaymentAudit(1)">删除</button>
						</td>
					</tr>
				</table>
				</div>
				
			</div>
		</form> --%>
	</div>
	
	<div class="zTreeDemoBackground" style="width:100%;margin-left:2em;">
	<hr/>
		菜单权限：
		<ul id="treeDemo" class="ztree" style="width:60%;"></ul>
	</div>
	<div class="zTreeDemoBackground" style="text-align:center;width:800px;padding:3em 0;">
		<a href="javascript:getCheckedId();" style="display:inline-block;padding:0px 18px;height:38px;background-color:#1E9FFF;border-radius:2px;line-height:38px;color:#fff;opacity:.9;text-decoration:none;">提交</a>
		<a href="javascript:history.go(-1);" style="display:inline-block;padding:0px 18px;height:38px;background-color:#FF901E;border-radius:2px;line-height:38px;color:#fff;opacity:.9;text-decoration:none;">取消</a>
	</div>
	<div id="menus" style="display:none;">${menus }</div>
	</fieldset>
</div>
</BODY>
<SCRIPT type="text/javascript">
		function addUserAudit(o,n){
			var table = document.getElementById(o);
			var num = $("#"+o+" tr").length-1;
			var html = $("#userAuditCode0").html();
			var val = $("#userAuditCode"+n).val();
			if(val ==""){
				alert("请选择审核人");
				return;
			}
			$("#usertd"+n+" button:last").remove();
			var tr = "<tr><td>下级审核人</td><td><input name='userList["+num+"].roleCode' id='userRoleCode"+num+"' value='"+val+"' type='hidden'>"+
						"<input name='userList["+num+"].auditType' value='1' type='hidden'>"+
						"<input name='userList["+num+"].validStatus' value='1' type='hidden'>"+
						"<select name='userList["+num+"].auditCode' id='userAuditCode"+num+"'>"+
							html+"</td><td id='usertd"+num+"'><button type=\"button\" onclick=\"addUserAudit('userTable',"+num+")\">添加审核人</button>"+
							"<button type=\"button\" onclick='deleteUserAudit("+(num+1)+")'>删除</button></td></tr>";
			$(table).append(tr);
		}
		function addPaymentAudit(o,n){
			var table = document.getElementById(o);
			var num = $("#"+o+" tr").length-1;
			var html = $("#paymentAuditCode0").html();
			var val = $("#paymentAuditCode"+n).val();
			if(val ==""){
				alert("请选择审核人");
				return;
			}
			$("#paymenttd"+n+" button:last").remove();
			var tr = "<tr><td>下级审核人</td><td><input name='paymentList["+num+"].roleCode' id='paymentRoleCode"+num+"' value='"+val+"' type='hidden'>"+
						"<input name='paymentList["+num+"].auditType' value='2' type='hidden'>"+
						"<input name='paymentList["+num+"].validStatus' value='1' type='hidden'>"+
						"<select name='paymentList["+num+"].auditCode' id='paymentAuditCode"+num+"'>"+
							html+"</td><td id='paymenttd"+num+"'><button type=\"button\" onclick=\"addPaymentAudit('paymentTable',"+num+")\">添加审核人</button>"+
							"<button type=\"button\" onclick='deletePaymentAudit("+(num+1)+")'>删除</button></td></tr>";
			$(table).append(tr);
		}
		function deletePaymentAudit(n){
			if(n>1){
				$("#paymentTable tr:last").remove();
			}	
				$("#paymenttd"+(n-2)).append("<button type=\"button\" onclick='deletePaymentAudit("+(n-1)+")'>删除</button>");
			
		}
		function deleteUserAudit(n){
			if(n>1){
				$("#userTable tr:last").remove();
			}	
				$("#usertd"+(n-2)).append("<button type=\"button\" onclick='deleteUserAudit("+(n-1)+")'>删除</button>");
		}
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
			var chbs = document.getElementsByName("checkbox");
			var remark = "";
			for(var i =0;i<chbs.length;i++){
				var check = chbs[i];
				if(check.checked)
				remark += check.value +",";
			}
			remark = remark.substring(0,remark.length);
			var menus = "";
			for(var i=0;i<nodes.length;i++){
				menus += nodes[i].id+",";
			}
			menus = menus.substring(0,menus.length);
			window.open("${basePath }/adminManage/roleAdd?roleCode="+roleCode+"&roleName="+roleName+"&menus="+menus+"&remark="+remark,"resultFrame");
			
		}
		
		var zNodes = new Array();
		var hiddenMenu = document.getElementById("menus");
		if(hiddenMenu != null){
			var menuVal = hiddenMenu.innerHTML;
			var navArray = eval("("+menuVal+")");
			for(var i=0;i<navArray.length;i++){
				var dataItem = navArray[i];
				var menuItem = {
					id : dataItem.menuCode,
					pId : dataItem.upperCode,
					name : dataItem.menuName
				};
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