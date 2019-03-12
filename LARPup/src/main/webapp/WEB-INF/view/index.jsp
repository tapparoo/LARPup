<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/components/bootstrapHead.jsp"></jsp:include>
<head>
<meta charset="UTF-8">
<title>Main Page</title>
</head>
<body>
<jsp:include page="/WEB-INF/components/navbar.jsp"></jsp:include>



<a href="/user/displayUser.do">GO TO USER PAGE (USER CONTROLLER STUFF)</a><br>
<a href="/auth/authorize.do">AUTH CONTROLLER (AUTHORIZATION CONTROLLER STUFF)</a><br>
<a href="/story/displayStory.do">GO TO STORY (STORY CONTROLLER STUFF)</a><br>
<a href="/search/search.do">GO TO SEARCH (SEARCH CONTROLLER STUFF)</a><br>
<br>
<p>TEST PAGES</p>
<a href="/home/greg.do">GO TO GREG'S TEST PAGE</a><br>
<a href="/home/adam.do">GO TO ADAM'S TEST PAGE</a><br>
<a href="/home/young.do">GO TO YOUNG'S TEST PAGE</a><br>

</body>
<jsp:include page="/WEB-INF/components/bootstrapFoot.jsp"></jsp:include>
</html>