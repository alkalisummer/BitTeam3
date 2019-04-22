<%@page import="kr.or.bit.utils.SingletonHelper"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	if (session.getAttribute("userid") == null || !session.getAttribute("userid").equals("admin")) {
		out.print("<script>location.href = 'Login.jsp'</script>");
		// 강제로 다른 페이지로 이동
	}
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String name = request.getParameter("search");

	try {
		conn = SingletonHelper.getConnection("oracle");
		String sql1 = "select count(*) from koreamember where name like ?";
		String sql2 = "select id, name, email from koreamember where name like ?";
		pstmt = conn.prepareStatement(sql1);

		pstmt.setString(1, "%" + name + "%");

		rs = pstmt.executeQuery();
		rs.next();
		int count = rs.getInt(1);
		
		pstmt = conn.prepareStatement(sql2);
		pstmt.setString(1, "%" + name + "%");

		rs = pstmt.executeQuery();
%>

<jsp:include page="common/head.jsp" />
<link rel="stylesheet" href="css/memberlist.css">
</head>
<body>
	<jsp:include page="common/header.jsp" />
	<div class="center-area">
		<jsp:include page="common/aside.jsp" />
		<main>
		<table class="container">
			<thead>
				<tr>
					<th colspan="5">회원 조회 결과</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="i" begin="1" end="<%=count%>">
					<c:set var="next" value="<%=rs.next()%>" />
					<c:set var="id" value="<%=rs.getString(\"id\")%>" />
					<c:set var="name" value="<%=rs.getString(\"name\")%>" />
					<c:set var="email" value="<%=rs.getString(\"email\")%>" />
					<tr>
						<td>${id}</td>
						<td>${name}</td>
						<td>${email}</td>
						<td class="delmod">
						  <a href='Member_Delete.jsp?id=${id}'>[삭제]</a>
						</td>
						<td class="delmod">
						  <a href='MemberEdit.jsp?id=${id}'>[수정]</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
			<c:set var="count" value="<%=count%>" />
				<c:choose>
					<c:when test="${count == 0}">
						<td colspan="">조회 결과가 없습니다</td>
					</c:when>
					<c:otherwise>
						<td colspan="5">조회 결과 : ${count}명</td>
					</c:otherwise>
				</c:choose>
			</tfoot>
		</table>
		<hr>
		<form action="MemberSearch.jsp" method="post">
			회원명 : <input type="text" name="search"> <input type="submit"
				value="이름 검색 하기">
		</form>
		<hr>
		<%
			} catch (Exception e) {
				System.out.println(e.getMessage());
			} finally {
				SingletonHelper.close(rs);
				SingletonHelper.close(pstmt);
			}
		%> 
		</main>
	</div>
	<jsp:include page="common/footer.jsp" />