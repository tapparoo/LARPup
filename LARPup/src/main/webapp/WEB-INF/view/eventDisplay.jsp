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