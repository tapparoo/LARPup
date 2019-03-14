<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/components/bootstrapHead.jsp"></jsp:include>
<head>
<meta charset="UTF-8">
<title>Event Form</title>
</head>
<body>
<jsp:include page="/WEB-INF/components/navbar.jsp"></jsp:include>

<div class="container">
<div class="row justify-content-center">
<div class="col-8">



<form:form action="${action}" method="POST" modelAttribute="eventDTO">
  <div class="form-row">
    <div class="form-group col-md-8">
      <form:input type="hidden" path="id" value="${event.id}"/>
      <form:input type="hidden" path="storyId" value="${event.story.id}"/>
      <form:label path="name" >NAME: </form:label>
      <form:input class="form-control" type="text" path="name" value="${event.name }" placeholder="Name"/>
      <form:errors type="text" path="name" />
    </div>
    <div class="form-group col-md-4">
      <form:label path="date">DATE: </form:label>
      <form:input class="form-control" type="datetime-local" path="date" value="${event.date }"/>
      <form:errors type="text" path="date" />
    </div>
  </div>
  <div class="form-row">
    <div class="form-group col-12">
      <form:label path="description">DESCRIPTION: </form:label>
      <form:textarea class="form-control" type="text" rows="5" path="description" value="${event.description}" placeholder="Description"/>
      <form:errors type="text" path="description" />
    </div>
  </div>
  <div class="form-row">
    <div class="form-group col-12">
      <form:label path="street">STREET: </form:label>
      <form:input class="form-control" type="text" path="street" value="${event.address.street }" placeholder="Street" />
      <form:errors type="text" path="street" />
    </div>
  </div>
  <div class="form-row">
    <div class="form-group col-5">
      <form:label path="city">CITY: </form:label>
      <form:input class="form-control" type="text" path="city" value="${event.address.city }" placeholder="City"/>
      <form:errors type="text" path="city" />
    </div>
    <div class="form-group col-5">
      <form:label path="state">STATE: </form:label>
              <form:select path="state" class="form-control">
        <c:if test="${ not empty user.address.state}"><form:option value="${user.address.state}">${user.address.state}</form:option> </c:if>
        <c:forEach var="myState" items="${statesList.statesList}">
          <form:option value="${myState}">${myState}</form:option>
        </c:forEach>
        </form:select>
      <%-- <form:input class="form-control" type="text" path="state" value="${event.address.state }" placeholder="State"/>
       --%><form:errors type="text" path="state" />
    </div>
    <div class="form-group col-2">
      <form:label path="zipcode">ZIP: </form:label>
      <form:input class="form-control" type="text" path="zipcode" value="${event.address.zipcode }" placeholder="Zipcode"/>
      <form:errors type="text" path="zipcode" />
    </div>
  </div>
  <button type="submit" class="btn btn-primary">COMMIT</button>

</form:form>


</div>
</div>
</div>

<a href="/home/home.do">BACK TO HOME</a>
</body>
<jsp:include page="/WEB-INF/components/bootstrapFoot.jsp"></jsp:include>
</html>