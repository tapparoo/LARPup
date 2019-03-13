<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/components/bootstrapHead.jsp"></jsp:include>
<head>
<meta charset="UTF-8">
<title>Display Event</title>
</head>
<body>
<jsp:include page="/WEB-INF/components/navbar.jsp"></jsp:include>
<div class="container">
  <div class="row">
    <div class="col">
    <img src="/resources/images/eventpics/frontPage2.jpg" />
    <h3>${event.name} - ${event.date }</h3>
    <p>${event.description}<br>
    The location of this event is ${event.address.street}, ${event.address.city}, ${event.address.state}, ${event.address.zipcode}</p>
    <c:if test="${sessionScope.myUser.id == event.story.user.id }"><a href="/event/eventForm.do?eventId=${event.id }">EDIT EVENT</a></c:if>
    </div>
  </div>
  <div class="row"><div class="col">
    <h2>Roles for this Event</h2><br>
    <c:if test="${sessionScope.myUser.id == event.story.user.id }">
      <div class="dropdown">
        <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        Add Role
        </button>
        <div class="dropdown-menu" aria-labelledby="dropdownMenu2">
          <c:forEach var="role" items="${event.story.eventRoles }">
          <%-- <form action="/event/assignRole.do" method="POST">
            <input type="hidden" name="roleId" value="${role.id }"/>
            <input type="hidden" name="eventId" value="${event.id }"/>
            <input type="submit" value="${role.name }" />
          </form> --%>
          <a class="dropdown-item" href="/event/assignRole.do?roleId=${role.id}&eventId=${event.id}">${role.name }</a>
          </c:forEach>
        </div>
      </div>
    </c:if>
    </div></div>  
    
<div class="container">
  <div class="row">
    <c:forEach var="eventUser" items="${event.eventUsers}" varStatus="iteration">
      <div class="card col-4 cardRole">
          <img class="card-img-top" src="/resources/event_images/default.jpg" alt="Card image cap">
        <div class="card-body">
         <h5 class="card-title">${eventUser.eventUserInfo.name }</h5>
         <p> ${eventUser.eventUserInfo.description } </p>
         <c:choose>
					<c:when test="${not empty eventUser.user }">
						Role reserved by ${eventUser.user.nickname }
					</c:when>
				
					<c:otherwise>
						<c:if test="${not empty sessionScope.myUser }">
							<form>
								<button
									formaction="/event/assignUserToCharacter.do?eventUserId=${eventUser.id}"
									formmethod="POST">"Reserve this role!"</button>
							</form>
						</c:if>
					</c:otherwise>
				  
				</c:choose>
         <p> <c:if test="${sessionScope.myUser.id == event.story.user.id }"> 
         <a class="btn btn-primary btn-sm active" role="button" aria-pressed="true" href="/story/modifyRole.do?roleId=${role.id }" >MODIFY</a>
         <a class="btn btn-danger btn-sm active" role="button" aria-pressed="true" href="/event/removeRole.do?eventUserId=${eventUser.id }&eventId=${event.id }" >REMOVE</a>
         </c:if></p>
        </div>
      </div>
    </c:forEach>
  </div>
</div>
</div>	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<div class="container">
		<p>
			Event Title: ${event.name }<br> Description: ${event.description }<br>
			Location: ${event.address.street}, ${event.address.city},
			${event.address.state}<br> Date: ${event.date }<br> Created
			On: ${event.createDate }<br>
		</p>

		<p>
			Characters in the event:<br>
		</p>
		<c:forEach var="eventUser" items="${event.eventUsers }">
			<ul>
				<li>Char name: ${eventUser.eventUserInfo.name }</li>
				<li>Char description: ${eventUser.eventUserInfo.description }</li>
				<li>Availability: 
				<c:choose>
					<c:when test="${not empty eventUser.user }">
						Role reserved by ${eventUser.user.nickname }
					</c:when>
				
					<c:otherwise>
						<c:if test="${not empty sessionScope.myUser }">
							<form>
								<button
									formaction="/event/assignUserToCharacter.do?eventUserId=${eventUser.id}"
									formmethod="POST">"Reserve this role!"</button>
							</form>
						</c:if>
					</c:otherwise>
				  
				</c:choose>
				</li>
			</ul>
			<hr>
		</c:forEach>
		<br> <a class="btn btn-sm btn-secondary"
			href="/event/eventForm.do?eventId=${event.id}">Edit Event</a> <br>
		<a href="/home/home.do">BACK TO HOME</a>
	</div>
</body>
<jsp:include page="/WEB-INF/components/bootstrapFoot.jsp"></jsp:include>
</html>