<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kyubegadget.utils.StringUtils"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/styles/output.css"
	rel="stylesheet">
</head>
<body>

<p>your order is succsesful</p>
<a href="<%= request.getContextPath() + StringUtils.WELCOME_PAGE %>" class="mt-6 w-full rounded-md bg-blue-500 py-2 font-medium text-blue-50 hover:bg-blue-600 block text-center">Continue Shopping</a>

</body>
</html>