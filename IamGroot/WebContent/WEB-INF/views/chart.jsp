<%@page import="kr.or.bit.dao.EmpDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
  href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.css" />
<script
  src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
  src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.min.js"></script>
  <link rel="stylesheet" href="../css/master.css">
</head>
<body>
<nav>
    <div class = "wrap">
    <a href = "list.do">
    <img src = "../picture/icon/groot.png" class = "logo"></a>
    <h1>(주)GROOT</h1>
    <ul>
      <li><a href="../register.html">사원 등록</a></li>
      <li><a href="emplyoeeface.html">사원 면상</a></li>
      <li><a href="chart.do">사원 통계</a></li>
    </ul>
  </div>
  </nav>
    

  <div class = "chartmove">
  <canvas id="container" width="400" height="100"></canvas>
  <div>
    <div class = "chartbox">
    <div class = "chartgap">
<select id="chart" name="chart" class = "selsize">
    <option value="deptno">부서번호</option>
    <option value="job">직종</option>
  </select>
   <a class = "emplink" href="list.do">&lt; 취소하고 돌아가기</a>
    </div>
  </div>
 
<script>
$(function() {
  <%EmpDao dao = new EmpDao();%>
  var keylist = [];
  var valuelist = [];

  var json = <%=dao.countByDeptno()%>;
  for (var key in json) {
    keylist.push(key);
    valuelist.push(json[key]);
  }

  var ctx = $('#container');

  var data = {
        datasets: [
          {
            backgroundColor: [
              'tomato',
              'yellow',
              'skyblue',
              'red',
              'blue',
              'purple',
              'beige',
              'pink',
              'orange',
            ],
            data: valuelist,
          },
        ],

        // These labels appear in the legend and in the tooltips when hovering different arcs
        labels: keylist,
      };

      var myChart = new Chart(ctx, {
        type: 'pie',
        data,
        option: {},
      });
});

$("#chart").change(function() {
  var selected = $("#chart").val();
  var keylist = [];
  var valuelist = [];
  if (selected === 'deptno') {
    var json = <%=dao.countByDeptno()%>;
    for (var key in json) {
      keylist.push(key);
      valuelist.push(json[key]);
    }
  } else {
    var json = <%=dao.countByJob()%>;
    for (var key in json) {
      keylist.push(key);
      valuelist.push(json[key]);
    }
  }
  
  var ctx = $('#container');

  var data = {
        datasets: [
          {
            backgroundColor: [
              'tomato',
              'yellow',
              'skyblue',
              'red',
              'blue',
              'purple',
              'beige',
              'pink',
              'orange',
            ],
            data: valuelist,
          },
        ],

        // These labels appear in the legend and in the tooltips when hovering different arcs
        labels: keylist,
      };

      var myChart = new Chart(ctx, {
        type: 'pie',
        data,
        option: {},
      });
    },
)
</script>

</body>
</html>