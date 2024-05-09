<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>cart clear</title>
</head>
<body>
<%-- <%@ include file="navbar.jsp"%>
    <h2>Are you sure you want to logout?</h2>
    <form action="../LogoutServlet" method="GET">
        <button type="submit">Logout</button>
    </form>
<%@ include file="footer.jsp"%> --%>


<%

session.removeAttribute("cartList");
%>

<script>
    // Clear browser history
    window.location.replace('<%= request.getContextPath() %>/pages/home.jsp');
</script>
</body>
</html>