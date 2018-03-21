<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${basePath }/css/demo.css" type="text/css">
<link rel="stylesheet" href="${basePath }/css/zTreeStyle/zTreeStyle.css" type="text/css">
<script type="text/javascript" src="${basePath }/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="${basePath }/js/jquery.ztree.core.js"></script>
<script type="text/javascript" src="${basePath }/js/jquery.ztree.excheck.js"></script>
<title>Insert title here</title>
<style>
			table td,th{
				border:1px solid #ccc;
				padding:1.25em;
			}
			table{
				margin:1.25em 0;
			}
			#div-a a{
				padding:8px 16px;
				background-color:#00a6e3;
				color:#fff;
				text-decoration:none;
				-moz-border-radius: 3px;      /* Gecko browsers */
			    -webkit-border-radius: 3px;   /* Webkit browsers */
			    border-radius:3px;            /* W3C syntax */
			    cursor:pointer;
			    font-family:'微软雅黑';
			}
			#div-a a:hover{
				background-color:#0057a6;
			}
			#userTable td a:hover{
				background-color:#0057a6;
			}
			#userTable a{
				padding:8px 16px;
				background-color:#00a6e3;
				color:#fff;
				text-decoration:none;
				-moz-border-radius: 3px;      /* Gecko browsers */
			    -webkit-border-radius: 3px;   /* Webkit browsers */
			    border-radius:3px;            /* W3C syntax */
			    cursor:pointer;
			    font-family:'微软雅黑';
			}
			#userTable td .a1{
				background-color:#F14C0D;
				font-family:'微软雅黑';
				}
			#userTable td .a1:hover{
				background-color:#CE400A;
			}
			#userTable td select{
				padding:5px;
				height:35px;
				outline:none;
				border:1px solid #ccc;
				font-family:'微软雅黑'；
			}
		</style>
</head>
<body>
	<form action="${basePath }/adminManage/userAuditAdd" name="fm" method="post" enctype="multipart/form-data">
			<div style="width:100%;height:auto;margin-top:1em;">
				<p>审核流程：</p>
				<div style="width:80%;height:auto;margin:0 auto;">
					<table id="userTable" cellpadding="0" cellspacing="0" border="0" style="width:100%;">
					<tr><th colspan="3" style="font-weight: bold;">改造户信息审核流程:</th></tr>
					<tr>
						<td>提交人</td>
						<td>
							
							<select id="userAuditCode">
								<option value="">请选择提交人</option>
								<c:forEach items="${roleList }" var="role">
									<c:if test="${role.roleCode == sessionScope.dealer }">
										<option value="${role.roleCode }" selected="selected">${role.roleName }</option>
									</c:if>
									<c:if test="${role.roleCode != sessionScope.dealer }">
										<option value="${role.roleCode }" >${role.roleName }</option>
									</c:if>
								</c:forEach>
							</select>
						</td>
						<td ><a type="button" onclick="addUserAudit('userTable','')">添加审核人</a>
						</td>
					</tr>
					<c:forEach items="${sessionScope.conList }" var="con" varStatus="vs">
						<tr>
							<td>下级审核人</td>
							<td>
								<input name="userList[${vs.index }].roleCode" id="userRoleCode${vs.index }" value="${con.roleCode }" type="hidden">
								<input name="userList[${vs.index }].auditType" value="${con.auditType }" type="hidden">
								<input name="userList[${vs.index }].validStatus" value="${con.validStatus }" type="hidden">
								<input name="userList[${vs.index }].flag" value="${con.flag }" type="hidden">
								<select name="userList[${vs.index }].auditCode" id="userAuditCode${vs.index }">
									<option value="">请选择审核人</option>
									<c:forEach items="${roleList }" var="role">
										<c:if test="${con.auditCode == role.roleCode }">
											<option value="${role.roleCode }" selected="selected">${role.roleName }</option>
										</c:if>
										<c:if test="${con.auditCode != role.roleCode }">
											<option value="${role.roleCode }">${role.roleName }</option>
										</c:if>
									</c:forEach>
								</select>
							</td>
							<td id="usertd${vs.index }"><a type="button" onclick="addUserAudit('userTable',${vs.index })">添加审核人</a>
								<c:if test="${fn:length(sessionScope.conList) == vs.index+1 }">
									<a type="button" onclick="deleteUserAudit(${vs.index + 2})" class="a1">删除</a>
								</c:if>
							</td>
						</tr>
					</c:forEach>
				</table>
				<%-- <table id="paymentTable" cellpadding="0" cellspacing="0" border="0" style="display:inline-block;width:49%;">
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
				</table> --%>
				</div>
				
			</div>
			<div style="width:100%;text-align:center;" id="div-a">
				<a type="button" onclick="submitFm()">提交</a>
			</div>
		</form>
</body>
<script type="text/javascript">
	function submitFm(){
		fm.submit();
	}
	function addUserAudit(o,n){
			var table = document.getElementById(o);
			var num = $("#"+o+" tr").length-2;
			var html = $("#userAuditCode").html();
			var val = $("#userAuditCode"+n).val();
			if(val ==""){
				alert("请选择角色");
				return;
			}
			$("#usertd"+n+" a:last").remove();
			var tr = "<tr><td>下级审核人</td><td><input name='userList["+num+"].roleCode' id='userRoleCode"+num+"' value='"+val+"' type='hidden'>"+
						"<input name='userList["+num+"].auditType' value='1' type='hidden'>"+
						"<input name='userList["+num+"].validStatus' value='1' type='hidden'>"+
						"<input name='userList["+num+"].flag' value='"+num+"' type='hidden'>"+
						"<select name='userList["+num+"].auditCode' id='userAuditCode"+num+"'>"+
							html+"</select></td><td id='usertd"+num+"'><a type=\"button\" onclick=\"addUserAudit('userTable',"+num+")\">添加审核人</a>"+
							"<a type=\"button\" onclick='deleteUserAudit("+(num+2)+")' class='a1'>删除</a></td></tr>";
			$(table).append(tr);
		}
		function deleteUserAudit(n){
				$("#userTable tr:last").remove();
				$("#usertd"+(n-3)).append("<a type=\"button\" onclick='deleteUserAudit("+(n-1)+")' class='a1'>删除</a>");
		}
</script>
</html>