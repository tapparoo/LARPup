<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/components/bootstrapHead.jsp"></jsp:include>
<head>
<meta charset="UTF-8">
<title>Display Event</title>
<link rel="stylesheet" href="/css/event_page.css">
<link rel="stylesheet" href="/css/card.css">
</head>
<body>
<jsp:include page="/WEB-INF/components/navbar.jsp"></jsp:include>
<div class="container">
  <div class="row">
    <div class="col">
    <img src="/resources/images/eventpics/frontPage2.jpg" />
    <h1>${event.name} - ${event.date }</h1>
    <p>${event.description}<br>
    The location of this event is ${event.address.street}, ${event.address.city}, ${event.address.state}, ${event.address.zipcode}</p>
    <c:if test="${sessionScope.myUser.id == event.story.user.id }"><a class="btn btn-primary btn-sm" role="button" aria-pressed="true" href="/event/eventForm.do?eventId=${event.id }">EDIT EVENT</a></c:if>
    <a class="btn btn-success btn-sm" role="button" aria-pressed="true" href="/story/displayStory.do?storyId=${event.story.id }">RETURN TO STORY</a>
    </div>
  </div>
  <div class="row"><div class="col">
    <h3>Roles for this Event</h3>
    </div></div>  
    <c:if test="${sessionScope.myUser.id == event.story.user.id }">
      <div class="row"><div class="col">
        <form action="/event/assignRole.do" method="POST">
            <div class="form-group">
              <input type="hidden" name="eventId" value="${event.id }" />
            </div>
            <div class="form-row">
              <div class="form-group">
              <select name="roleId" class="form-control">
              <c:forEach var="role" items="${event.story.eventRoles }">
                <option value="${role.id }"> ${role.name } </option>
              </c:forEach>
              </select>
              </div>
              <div class="form-group">
                <input class="btn btn-success" type="submit" value="Add Role"/>
              </div>
            </div>
        </form>
      </div></div>
    </c:if>
    
<div class="container">
  <div class="row">
    <c:forEach var="eventUser" items="${event.eventUsers}" varStatus="iteration">
      <div class="card col-4 cardRoleExp">
        <img class="card-img-top" src="/resources/images/cardpics/larpconHead.jpg" alt="Card image cap">
        <div class="card-header">
          <h5 class="card-title">${eventUser.eventUserInfo.name }</h5>
        </div>
        <div class="card-body cardDescription">
          <p> ${eventUser.eventUserInfo.description } </p>
        </div>
        <div class="card-footer">
        <div class="row justify-content-center">
         <c:choose>
		    <c:when test="${not empty eventUser.user }">
		      Role reserved by ${eventUser.user.nickname }
		    </c:when>
            <c:otherwise>
		      <c:if test="${not empty sessionScope.myUser }">
	    		   <form>
			      <button class="btn btn-success btn-sm" formaction="/event/assignUserToCharacter.do?eventUserId=${eventUser.id}" formmethod="POST">"Reserve this role!"</button>
			    </form>
			  </c:if>
		    </c:otherwise>
		  </c:choose>
		  </div>
		</div>
         <c:if test="${sessionScope.myUser.id == event.story.user.id }">
           <div class="row justify-content-center">
             <form action="/story/modifyRole.do" method="GET">
               <input type="hidden" name="roleId" value="${eventUser.eventUserInfo.id }" />
               <input type="submit" class="btn btn-primary btn-sm space" value="MODIFY" />
             </form>
             <form action="/event/removeRole.do" method="POST">
               <input type="hidden" name="eventUserId" value="${eventUser.id }" />
               <input type="hidden" name="eventId" value="${event.id }" />
               <input type="submit" class="btn btn-danger btn-sm space" value="REMOVE" />
             </form>
           </div> 
         </c:if>
        </div>
    </c:forEach>
  </div>
</div>
<p>Created On: ${event.createDate }</p>
</div>	
</body>
<jsp:include page="/WEB-INF/components/bootstrapFoot.jsp"></jsp:include>
</html>