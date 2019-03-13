<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/components/bootstrapHead.jsp"></jsp:include>
<head>
<meta charset="UTF-8">
<title>User Form</title>
<link rel="stylesheet" href="/css/user_page.css">
</head>
<body>
	<jsp:include page="/WEB-INF/components/navbar.jsp"></jsp:include>
	
	<form>
	<div class="container">
	
		<h1>Create Your Account</h1>
		<br>

		<form:form action="${action}" method="POST" modelAttribute="inputDTO">

			<div class="form-row">
				<div class="col-md-2 col-3">

					<form:label path="firstName">First name</form:label>
					<form:input type="text" path="firstName" class="form-control"
						value="${user.firstName}" placeholder="First name"
						required="required" />

					<div class="valid-feedback">Looks good!</div>
				</div>

				<div class="col-md-2 mb-3">
					<form:label path="lastName">Last name</form:label>
					<form:input type="text" path="lastName" class="form-control"
						value="${user.lastName}" placeholder="Last name"
						required="required" />
					<div class="valid-feedback">Looks good!</div>
				</div>


				<div class="col-md-2 mb-3">
					<form:label path="nickname">Nickname</form:label>
					<div class="input-group">
						<div class="input-group-prepend"></div>
						<form:input type="text" path="nickname" class="form-control"
							value="${user.nickname}" placeholder="Nickname"
							aria-describedby="inputGroupPrepend" required="required" />
						<div class="invalid-feedback">Invalid! Please choose a
							username.</div>
					</div>
				</div>
			</div>

			<div class="form-row">
				<div class="form-group col-md-4">
					<form:label path="email">Email</form:label>
					<form:input type="email" path="email" class="form-control"
						value="${user.email}" placeholder="email" required="required" />
				</div>

				<div class="form-group col-md-4">
					<form:label path="password">Password</form:label>
					<form:input type="password" path="password" class="form-control"
						value="${user.password }" placeholder="Password"
						required="required" />
				</div>

			</div>
			<div class="form-row">
				<div class="form-group col-md-4">
					<form:label path="birthDate">Birthday</form:label>
					<form:input type="date" path="birthDate" class="form-control"
						value="${user.birthDate}" />
				</div>
			</div>

			<div class="form-row">
				<div class="form-group-a col-md-6">
					<form:label path="street">Street</form:label>
					<form:input type="text" path="street" class="form-control"
						value="${user.address.street}" placeholder="New address"
						required="required" />
				</div>
			</div>

			<div class="form-row">
				<div class="form-group-a col-md-3">
					<form:label path="city">City</form:label>
					<form:input type="text" name="city" path="city"
						class="form-control" value="${user.address.city }"
						placeholder="City" required="required" />
				</div>

				<div class="form-group-a col-md-3">
					<form:label path="state">State</form:label>
					<form:select id="inputState" path="state" class="form-control"
						value="${user.address.state }" required="required">
						<!-- <option>SELECT</option> -->
						<option value="CO">CO</option>
						<option value="CA">CA</option>
						<option value="AL">AL</option>
						<option value="DE">DE</option>
						<option value="FL">FL</option>
						<option value="NC">NC</option>
					</form:select>
				</div>
				<div class="form-group-a col-md-2">
					<form:label path="zipcode">Zip</form:label>
					<form:input type="text" path="zipcode" class="form-control"
						value="${user.address.zipcode }" placeholder="Zipcode"
						required="required" />
				</div>
			</div>
			<br>
			<br>


			<button type="submit" class="btn btn-primary">Sign Up</button>
			<br>
			<br>

		</form:form>
		<form class="form-inline my-2 my-lg-0" action="/home.do/" method="GET">
			<button class="btn btn-light" type="submit">Go Home</button>
		</form>

	</div>
		</form>

</body>
<jsp:include page="/WEB-INF/components/bootstrapFoot.jsp"></jsp:include>
</html>