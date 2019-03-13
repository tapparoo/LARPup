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
    <img src="/resources/images/eventpics/frontPage2.jpg" />
    <h2>${story.name}
    <c:if test="${sessionScope.myUser.id == story.user.id }"><a class="btn btn-primary btn-sm" role="button" aria-pressed="true" href="/story/modifyStory.do?storyId=${story.id }">EDIT STORY</a></c:if>
    </h2>
    <p>${story.genre.name} <br>
    ${story.description}<br></p>
    <p>The location of this story is ${story.address.city }, ${story.address.state } </p>
    </div>
  </div>
  <div class="row"><div class="col">
    <h3>Roles for this Story
    <c:if test="${sessionScope.myUser.id == story.user.id }"><a class="btn btn-primary btn-sm" role="button" aria-pressed="true" href="/story/addRole.do?storyId=${story.id }">Add Role</a></c:if>
    </h3><br>
    </div></div>  
    
<div class="container">
  <div class="row">
    <c:forEach var="role" items="${story.eventRoles}" varStatus="iteration">
      <div class="card col-4 cardRole">
          <img class="card-img-top" src="/resources/images/cardpics/larpconHead.jpg" alt="Card image cap">
        <div class="card-body">
         <h5 class="card-title">${role.name }</h5>
         <p> ${role.description } </p>
         <c:if test="${sessionScope.myUser.id == story.user.id }">
           <a class="btn btn-primary btn-sm" role="button" aria-pressed="true" href="/story/modifyRole.do?roleId=${role.id }" >MODIFY</a>
         </c:if>
        </div>
      </div>
    </c:forEach>
  </div>
</div>
    
    
  <div class="row"><div class="col">
    <h3>Events for this Story
    <c:if test="${sessionScope.myUser.id == story.user.id }"><a class="btn btn-primary btn-sm" role="button" aria-pressed="true" href="/event/newEventForm.do?storyId=${story.id }">Add Event</a></c:if>
    </h3><br>
  </div></div>

<div class="container">
  <div class="row">
    <c:forEach var="event" items="${story.events}" varStatus="iteration">
      <div class="card col-4 cardEvent">
          <img class="card-img-top" src="/resources/images/cardpics/castle.jpg" alt="Card image cap">
        <div class="card-body">
         <h5 class="card-title">${event.name }</h5>
         <p> ${event.description } </p>
         <p> ${event.date } </p>
         <div class="row">
           <div class="col">
           <a class="btn btn-success btn-sm" role="button" aria-pressed="true" href="/event/displayEvent.do?eventId=${event.id }" >GO TO EVENT</a>
           </div>
         </div>
        </div>
      </div>
    </c:forEach>
  </div>
</div>
</div>

</body>
<jsp:include page="/WEB-INF/components/bootstrapFoot.jsp"></jsp:include>
</html>