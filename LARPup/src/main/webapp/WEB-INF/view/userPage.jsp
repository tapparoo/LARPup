<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/components/bootstrapHead.jsp"></jsp:include>
<head>
<meta charset="UTF-8">
<title>Display User</title>
<link rel="stylesheet" href="/css/user_page.css">
</head>
<body>
<jsp:include page="/WEB-INF/components/navbar.jsp"></jsp:include>
<div class="header">
	<div class="container">
		<div class="userPic">
			<div class="row">
				<div class="col-4">
					<img width="75px" src="${user.picture.url}">
					<div class="dropdown">
						<a class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							Change Image
						</a>
						<div class="dropdown-menu">
							<form action="updateUser.do" method="POST" class="px-1 py-1">
								<div class="form-group">
									<label for="pictureUrl">URL:</label> 
									<input type="text" class="form-control" name="pictureUrl" value="${user.picture.url }">
								</div>
								<button type="submit" class="btn btn-primary">Submit</button>
							</form>
						</div>
					</div>
				</div>
				<div class="col-8 insetshadow">
					<h1>${user.nickname }</h1>
				</div>
			</div>
		</div>
	</div>
	<nav id="userTabs">
	  <div class="nav nav-tabs" id="nav-tab" role="tablist">
	    <a class="nav-item nav-link active" id="nav-info-tab" data-toggle="tab" href="#nav-info" role="tab" aria-controls="nav-info" aria-selected="true">Home</a>
	    <a class="nav-item nav-link" id="nav-stories-tab" data-toggle="tab" href="#nav-stories" role="tab" aria-controls="nav-stories" aria-selected="false">Stories</a>
	    <a class="nav-item nav-link" id="nav-roles-tab" data-toggle="tab" href="#nav-roles" role="tab" aria-controls="nav-roles" aria-selected="false">Roles</a>
	  </div>
	</nav>
</div>
<div class="container">
</div>

<div class="container white">
	<div class="tab-content" id="nav-tabContent">
	  <div class="tab-pane fade show active" id="nav-info" role="tabpanel" aria-labelledby="nav-info-tab">
		<div class="container">
			<div class="userDetails">
			  	<c:choose>
					<c:when test="${user.active}">
						<c:choose>
							<c:when test="${not empty action}">
								<jsp:include page="/WEB-INF/view/userPage-edit.jsp"></jsp:include>
							</c:when>
							<c:otherwise>
								<jsp:include page="/WEB-INF/view/userPage-display.jsp"></jsp:include>
							</c:otherwise>
						</c:choose>
					</c:when>
					<c:otherwise>
						This account is not active
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	  </div>
	  <div class="tab-pane fade" id="nav-stories" role="tabpanel" aria-labelledby="nav-stories-tab">...</div>
	  <div class="tab-pane fade" id="nav-roles" role="tabpanel" aria-labelledby="nav-roles-tab">...</div>
	</div>
</div>


<c:if test="${user.role == 'admin' }">
	<jsp:include page="/WEB-INF/view/admin.jsp"></jsp:include>
</c:if>
</body>
<jsp:include page="/WEB-INF/components/bootstrapFoot.jsp"></jsp:include>
</html>