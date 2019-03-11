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
	<p>
		Event Title: ${event.name }<br> event Description:
		${event.description }<br> event Location:
		${event.address.street}, ${event.address.city}, ${event.address.state}<br>
		event Date: ${event.date }<br> event Created On:
		${event.createDate }<br>
	</p>

	<p>
		Characters in the event:<br>
	</p>
		<c:forEach var="user" items="${event.eventUsers }">
			<ul>
				<li>Char name: ${user.eventUserInfo.name }</li>
				<li>Char description: ${user.eventUserInfo.description }</li>
				<li>User: ${user.user }</li>
			</ul>
				<hr>
		</c:forEach>

	<%--   <p>
    Events in event:
  </p>
  
  <ol>
    <c:forEach var="event" items="${event.events }">
      <li>
        <a href="" >${event.name }</a>
          <ul>
            <li>${event.date }</li>
            <li>${event.description }</li>
          </ul>
      </li>
    </c:forEach>
  </ol> --%>

	<%--   <p>event Owner: ${(event.user).firstName } ${(event.user).lastName}<br>
     event Created On: ${event.createDate }<br>
  </p> --%>
	<br>
	<a href="/home/home.do?eventId=1">BACK TO HOME</a>
</body>
<jsp:include page="/WEB-INF/components/bootstrapFoot.jsp"></jsp:include>
</html>