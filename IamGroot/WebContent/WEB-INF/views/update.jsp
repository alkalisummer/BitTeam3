<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="emp" value="${requestScope.emp}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/update.css">
</head>
<body>
<nav>
    <div class = "wrap">
    <img src = "../picture/icon/groot.png" class = "logo">
    <h1>(주)GROOT</h1>
    <ul>
      <li><a href="register.html">사원 등록</a></li>
      <li><a href="emplyoeeface.html">사원 면상</a></li>
      <li><a href="chart.do">사원 통계</a></li>
    </ul>
  </div>
  </nav>
  <form action="update.do" method="POST">
    Empno<input type="text" name="empno" value="${emp.empno}" readonly><br>
	Ename<input type="text" name="ename" value="${emp.ename}"><br>
  	Job<input type="text" name="job" value="${emp.job}"><br>
	Mgr<input type="text" name="mgr" value="${emp.mgr}"><br>
	Hiredate<input type="text" name="hiredate" value="${emp.hiredate}" readonly><br>
	sal<input type="text" name="sal" value="${emp.sal}"><br>
	Comm<input type="text" name="comm" value="${emp.comm}"><br>
	Deptno<input type="text" name="deptno" value="${emp.deptno}"><br>
	<input type="submit" value="수정하기" class = "button"><br>
	<a class = "emplink" href="list.do">&lt; 취소하고 돌아가기</a><br>
  </form>
</body>
</html>