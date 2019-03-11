<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/components/bootstrapHead.jsp"></jsp:include>
<head>
<meta charset="UTF-8">
<title>User Form</title>
</head>
<body>
	<div class="container">
		I MADE IT!!! WELCOME TO THE USERRFORM JSP!!! <br>

		<form action="createUserForm.do" method="POST" name="userid">
			<form class="needs-validation" novalidate>
			
			<div class="form-row">
				<div class="col-md-2 col-3">
					<label for="userFirstName">First name</label> <input
						type="firstName" class="form-control" id="userFirstName"
						placeholder="First Name" required>
					<div class="valid-feedback">Looks good!</div>
				</div>

				<div class="col-md-2 mb-3">
					<label for="userLastName">Last name</label> <input type="lastName"
						class="form-control" id="userLastName" placeholder="Last Name"
						required>
						<div class="valid-feedback">Looks good!</div>
				</div>


			<div class="col-md-2 mb-3">
				<label for="validationCustomUsername">Username</label>
				<div class="input-group">
					<div class="input-group-prepend">
						<span class="input-group-text" id="inputGroupPrepend">@</span>
					</div>
					<input type="text" class="form-control"
						id="validationCustomUsername" placeholder="Username"
						aria-describedby="inputGroupPrepend" required>
					<div class="invalid-feedback">Please choose a username.</div>
				</div>
			</div>
	</div>






	<div class="form-row">
		<div class="form-group col-md-4">
			<label for="inputEmail">Email</label> <input type="email"
				class="form-control" id="inputEmail" placeholder="name@example.com"
				required>
		</div>

		<div class="form-group col-md-4">
			<label for="inputPassword">Password</label> <input type="password"
				class="form-control" id="inputPassword" placeholder="Password"
				required>
		</div>

	</div>
	<div class="form-group col-md-6">
		<label for="inputAddress">Address</label> <input type="text"
			class="form-control" id="inputAddress" placeholder="1234 Main St"
			required>
	</div>

	<div class="form-row">
		<div class="form-group col-md-3">
			<label for="inputCity">City</label> <input type="text"
				class="form-control" id="inputCity" placeholder="City" required>
		</div>

		<div class="form-group col-md-3">
			<label for="inputState">State</label> <select id="inputState"
				class="form-control" placeholder="State" required>
				<option>SELECT</option>
				<option>Colorado</option>
				<option>California</option>
				<option>Alabama</option>
				<option>Delaware</option>
				<option>Florida</option>
			</select>
		</div>

		<div class="form-group col-md-2">
			<label for="inputZip">Zip</label> <input type="text"
				class="form-control" id="inputZip" placeholder="Zip" required>
		</div>
	</div>
	<div class="form-group col-md-8">

		<label for="inputBiography">Biography</label>
		<textarea class="form-control" id="inputBiography" rows="3"></textarea>
		<br>
		<button type="submit" class="btn btn-primary">Submit</button>
	</div>

	</form>
	</form>

	<a href="/home.do">BACK TO HOME</a>
	</div>
</body>
<jsp:include page="/WEB-INF/components/bootstrapFoot.jsp"></jsp:include>
</html>