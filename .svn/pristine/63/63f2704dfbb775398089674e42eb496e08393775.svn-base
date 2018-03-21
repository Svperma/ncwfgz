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
			#paymentTable td a:hover{
				background-color:#0057a6;
			}
			#paymentTable a{
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
			#paymentTable td .a1{
				background-color:#F14C0D;
				font-family:'微软雅黑';
				}
			#paymentTable td .a1:hover{
				background-color:#CE400A;
			}
			#paymentTable td select{
				padding:5px;
				height:35px;
				outline:none;
				border:1px solid #ccc;
				font-family:'微软雅黑'；
			}
		</style>
</head>
<body>
<form action="${basePath }/adminManage/paymentAuditAdd" name="fm" method="post" enctype="multipart/form-data">
			<div style="width:100%;height:auto;margin-top:1em;">
				<p>审核流程：</p>
				<div style="width:80%;height:auto;margin:0 auto;">
					
				<table id="paymentTable" cellpadding="0" cellspacing="0" border="0" style="width:100%;">
					<tr><td colspan="3" style="font-weight: bold;">兑付信息审核流程:</td></tr>
					<tr>
						<td>提交人</td>
						<td>
							<select id="paymentAuditCode">
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
						<td><a type="button" onclick="addPaymentAudit('paymentTable','')">添加审核人</a>
						</td>
					</tr>
					<c:forEach items="${sessionScope.conList }" var="con" varStatus="vs">
						<tr>
							<td>下级审核人</td>
							<td>
								<input name="paymentList[${vs.index }].roleCode" id="userRoleCode${vs.index }" value="${con.roleCode }" type="hidden">
								<input name="paymentList[${vs.index }].auditType" value="${con.auditType }" type="hidden">
								<input name="paymentList[${vs.index }].validStatus" value="${con.validStatus }" type="hidden">
								<input name="paymentList[${vs.index }].flag" value="${con.flag }" type="hidden">
								<select name="paymentList[${vs.index }].auditCode" id="paymentAuditCode${vs.index }">
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
							<td id="paymenttd${vs.index }">
								<a type="button" onclick="addPaymentAudit('paymentTable',${vs.index })">添加审核人</a>
								<c:if test="${fn:length(sessionScope.conList) == vs.index+1 }">
									<a type="button" onclick="deletePaymentAudit(${vs.index + 2 })" class="a1">删除</a>
								</c:if>
							</td>
						</tr>
					</c:forEach>
				</table>
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
	function addPaymentAudit(o,n){
			var table = document.getElementById(o);
			var num = $("#"+o+" tr").length-2;
			var html = $("#paymentAuditCode").html();
			var val = $("#paymentAuditCode"+n).val();
			if(val ==""){
				alert("请选择角色");
				return;
			}
			$("#paymenttd"+n+" a:last").remove();
			var tr = "<tr><td>下级审核人</td><td><input name='paymentList["+num+"].roleCode' id='paymentRoleCode"+num+"' value='"+val+"' type='hidden'>"+
						"<input name='paymentList["+num+"].auditType' value='2' type='hidden'>"+
						"<input name='paymentList["+num+"].validStatus' value='1' type='hidden'>"+
						"<input name='paymentList["+num+"].flag' value='"+num+"' type='hidden'>"+
						"<select name='paymentList["+num+"].auditCode' id='paymentAuditCode"+num+"'>"+
							html+"</select></td><td id='paymenttd"+num+"'><a type=\"button\" onclick=\"addPaymentAudit('paymentTable',"+num+")\">添加审核人</a>"+
							"<a type=\"button\" onclick='deletePaymentAudit("+(num+2)+")' class='a1'>删除</a></td></tr>";
			$(table).append(tr);
		}
		function deletePaymentAudit(n){
			$("#paymentTable tr:last").remove();
			$("#paymenttd"+(n-3)).append("<a type=\"button\" onclick='deletePaymentAudit("+(n-1)+")' class='a1'>删除</a>");
		}
</script>
</html>