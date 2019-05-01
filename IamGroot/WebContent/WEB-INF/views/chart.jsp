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
</head>
<body>
  <a href="list.do">돌아가기</a>
  <select id="chart" name="chart">
    <option value="deptno">부서번호</option>
    <option value="job">직종</option>
  </select>

  <canvas id="container"></canvas>
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