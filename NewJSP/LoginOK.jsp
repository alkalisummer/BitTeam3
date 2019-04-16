<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  session.setAttribute("userid", "yes");
  response.sendRedirect("index.jsp");
%>

