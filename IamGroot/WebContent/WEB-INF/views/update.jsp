<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="emp" value="${requestScope.emp}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <form action="list.do">
    Empno : <input type="text" name="empno" value="${emp.empno}" readonly><br>
	Ename : <input type="text" name="ename" value="${emp.ename}"><br>
  	Job : <input type="text" name="job" value="${emp.job}"><br>
	Mgr : <input type="text" name="mgr" value="${emp.mgr}"><br>
	Hiredate : <input type="text" name="hiredate" value="${emp.hiredate}" readonly><br>
	sal : <input type="text" name="sal" value="${emp.sal}"><br>
	Comm : <input type="text" name="comm" value="${emp.comm}"><br>
	Deptno : <input type="text" name="deptno" value="${emp.deptno}"><br>
	<input type="submit" value="수정하기"><br>
	<a href="list.do">취소하고 돌아가기</a><br>
  </form>
</body>
</html>