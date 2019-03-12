<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/components/bootstrapHead.jsp"></jsp:include>
<head>
<meta charset="UTF-8">
<title>Display User</title>
</head>
<body>

<c:choose>
<c:when test="${user.active}">
	I MADE IT!!! WELCOME TO THE USERDISPLAY JSP!!!
	<br>
	Nickname: ${user.nickname }<br>
	First Name: ${user.firstName }<br>
	Last Name: ${user.lastName }<br>
	Email: ${user.email }<br>
	Password: ${user.password }<br>
	Birthday: ${user.birthDate }<br>
	Created: ${user.createDate }<br>
	
<form action="/user/deactivateUser.do?userId=${user.id}" method="POST">
	<button type="Submit" class="btn btn-danger">Deactivate</button>
</form>
</c:when>
<c:otherwise>This account is not active</c:otherwise>
</c:choose>

	<a href="/home/home.do">BACK TO HOME</a>
</body>
<jsp:include page="/WEB-INF/components/bootstrapFoot.jsp"></jsp:include>
</html>