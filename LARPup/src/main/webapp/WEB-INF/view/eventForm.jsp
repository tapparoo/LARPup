<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
    
<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/components/bootstrapHead.jsp"></jsp:include>
<head>
<meta charset="UTF-8">
<title>Event Form</title>
</head>
<body>

<div class="container">

<form:form action="${action}" method="POST" modelAttribute="eventDTO">
  <form:input type="hidden" path="id" value="${event.id}"/>
  <form:input type="hidden" path="storyId" value="${event.story.id}"/>
  <form:label path="name" >NAME: </form:label>
  <form:input type="text" path="name" value="${event.name }"/>
  <form:errors type="text" path="name" />
  <br>
  <form:label path="description">DESCRIPTION: </form:label>
  <form:input type="text" path="description" value="${event.description}"/>
  <form:errors type="text" path="description" />
  <br>
<%--   <form:label path="date">DATE: </form:label>
  <form:input type="text" path="date" value="${event.date }"/>
  <form:errors type="text" path="date" /> --%>
  <br>
  <form:label path="street">STREET: </form:label>
  <form:input type="text" path="street" value="${event.address.street }" />
  <form:errors type="text" path="street" />
  <br>
  <form:label path="city">CITY: </form:label>
  <form:input type="text" path="city" value="${event.address.city }"/>
  <form:errors type="text" path="city" />
  <br>
  <form:label path="state">STATE: </form:label>
  <form:input type="text" path="state" value="${event.address.state }"/>
  <form:errors type="text" path="state" />
  <br>
  <form:label path="zipcode">ZIP: </form:label>
  <form:input type="text" path="zipcode" value="${event.address.zipcode }"/>
  <form:errors type="text" path="zipcode" />
  <br>

  <input type="submit" value="COMMIT" />

</form:form>



</div>

<a href="/home/home.do">BACK TO HOME</a>
</body>
<jsp:include page="/WEB-INF/components/bootstrapFoot.jsp"></jsp:include>
</html>