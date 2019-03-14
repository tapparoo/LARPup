<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="row">
<h3>Your Roles</h3>
</div>

<div class="row">
    <c:forEach var="role" items="${roleList}">
      <div class="card col-4 cardRole">
          <img class="card-img-top" src="/resources/images/cardpics/openbook.jpg" alt="Card image cap">
        <div class="card-body">
         <h5 class="card-title">${role.eventUserInfo.name }</h5>
           <p>${role.eventUserInfo.description}<br>
           Story: ${role.event.story.name}<br>
           Event: ${role.event.name}</p>
           <a class="btn btn-success btn-sm" role="button" aria-pressed="true" href="/story/displayStory.do?storyId=${story.id }">GO TO STORY</a>
        </div>
      </div>
    </c:forEach>
</div>