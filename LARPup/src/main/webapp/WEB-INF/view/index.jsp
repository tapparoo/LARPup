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
</head>
<body>
<jsp:include page="/WEB-INF/components/navbar.jsp"></jsp:include>

<div class="container">
  <div class="row"><div class="col"></div></div>
  <div class="row">
    <div class="cols">
      <img src="/resources/images/eventpics/frontPage2.jpg" />
      <h3>LARP UP!</h3>
      <p>Inspirational reasons to go beat people with foam swords</p>
    </div>
  </div>
  <div class="row">
    <c:forEach var="story" items="${recentStoryList }">
    
    <div class="col">
      <div class="card" style="width: 18rem">
        <img src="..." class="card-img-top" alt="...">
        <div class="card-body">
          <h5 class="card-title">${story.name }</h5>
          <p class="card-text">${story.description }</p>
          <p class="card-text">${story.address.city }, ${story.address.state }</p>
          <a href="/story/displayStory.do?storyId=${story.id}" >GO TO STORY</a>
        </div>
      </div>
    </div>
    
    </c:forEach>
  </div>
  <div class="row">
  </div>
</div>

<p>TEST PAGES</p>
<a href="/home/greg.do">GO TO GREG'S TEST PAGE</a><br>
<a href="/home/adam.do">GO TO ADAM'S TEST PAGE</a><br>
<a href="/home/young.do">GO TO YOUNG'S TEST PAGE</a><br>

</body>
<jsp:include page="/WEB-INF/components/bootstrapFoot.jsp"></jsp:include>
</html>