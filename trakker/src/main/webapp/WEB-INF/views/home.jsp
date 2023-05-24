<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 세션 사용 옵션 -->
<%@ page session="true" %>

<html>
<head>
<meta charset="UTF-8">
	<title>Home</title>
<%@ include file="itemfile.jsp" %>
</head>
<body>
<%@ include file="header.jsp" %>
<c:if test="${sessionScope.userid != null}">
 <h2>
  ${sessionScope.name}(${sessionScope.userid})님의 방문을 환영합니다.
 </h2>
</c:if>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>



<%@ include file="footer.jsp" %>
</body>
</html>