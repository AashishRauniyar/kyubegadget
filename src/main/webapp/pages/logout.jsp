<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Logout Confirmation</title>
</head>
<body>
<%-- <%@ include file="navbar.jsp"%>
    <h2>Are you sure you want to logout?</h2>
    <form action="../LogoutServlet" method="GET">
        <button type="submit">Logout</button>
    </form>
<%@ include file="footer.jsp"%> --%>


<%
	session.setAttribute("userName","");
    session.invalidate();
%>

<script>
    // Clear browser history
    window.location.replace('<%= request.getContextPath() %>/pages/index.jsp');
</script>
</body>
</html>
