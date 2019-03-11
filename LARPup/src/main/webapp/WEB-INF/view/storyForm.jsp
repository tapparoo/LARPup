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

<p>THIS STORY: ${story.name } </p>

<form:form action="${action }" method="POST" modelAttribute="inputDTO">
  <form:input type="hidden" path="storyId" value="${story.id}"/>
  <form:input type="hidden" path="userId" value="${story.user.id}"/>
  <form:label path="storyName" >NAME: </form:label>
  <form:input type="text" path="storyName" value="${story.name }"/>
  <form:errors type="text" path="storyName" />
  <br>
  <form:label path="storyDescription">DESCRIPTION: </form:label>
  <form:input type="text" path="storyDescription" value="${story.description }"/>
  <form:errors type="text" path="storyDescription" />
  <br>
  <form:label path="genreName">GENRE: </form:label>
  <form:input type="text" path="genreName" value="${story.genre.name }"/>
  <form:errors type="text" path="genreName" />
  <br>
  <form:label path="addressCity">CITY: </form:label>
  <form:input type="text" path="addressCity" value="${story.address.city }"/>
  <form:errors type="text" path="addressCity" />
  <br>
  <form:label path="addressState">STATE: </form:label>
  <form:input type="text" path="addressState" value="${story.address.state }"/>
  <form:errors type="text" path="addressState" />
  <br>
  <form:label path="addressZipcode">ZIP: </form:label>
  <form:input type="text" path="addressZipcode" value="${story.address.zipcode }"/>
  <form:errors type="text" path="addressZipcode" />
  <br>

  <input type="submit" value="COMMIT" />

</form:form>

<a href="/home/home.do">BACK TO HOME</a>
</body>
<jsp:include page="/WEB-INF/components/bootstrapFoot.jsp"></jsp:include>
</html>