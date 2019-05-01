<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var = "list" value = "${requestScope.list}" /> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
</head>
<body>   
    <select name = "chart">
        <option value="deptno">부서번호별</option>
        <option value="job">직종별</option>
    </select>
    <div id="container" style="min-width: 310px; height: 400px; max-width: 600px; margin: 0 auto"></div>
<script>
		var key = [];
		var value = [];
		
		<c:forEach var = "count" items = "${list}">
	  key.push(${count.key});
	  value.push(${count.value});
	</c:forEach>
	console.log(name,value);
		
</script>    
<script src = "js/chart.js"></script>
</body>
</html>