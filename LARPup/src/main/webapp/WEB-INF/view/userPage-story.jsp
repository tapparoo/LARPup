<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet" href="/css/card.css">

<c:choose>
  <c:when test="${not empty ownerStoryList }">
  
    <div class="row">
      <h3>Your Stories <a class="btn btn-primary btn-sm" role="button" aria-pressed="true" href="/story/addStory.do">ADD A STORY</a></h3>
    </div>

    <div class="row">
      <c:forEach var="story" items="${ownerStoryList}">
        <div class="card col-4 cardRole">
          <img class="card-img-top" src="/resources/images/cardpics/openbook.jpg" alt="Card image cap">
        <div class="card-body">
          <h5 class="card-title">${story.name }</h5>
          <p>${story.description}<br>
          ${story.address.city }, ${story.address.state }</p>
          <a class="btn btn-success btn-sm" role="button" aria-pressed="true" href="/story/displayStory.do?storyId=${story.id }">GO TO STORY</a>
        </div>
        </div>
      </c:forEach>
    </div>
  </c:when>
  <c:otherwise>
    <h3> You do not have any stories you own. <a class="btn btn-primary btn-sm" role="button" aria-pressed="true" href="/story/addStory.do">ADD A STORY</a></h3>
  </c:otherwise>
</c:choose>


<div class="row">
<h3>Stories you are involved in</h3>
</div>

<c:choose>
  <c:when test="${not empty involvedStoryList }">
  
    <div class="row">
      <c:forEach var="story" items="${involvedStoryList}">
        <div class="card col-4 cardRole">
          <img class="card-img-top" src="/resources/images/cardpics/openbook.jpg" alt="Card image cap">
        <div class="card-body">
         <h5 class="card-title">${story.name }</h5>
         <p>${story.description}<br>
         ${story.address.city }, ${story.address.state }</p>
         <a class="btn btn-success btn-sm" role="button" aria-pressed="true" href="/story/displayStory.do?storyId=${story.id }">GO TO STORY</a>
        </div>
        </div>
      </c:forEach>
    </div>
  
  </c:when>
  <c:otherwise>
    <h3> You are currently not involved in any stories </h3>
  </c:otherwise>
</c:choose>
