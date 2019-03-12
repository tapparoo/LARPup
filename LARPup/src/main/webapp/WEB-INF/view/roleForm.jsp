<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/components/bootstrapHead.jsp"></jsp:include>
<head>
<meta charset="UTF-8">
<title>Role Form</title>
</head>
<body>
<jsp:include page="/WEB-INF/components/navbar.jsp"></jsp:include>

<form:form action="${action}" method="POST" modelAttribute="inputDTO">
  <form:input type="hidden" path="id" value="${role.id}"/>
  <form:input type="hidden" path="storyId" value="${story.id}"/>
  <form:label path="name" >NAME: </form:label>
  <form:input type="text" path="name" value="${role.name }"/>
  <form:errors type="text" path="name" />
  <br>
  <form:label path="name" >DESCRIPTION: </form:label>
  <form:input type="text" path="description" value="${role.description }"/>
  <form:errors type="text" path="description" />
  <br>
  <input type="submit" value="COMMIT" />
</form:form>

<a href="/home/home.do">BACK TO HOME</a>
</body>
<jsp:include page="/WEB-INF/components/bootstrapFoot.jsp"></jsp:include>
</html>