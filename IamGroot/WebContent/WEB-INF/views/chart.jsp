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
  <select id="chart" name="chart">
    <option value="deptno">부서번호</option>
    <option value="job">직종</option>
  </select>
  
  <canvas id="container"></canvas>
<script>
$("#chart").change(function() {
  $.ajax({
    url: "stat",
    dataType: "html",
    data: {
      chart: $("#chart").val()
    },
    success: function(data) {
      $("body").html(data);
    },
    error: function(xhr) {
      console.log(xhr);
    }
  })
})
</script>
</body>
</html>