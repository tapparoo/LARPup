<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/components/bootstrapHead.jsp"></jsp:include>
<head>
<meta charset="UTF-8">
<title>Display Story</title>
<link rel="stylesheet" href="/css/card.css">
</head>
<body>
<jsp:include page="/WEB-INF/components/navbar.jsp"></jsp:include>

<div class="container">
  <div class="row">
    <div class="col">
    <h3>${story.name}</h3>
    <p>${story.genre.name} <br>
    ${story.description}<br></p>
    <img src="/resources/images/eventpics/frontPage2.jpg" />
    <p>The location of this story is ${story.address.city }, ${story.address.state } </p>
    <c:if test="${sessionScope.myUser.id == story.user.id }"><a href="/story/modifyStory.do?storyId=${story.id }">EDIT STORY</a></c:if>
    </div>
  </div>
  <div class="row"><div class="col">
    <h2>Roles for this Story</h2><br>
    <c:if test="${sessionScope.myUser.id == story.user.id }"><a href="/story/addRole.do?storyId=${story.id }">Add Role</a></c:if>
    </div></div>  
    
<div class="container">
  <div class="row">
    <c:forEach var="role" items="${story.eventRoles}" varStatus="iteration">
      <div class="card col-4 cardRole">
          <img class="card-img-top" src="/resources/event_images/default.jpg" alt="Card image cap">
        <div class="card-body">
         <h5 class="card-title">${role.name }</h5>
         <p> ${role.description } </p>
         <p> <c:if test="${sessionScope.myUser.id == story.user.id }"> <a href="/story/modifyRole.do?roleId=${role.id }" >MODIFY</a></c:if></p>
        </div>
      </div>
    </c:forEach>
  </div>
</div>
    
    
  <div class="row"><div class="col">
    <h2>Events for this Story</h2><br>
    <c:if test="${sessionScope.myUser.id == story.user.id }"><a href="/event/newEventForm.do?storyId=${story.id }">Add Event</a></c:if>
  </div></div>

<div class="container">
  <div class="row">
    <c:forEach var="event" items="${story.events}" varStatus="iteration">
      <div class="card col-4 cardEvent">
          <img class="card-img-top" src="/resources/event_images/default.jpg" alt="Card image cap">
        <div class="card-body">
         <h5 class="card-title">${event.name }</h5>
         <p> ${event.description } </p>
         <p> ${event.date } </p>
         <p> <a href="/event/displayEvent.do?eventId=${event.id }" >GO TO EVENT</a>
        </div>
      </div>
    </c:forEach>
  </div>
</div>
</div>

</body>
<jsp:include page="/WEB-INF/components/bootstrapFoot.jsp"></jsp:include>
</html>