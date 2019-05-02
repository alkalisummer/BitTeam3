<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 등록</title>
<link rel="stylesheet" href="../css/update.css">
</head>
<body>
  <nav>
    <div class = "wrap">
    <a href = "list.do">
    <img src = "../picture/icon/groot.png" class = "logo"></a>
    <h1>(주)GROOT</h1>
    <ul>
      <li><a href="regInput.do">사원 등록</a></li>
      <li><a href="chart.do">사원 통계</a></li>
    </ul>
    <ul>
  		<li class="user"><%= session.getAttribute("id") %>님</li>
  		<li><a class="user" href="logout.do">Logout</a> </li>
  	</ul>
  </div>
  </nav>
  <form action="register.do" method="POST">
    <label for="empno" class="label">사원번호</label> 
    <input type="text" id="empno" name="empno" class="text"><br> 
    <label for="ename" class="label">사원이름</label> 
    <input type="text" id="ename" name="ename" class="text"><br> 
    <label for="job" class="label">직업</label> 
    <input type="text" id="job" name="job" class="text"><br>
    <label for="hiredate" class="label">고용일자</label> 
    <input type="text" id="hiredate" name="hiredate" class="text"><br> 
    <label for="deptno" class="label">부서번호</label>
    <input type="text" id="deptno" name="deptno" class="text"><br> 
    <label for="sal" class="label">월급</label> 
    <input type="text" id="sal" name="sal" class="text"><br>
    <label for="comm" class="label">수당</label> 
    <input type="text" id="comm" name="comm" class="text"><br> 
    <label for="mgr" class="label">사수</label> 
    <input type="text" id="mgr" name="mgr" class="text"><br> 
    <input type="submit" value="등록" class="button"><br>
    <a class="emplink" href="list.do">&lt; 취소하고 돌아가기</a>
  </form>
</body>
</html>