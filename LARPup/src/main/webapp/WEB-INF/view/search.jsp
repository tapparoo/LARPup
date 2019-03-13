<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/components/bootstrapHead.jsp"></jsp:include>
<meta charset="UTF-8">
<title>Display User</title>
<link rel="stylesheet" href="/css/user_page.css">
</head>
<body>
<jsp:include page="/WEB-INF/components/navbar.jsp"></jsp:include>


<div class="container">
	<div class="row">
		<div class="col"></div>
		<div class="col">
		${searchResult}
			<a class="btn btn-sm btn-primary" href="/search/search.do?id=5&searchFor=storiesOwned">Search Owned</a>
			<a class="btn btn-sm btn-primary" href="/search/search.do?id=5&searchFor=storiesParticipatedIn">Search Participated in</a>
			<a class="btn btn-sm btn-primary" href="/search/search.do?id=5&searchFor=roles">Search Roles</a>
			
		</div>
		<div class="col"></div>
	</div>




	<div class="row"></div>
</div>

<jsp:include page="/WEB-INF/components/bootstrapFoot.jsp"></jsp:include>
</body>
</html>