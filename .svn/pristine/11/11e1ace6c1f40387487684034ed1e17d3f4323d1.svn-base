<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
  <head>
    <title></title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<script type="text/javascript" src="${basePath }/js/jquery.js"></script>
	<script type="text/javascript" src="${basePath }/js/pagination.js"></script>
  </head>
  <body>
  	<div class="panel">
		<div class="pagination-centered">
			<input type="hidden" id="pageNo" name="pageNo" value="${pagination.pageNo }">
		  	<input type="hidden" id="pageSize" name="pageSize" value="${pagination.pageSize }">
		  	<input type="hidden" id="pageCount" name="pageCount" value="${pagination.pageCount }">
		  <ul class="pagination">
			<li class="arrow"><a href="javascript:goBack();">&laquo;</a></li>
			<c:if test="${pagination.pageCount <= 5 }">
            	<c:forEach begin="1" end="${pagination.pageCount }" varStatus="vs">
            		<c:if test="${pagination.pageNo == vs.index }">
            			<li class="label success round" style="color: red;"><a href="javascript:go(${vs.index })">${vs.index }</a></li>
            		</c:if>
            		<c:if test="${pagination.pageNo != vs.index }">
            			<li><a href="javascript:go(${vs.index })">${vs.index }</a></li>
            		</c:if>
            	</c:forEach>
            </c:if>
            <c:if test="${pagination.pageCount >5 }">
              	<c:if test="${pagination.pageNo<4 }">
              		<c:forEach var="item" begin="1" end="5">
              			<c:if test="${pagination.pageNo == item }">
              				<li class="label success round"><a href="javascript:go(${item })">${item }</a></li>
              			</c:if>
              			<c:if test="${pagination.pageNo != item }">
              				<li><a href="javascript:go(${item })">${item }</a></li>
              			</c:if>
              		</c:forEach>
              		<li class="unavailable">&hellip;</li>
              	</c:if>
              	<c:if test="${pagination.pageNo-2>1 && pagination.pageNo+2<pagination.pageCount}">
              		<li class="unavailable">&hellip;</li>
              		<li><a href="javascript:go(${pagination.pageNo-2 })">${pagination.pageNo-2 }</a></li>
              		<li><a href="javascript:go(${pagination.pageNo-1 })">${pagination.pageNo-1 }</a></li>
              		<li class="label success round"><a href="javascript:go(${pagination.pageNo })">${pagination.pageNo }</a></li>
              		<li><a href="javascript:go(${pagination.pageNo+1 })">${pagination.pageNo+1 }</a></li>
              		<li><a href="javascript:go(${pagination.pageNo+2 })">${pagination.pageNo+2 }</a></li>
              		<li class="unavailable">&hellip;</li>
              	</c:if>
              	<c:if test="${pagination.pageNo+2>=pagination.pageCount }">
              		<li class="unavailable">&hellip;</li>
              		<c:forEach var="item" begin="0" end="4">
              			<c:if test="${pagination.pageNo == (pagination.pageCount + (item -4)) }">
              				<li class="label success round"><a href="javascript:go(${pagination.pageCount + (item -4)})">${pagination.pageCount + (item -4) }</a></li>
              			</c:if>
              			<c:if test="${pagination.pageNo != (pagination.pageCount + (item -4)) }">
              				<li><a href="javascript:go(${pagination.pageCount + (item -4)  })">${pagination.pageCount + (item -4)  }</a></li>
              			</c:if>
              		</c:forEach>
              	</c:if>
              </c:if>
			<li class="arrow"><a href="javascript:goForword();">&raquo;</a></li>
			<li>第${pagination.pageNo }/${pagination.pageCount }页;共${pagination.totalCount }条   每页${pagination.pageSize }条</li>
		  </ul>
		</div>
	</div>
  </body>
</html>
