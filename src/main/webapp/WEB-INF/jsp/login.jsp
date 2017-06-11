<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<html>
<head>
<title>Login Page</title>
<style>
.error {
	padding: 15px;
	margin-bottom: 20px;
	border: 1px solid transparent;
	border-radius: 4px;
	color: #a94442;
	background-color: #f2dede;
	border-color: #ebccd1;
	text-align: center;
}

.msg {
	padding: 15px;
	margin-bottom: 20px;
	border: 1px solid transparent;
	border-radius: 4px;
	color: #31708f;
	background-color: #d9edf7;
	border-color: #bce8f1;
	align-content: center;
	text-align: center;
}

#login-box {
	width: 400px;
	padding: 20px;
	margin: 100px auto;
	background: #ffffff;
	-webkit-border-radius: 2px;
	-moz-border-radius: 2px;
	border: 1px solid #000000;
	align-content: center;
	font-family: "Roboto", sans-serif;
}

#login-page {
  width: 500px;
  padding: 8% 0 0;
  margin: auto;
  align-content: center;
  background: #2F323E;
  font-family: "Roboto", sans-serif;
}

#form {
  position: relative;
  z-index: 1;
  background: #FFFFFF;
  max-width: 360px;
  margin: 0 auto 100px;
  padding: 45px;
  text-align: center;
  box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
}
#form input {
  font-family: "Roboto", sans-serif;
  outline: 0;
  background: #f2f2f2;
  width: 100%;
  border: 0;
  margin: 0 0 15px;
  padding: 15px;
  box-sizing: border-box;
  font-size: 18px;
}
#form button {
  font-family: "Roboto", sans-serif;
  text-transform: uppercase;
  outline: 0;
  background: #F33155;
  width: 100%;
  border: 0;
  padding: 15px;
  color: #FFFFFF;
  font-size: 18px;
  -webkit-transition: all 0.3 ease;
  transition: all 0.3 ease;
  cursor: pointer;
}
#form button:hover,.form button:active,.form button:focus {
  background: #F55A77;
}

</style>
</head>
<body onload='document.loginForm.username.focus();' id="login-page">

	<div>
		<c:if test="${not empty error}">
			<div class="error">${error}</div>
		</c:if>
		<c:if test="${not empty msg}">
			<div class="msg">${msg}</div>
		</c:if>

		<form name='loginForm' id="form"
			action="<c:url value='/j_spring_security_check' />" method='POST'>

			 <input type="text" placeholder="username" name ="username"/>
      <input type="password" placeholder="password" name ="password"/>
      <button>login</button>

			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />

		</form>
	</div>

</body>
</html>