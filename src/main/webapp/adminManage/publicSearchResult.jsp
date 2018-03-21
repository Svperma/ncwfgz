<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
	.cla-tab td,.cla-tab th{
		border:1px solid #bbb;
		padding:8px;
	}
</style>
<body>
<table style="width:100%;text-align: center;"  cellspacing="0" cellpadding="0" class="cla-tab">
	<tr>
		<td colspan="9" style="font-size:20px;font-weight: bold;text-align: left;color:#666;border:none;">保险信息</td>
	</tr>
	<tr style="background-color: #00a6e3;height: 25px;color:#fff;">
		<th>序号</th>
		<th>被保险人</th>
		<th>证件号码</th>
		<th>投保险种</th>
		<th>保单号</th>
		<th>起保日期</th>
		<th>终保日期</th>
		<th>保险金额</th>
		<th>有效状态</th>
	</tr>
	<c:forEach items="${sessionScope.listResult }" var="list"  varStatus="vs">
		<tr>
			<td>${vs.index+1 }</td>
		<c:forEach items="${list }" var="res" >
			<td>${res }</td>
		</c:forEach>
		</tr>
	</c:forEach>
</table>

<table style="width:100%;text-align: center;"  cellspacing="0" cellpadding="0" class="cla-tab">
	<tr>
		<td colspan="9" style="font-size:20px;font-weight: bold;text-align: left;color:#666;border:none;">理赔信息</td>
	</tr>
	<tr style="background-color: #00a6e3;height: 25px;color:#fff;">
		<th>序号</th>
		<th>出险人</th>
		<th>证件号码</th>
		<th>出险险种</th>
		<th>出险日期</th>
		<th>损失金额</th>
		<th>已决赔款</th>
		<th>未决赔款</th>
		<th>是否结案</th>
	</tr>
	<c:forEach items="${sessionScope.claimList }" var="list"  varStatus="vs">
		<tr>
			<td>${vs.index+1 }</td>
		<c:forEach items="${list }" var="res" >
			<td>${res }</td>
		</c:forEach>
		</tr>
	</c:forEach>
</table>
</body>
</html>