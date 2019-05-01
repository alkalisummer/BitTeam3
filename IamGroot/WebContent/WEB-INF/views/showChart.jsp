<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="list" value="${requestScope.list}" />
<%
  Map list = (Map) request.getAttribute("list");
  System.out.println(list);
%>
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
      console.log($("#chart").val());
      var key2 = [];
      var value2 = [];
      <c:forEach var="obj" items="${list}">
      key2.push("${obj.key}");
      value2.push(${obj.value});
      </c:forEach>
      console.log(key2);
      console.log(value2);
      
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
            data: value2,
          },
        ],

        // These labels appear in the legend and in the tooltips when hovering different arcs
        labels: key2,
      };

      var myChart = new Chart(ctx, {
        type: 'pie',
        data,
        option: {},
      });
    },
    error: function(xhr) {
      console.log(xhr);
    }
  })
})
</script>