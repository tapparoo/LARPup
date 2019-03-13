<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<div class="container">
	<div class="row">
		<div class="col-2"></div>
		<div class="col-auto">
			<div class="row"><h1>ADMIN FORM</h1></div><br>
			<div class="row"><h5>View a User Profile</h5></div>
			<div class="row">
				<form action="/user/displayUser.do" method="GET">
				  <div class="input-group">
				      <div class="input-group-prepend">
					    <button class="btn btn-outline-secondary" type="submit">Go</button>
					  </div>
					  <select name="userId" class="custom-select" id="selectFromAllUsers">
					    <option selected>Choose...</option>
					    <c:forEach var="usr" items="${allUsers }">
						    <option value="${usr.id }">Id: ${usr.id } / Name: ${usr.firstName } ${usr.lastName } / Nickname: ${usr.nickname }</option>
					    </c:forEach>
					  </select>
				  </div>
				</form>
			</div>
		</div>
		<div class="col-2"></div>
	</div>

</div>

