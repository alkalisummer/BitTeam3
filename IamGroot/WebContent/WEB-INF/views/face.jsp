<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="empface" value="<%= request.getAttribute(\"empface\")%>"/>
<c:set var="emp" value="<%= request.getAttribute(\"emp\") %>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <h3>${emp.ename }</h3>
    <h4>${empface.empno }</h4>
    <img alt="" src="${empface.url }">
</body>
</html>