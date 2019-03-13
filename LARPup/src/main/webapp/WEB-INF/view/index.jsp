<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/components/bootstrapHead.jsp"></jsp:include>
<head>
<meta charset="UTF-8">
<title>Main Page</title>
<link rel="stylesheet" href="/css/card.css">
</head>
<body>
<jsp:include page="/WEB-INF/components/navbar.jsp"></jsp:include>

<div class="container">
  <div class="row"><div class="col"></div></div>
  <div class="row">
    <div class="col">
      <img src="/resources/images/eventpics/frontPage2.jpg" />
      <h3>LARP UP!</h3>
      <p>Inspirational reasons to go beat people with foam swords</p>
    </div>
  </div>
</div>
<div class="container">
  <div class="row">
        <c:forEach var="story" items="${recentStoryList }">
          <div class="card col-4 cardStory">
            <img class="card-img-top" src="/resources/images/cardpics/openbook.jpg" alt="Card image cap">
            <div class="card-body">
              <h5 class="card-title">${story.name }</h5>
              <p>${story.description}</p>
              <p>${story.address.city }, ${story.address.state }</p>
              <a class="btn btn-success btn-sm" role="button" aria-pressed="true" href="/story/displayStory.do?storyId=${story.id }">GO TO STORY</a>
            </div>
          </div>
        </c:forEach>
  </div>
</div>

<p>TEST PAGES</p>
<a href="/home/greg.do">GO TO GREG'S TEST PAGE</a><br>
<a href="/home/adam.do">GO TO ADAM'S TEST PAGE</a><br>
<a href="/home/young.do">GO TO YOUNG'S TEST PAGE</a><br>

</body>
<jsp:include page="/WEB-INF/components/bootstrapFoot.jsp"></jsp:include>
</html>