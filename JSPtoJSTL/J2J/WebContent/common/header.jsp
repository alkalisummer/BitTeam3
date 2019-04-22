<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");
  String userid = (String) session.getAttribute("userid");
%>

<header>
  <nav>
    <ul class="top-nav">
      <li>
        <a href="index.jsp"><p>Main</p></a>
      </li>
      <c:choose>
        <c:when test="${userid == null}">
          <li><a href="Login.jsp">Login</a></li>
          <li><a href="JoinForm.jsp">Register</a></li>
        </c:when>
        <c:otherwise>
          <c:if test="${userid == 'admin'}">
            <li><a href="MemberList.jsp">MemberList</a></li>
          </c:if>
            <li><a href="Logout.jsp">Logout</a></li>
        </c:otherwise>
      </c:choose>
    </ul>
  </nav>
  <h1>3조</h1>
</header>