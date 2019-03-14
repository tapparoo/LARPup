<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/components/bootstrapHead.jsp"></jsp:include>
<head>
<meta charset="UTF-8">
<title>Story Form</title>
</head>
<body>
<jsp:include page="/WEB-INF/components/navbar.jsp"></jsp:include>

<div class="container">
<div class="row justify-content-center">
<div class="col-8">
<h1>Tell Your Story</h1>
<br>

<form:form action="${action }" method="POST" modelAttribute="inputDTO">
  <div class="form-row">
    <div class="form-group col-md-8">
      <form:input type="hidden" path="storyId" value="${story.id}"/>
      <form:input type="hidden" path="userId" value="${story.user.id}"/>
      <form:label path="storyName" >NAME </form:label>
      <form:input class="form-control" type="text" path="storyName" value="${story.name }" placeholder="Name"/>
      <form:errors type="text" path="storyName" />
    </div>
    <div class="form-group col-md-4">
      <form:label path="genreName">GENRE </form:label>
      <form:input class="form-control" type="text" path="genreName" value="${story.genre.name }" placeholder="Genre"/>
      <form:errors type="text" path="genreName" />
    </div>
  </div>
  <div class="form-row">
    <div class="col-12">
      <form:label path="storyDescription">DESCRIPTION </form:label>
      <form:textarea class="form-control" rows="5" type="text" path="storyDescription" value="${story.description }" placeholder="Description"/>
      <form:errors type="text" path="storyDescription" />
    </div>
  </div>
  <div class="form-row">
    <div class="form-group col-md-5">
      <form:label path="addressCity">CITY </form:label>
      <form:input class="form-control" type="text" path="addressCity" value="${story.address.city }" placeholder="City"/>
      <form:errors type="text" path="addressCity" />
    </div>
    <div class="form-group col-md-5">
      <form:label path="addressState">STATE </form:label>
      <form:input class="form-control" type="text" path="addressState" value="${story.address.state }" placeholder="State"/>
      <form:errors type="text" path="addressState" />
    </div>
    <div class="form-group col-md-2">
      <form:label path="addressZipcode">ZIP </form:label>
      <form:input class="form-control" type="text" path="addressZipcode" value="${story.address.zipcode }" placeholder="Zipcode"/>
      <form:errors type="text" path="addressZipcode" />
    </div>
  </div>
  <button type="submit" class="btn btn-primary" type="submit">COMMIT</button>
</form:form>
</div>
</div>
</div>
</body>
<jsp:include page="/WEB-INF/components/bootstrapFoot.jsp"></jsp:include>
</html>