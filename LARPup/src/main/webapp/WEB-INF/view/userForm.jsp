<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:include page="../components/bootstrapHead.jsp"></jsp:include>
<head>
<meta charset="UTF-8">
<title>User Form</title>
</head>
<body>
	I MADE IT!!! WELCOME TO THE USERRFORM JSP!!!
	<br>

	<form action="createUser.do">
		<div class="form-group">
			<label for="userFirstName">First name</label> <input type="firstName"
				class="form-control" id="userFirstName" placeholder="First Name">
		</div>

		<div class="form-group">
			<label for="userLastName">Last name</label> <input type="lastName"
				class="form-control" id="userLastName" placeholder="Last Name">
		</div>

		<div class="form-row">
			<div class="form-group col-md-6">
				<label for="inputEmail4">Email</label> <input type="email"
					class="form-control" id="inputEmail4"
					placeholder="name@example.com">
			</div>

			<div class="form-group col-md-6">
				<label for="inputPassword4">Password</label> <input type="password"
					class="form-control" id="inputPassword4" placeholder="Password">
			</div>

		</div>
		<div class="form-group">
			<label for="inputAddress">Address</label> <input type="text"
				class="form-control" id="inputAddress" placeholder="1234 Main St">
		</div>

		<div class="form-row">
			<div class="form-group col-md-6">
				<label for="inputCity">City</label> <input type="text"
					class="form-control" id="inputCity">
			</div>
			<div class="form-group col-md-4">
				<label for="inputState">State</label> <select id="inputState"
					class="form-control">
					<option selected>Colorado</option>
					<option></option>
				</select>
			</div>

			<div class="form-group col-md-2">
				<label for="inputZip">Zip</label> <input type="text"
					class="form-control" id="inputZip">
			</div>
		</div>
		<div class="form-group">

			<label for="exampleFormControlTextarea1">Biography</label>
			<textarea class="form-control" id="exampleFormControlTextarea1"
				rows="3"></textarea>
			<br>
			<button type="submit" class="btn btn-primary">Sign in</button>
		</div>

</form>

		<a href="/home.do">BACK TO HOME</a>
</body>
<jsp:include page="../components/bootstrapFoot.jsp"></jsp:include>
</html>