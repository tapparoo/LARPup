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
		<h1>Create Your Account</h1> <br>

		<form action="/user/createUserForm.do" method="POST" name="user">
			<form class="needs-validation" novalidate>
			
			<div class="form-row">
				<div class="col-md-2 col-3">
					<label for="userFirstName">First name</label> <input
						type="firstName" name="firstName"class="form-control" id="userFirstName"
						placeholder="First Name" required>
					<div class="valid-feedback">Looks good!</div>
				</div>

				<div class="col-md-2 mb-3">
					<label for="userLastName">Last name</label> <input type="lastName" name="lastName"
						class="form-control" id="userLastName" placeholder="Last Name"
						required>
						<div class="valid-feedback">Looks good!</div>
				</div>


			<div class="col-md-2 mb-3">
				<label for="validationCustomUsername">Nickname</label>
				<div class="input-group">
					<div class="input-group-prepend">
						<span class="input-group-text" id="inputGroupPrepend">@</span>
					</div>
					<input type="nickname" name="nickname"class="form-control"
						id="validationCustomUsername" placeholder="Nickname"
						aria-describedby="inputGroupPrepend" required>
					<div class="invalid-feedback">Invalid! Please choose a username.</div>
				</div>
			</div>
	</div>

	<div class="form-row">
		<div class="form-group col-md-4">
			<label for="inputEmail">Email</label> <input type="email" name="email"
				class="form-control" id="inputEmail" placeholder="name@example.com"
				required>
		</div>

		<div class="form-group col-md-4">
			<label for="inputPassword">Password</label> <input type="password" name="password"
				class="form-control" id="inputPassword" placeholder="Password"
				required>
		</div>

	</div>
	
	<div class="form-group col-md-4">
			<label for="inputBirthday">Birthday</label> <input type="date" name="birthDate"
				class="form-control" id="inputPassword" required>
		</div>
	
	<div class="form-group-a col-md-6">
		<label for="inputAddress">Address</label> <input type="text" name="address.street" value="${address.id}"
			class="form-control" id="inputAddress" placeholder="1234 Main St"
			required>
	</div>

	<div class="form-row">
		<div class="form-group-a col-md-3">
			<label for="inputCity">City</label> <input type="text" name="address.city" value="${address.id}"
				class="form-control" id="inputCity" placeholder="City" required>
		</div>

		<div class="form-group-a col-md-3">
			<label for="inputState">State</label> <select id="inputState" name="address.state" value="${address.id}"
				class="form-control" required>
				<option>SELECT</option>
				<option>Colorado</option>
				<option>California</option>
				<option>Alabama</option>
				<option>Delaware</option>
				<option>Florida</option>
				<option>North Carolina</option>
			</select>
		</div>
		
		<div class="form-group-a col-md-2">
			<label for="inputZip">Zip</label> <input type="text" name="address.zipcode" value="${address.id}"
				class="form-control" id="inputZip" placeholder="Zip" required>
		</div>
	</div>
	
	<div class="form-group col-md-8">

		<label for="inputBiography">Biography</label> 
		<textarea class="form-control" id="inputBiography" rows="3"></textarea>
		<br>
	</form>
	</form>
		<form action="/user/createUser.do" method="POST" name="user">
		<button type="submit" class="btn btn-primary">Submit</button>
		</form>
	
	</div>

	<div>
	<a href="/home.do">BACK TO HOME</a>
	</div>
</body>
<jsp:include page="/WEB-INF/components/bootstrapFoot.jsp"></jsp:include>
</html>