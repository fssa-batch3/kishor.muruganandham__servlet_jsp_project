<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Library Management</title>
<link rel="stylesheet" href="./assets/css/style.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css" />
<link rel="icon" href="./assets/images/book-half.svg"
	type="image/x-icon" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/4.1.1/crypto-js.min.js"
	integrity="sha512-E8QSvWZ0eCLGk4km3hxSsNmGWbLtSCSUcewDQPQWZF6pEU8GlT8a5fF32wOl1i8ftdMhssTrF/OhyGWwonTcXA=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment-with-locales.min.js"
	integrity="sha512-42PE0rd+wZ2hNXftlM78BSehIGzezNeQuzihiBCvUEB3CVxHvsShF86wBWwQORNxNINlBPuq7rG4WWhNiTVHFg=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/@emailjs/browser@3/dist/email.min.js"
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="./assets/js/script.js" defer></script>
<script src="./assets/js/validation.js" defer></script>
</head>
<body>
	<div class="container">
		<div class="tab-group">
			<button class="tab-btn active" onclick="activeTab(event,'sign-in')">
				Sign In</button>
			<button class="tab-btn" onclick="activeTab(event, 'sign-up')" id="sign-up-tab-btn">
				Sign Up</button>
		</div>

		<form id="sign-in" class="tab-content" style="height: fit-content"
			action="login" method="post">
			<c:if test="${not empty requestScope.errorMessage}">
				<div class="error-msg">
					<small style="display: block; font-size: 16px;">${errorMessage}</small>
				</div>
			</c:if>
			<c:if test="${not empty requestScope.successMessage}">
				<div class="error-msg">
					<small
						style="display: block; font-size: 16px; background-color: var(--success-green-shade); color: var(--success-green);">${successMessage}</small>
				</div>
			</c:if>
			<div class="title">
				<h1>Welcome Back</h1>
			</div>

			<div class="input-group">
				<label for="username-sign-in">Email address : <sup>*</sup></label>
				<div class="input-field">
					<input type="email" name="username" id="username-sign-in"
						placeholder="Enter your Email address" class="input"
						onblur="validateUsername('username-sign-in','.email-error')" autofocus="autofocus"
						required value="${loginEmail}" />
				</div>

				<div class="error-msg">
					<small class="email-error">Please Enter a Valid Email
						address</small>
				</div>
			</div>

			<div class="input-group">
				<label for="password-sign-in">Password : <sup>*</sup></label>
				<div class="input-field">
					<input type="password" name="password" id="password-sign-in"
						placeholder="Enter Your Password" class="input password" required
						value="${loginPassword}"
						onblur="validatePassword('password-sign-in','.sign-in-password-error')" />
					<i class="bi bi-eye-fill pass-visible sign-in"
						onclick="togglePasswordVisibility('password-sign-in','.pass-visible.sign-in')"></i>
				</div>
				<div class="error-msg">
					<small class="sign-in-password-error">Your password must be
						at least 8 characters <br /> Your password must contain at least
						one letter. <br /> Your password must contain at least one digit.<br />
					</small>
				</div>
			</div>
			<a href="./pages/user/forget_password.html" class="forget-password">Reset
				Password ?</a>
			<div class="input-group">
				<button class="submit" style="margin-top: 5px" type="submit">Submit</button>
			</div>
		</form>






		<form id="sign-up" class="tab-content" action="register" method="post">

			<c:if test="${not empty requestScope.signupErrorMessage}">
				<script>
				window.onload = function() {
			            const signUpButton = document.querySelector("#sign-up-tab-btn");
			            signUpButton.click();
			        };
		</script>
				<div class="error-msg">
					<small style="display: block; font-size: 16px;">${signupErrorMessage}</small>
				</div>
			</c:if>
			<div class="title">
				<h1>Register User</h1>
			</div>
			<div class="input-row">
				<div class="input-group">
					<label for="firstname-sign-up">Name : <sup>*</sup></label>
					<div class="input-field">
						<input type="text" name="name" id="firstname-sign-up"
							placeholder="Enter your Name " pattern="[A-Za-z\s]{2,32}"
							maxlength="32" value="${signupName}"
							title="Name Should contain minimum - 2 and maximum of 32 characters and cannot contain numbers"
							required autofocus="autofocus" />
					</div>
				</div>
				<div class="input-group">
					<label for="lastname-sign-up">Phone Number : <sup>*</sup></label>
					<div class="input-field">
						<input type="tel" name="mobileNo" id="lastname-sign-up"
							placeholder="Enter your Phone Number" maxlength="10"
							pattern="^[6-9]\d{9}$" value="${signupMobileNo}"
							title="Phone Number Should contain only 10 numbers and should start with 6,7,8,9"
							required />
					</div>
				</div>
			</div>
			<div class="input-row">
				<div class="input-group">
					<label for="role-sign-up">Gender : <sup>*</sup></label>
					<div class="input-field">
						<select name="gender" id="role-sign-up" class="input" required>
							<option value="M">Male</option>
							<option value="F">Female</option>
							<option value="O">Others</option>
						</select>
					</div>
				</div>

				<div class="input-group">
					<label for="DOB-sign-up">Date of Birth : <sup>*</sup></label>
					<div class="input-field">
						<input type="date" name="dob" class="datePicker" id="DOB-sign-up"
							value="${signupDob}" placeholder="Enter your Date of Birth"
							required />
					</div>
				</div>
			</div>
			<div class="input-row">
				<div class="input-group sm">
					<label for="email-sign-up">Email Address : <sup>*</sup></label>
					<div class="input-field">
						<input type="email" name="email" id="email-sign-up"
							placeholder="Enter your Email address"
							onblur="validateUsername('email-sign-up','.email-error-sign-up small')"
							required value="${signupEmail }" />
					</div>
					<div class="email-error-sign-up error-msg">
						<small>Please Enter a Valid Email address</small>
					</div>
				</div>
			</div>
			<div class="input-row">
				<div class="input-group">
					<label for="password-sign-up">Password : <sup>*</sup></label>
					<div class="input-field">
						<input type="password" name="password" id="password-sign-up"
							class="password" placeholder="Enter Your Password" maxlength="32"
							onblur="validatePassword('password-sign-up','.sign-up-password-error')"
							required value="${signupPassword}" /> <i
							class="bi bi-eye-fill pass-visible pass-sign-up"
							onclick="togglePasswordVisibility('password-sign-up','.pass-visible.pass-sign-up')"></i>
					</div>
					<div class="error-msg">
						<small class="sign-up-password-error">Seems like your
							password doesn't match.</small>
					</div>
				</div>
				<div class="input-group">
					<label for="confirm-password-sign-up">Confirm Password : <sup>*</sup>
					</label>
					<div class="input-field">
						<input type="password" name="confirm-password-sign-up"
							id="confirm-password-sign-up" placeholder="Enter Your Password"
							max="32"
							onblur="validateConfirmPassword('confirm-password-sign-up','.confirm-password-sign-up','password-sign-up')"
							required /> <i
							class="bi bi-eye-fill pass-visible confirm-sign-up"
							onclick="togglePasswordVisibility('confirm-password-sign-up','.pass-visible.confirm-sign-up')"></i>
					</div>
					<div class="error-msg">
						<small class="confirm-password-sign-up">Seems like your
							password doesn't match.</small>
					</div>
				</div>
			</div>
			<div class="input-group sm">
				<button class="submit" id="registerSubmit" type="submit">
					Submit</button>
			</div>
		</form>
	</div>

	<script type="text/javascript">
	const datePicker = document.querySelector(".datePicker");
	const minDate = moment().subtract(100, "year").format("YYYY-MM-DD");
	const maxDate = moment().subtract(10, "year").format("YYYY-MM-DD");

	datePicker.setAttribute("min", minDate);
	datePicker.setAttribute("max", maxDate);
    </script>
</body>
</html>
