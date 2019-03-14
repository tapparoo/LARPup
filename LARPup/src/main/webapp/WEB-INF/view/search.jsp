<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/components/bootstrapHead.jsp"></jsp:include>
<meta charset="UTF-8">
<title>Display User</title>
<link rel="stylesheet" href="/css/search.css">
</head>
<body>
<jsp:include page="/WEB-INF/components/navbar.jsp"></jsp:include>


<div class="container">
	<div class="row">
		<div class="col-1"></div>
		<div class="col box">
			<div class="row">
				<a class="btn btn-sm btn-primary" href="/search/searchById.do?id=5&searchFor=storiesOwned">Search Owned</a>
			</div>
			<div class="row">
				<a class="btn btn-sm btn-primary" href="/search/searchById.do?id=5&searchFor=storiesParticipatedIn">Search Participated in</a>
			</div>
			<div class="row">
				<a class="btn btn-sm btn-primary" href="/search/searchById.do?id=5&searchFor=roles">Search Roles</a>
			</div>
			<div class="row">
				<a class="btn btn-sm btn-primary" href="/search/searchByString.do?searchFor=users&searchString=com">Search UserNames</a>
			</div>
		</div>
		<div class="col box box-right">
			<c:forEach var="result" items="${searchResult}">
				<a href="/user/displayUser.do?userId=${result.id}">${result }</a><br><br>
			</c:forEach>
		</div>
		<div class="col-1"></div>
	</div>




	<div class="row"></div>
</div>

<jsp:include page="/WEB-INF/components/bootstrapFoot.jsp"></jsp:include>
</body>
</html>