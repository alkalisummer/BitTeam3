<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="empface" value="<%=request.getAttribute(\"empface\")%>" />
<c:set var="emp" value="<%=request.getAttribute(\"emp\")%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 사진 업로드</title>
<link rel="stylesheet" href="../css/master.css">
</head>
<body>
  <nav>
    <div class="wrap">
     <a href = "list.do">
      <img src="../picture/icon/groot.png" class="logo"></a>
      <h1>(주)GROOT</h1>
      <ul>
        <li><a href="regInput.do">사원 등록</a></li>
        <li><a href="chart.do">사원 통계</a></li>
      </ul>
    </div>
  </nav>
  <h3>${emp.ename}</h3>
  <h4>${empface.empno}</h4>
  <img alt="" src="images/${empface.url}">
  <form action="upload.do" method="post" enctype="multipart/form-data">
    <input type="file" name="face"> 
    <input type="hidden" name="empno" value="${empface.empno}"> 
    <input type="submit" value="upload">
  </form>
  <a href="list.do">돌아가기</a>
</body>
</html>