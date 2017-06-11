<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<html>
<head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="/resources/css/style.css" type="text/css" />
<title>Login Page</title>
<style>
.text-danger {
   color: #f33155
}
.text-muted {
    color: #8d9ea7
}

.error-box {
    height: 100%;
    position: fixed;
    top: 20%;
    width: 100%
}

.btn-danger:focus,
.btn-danger:hover {
    background: #f33155;
    opacity: .8;
    border: 1px solid #f33155
}
.btn-danger,
.btn-danger.disabled {
    background: #f33155;
    border: 1px solid #f33155
}

#wrapper {
    width: 100%
}

.error-body {
    padding-top: 5%
}
.error-body h1 {
    font-size: 210px;
    font-weight: 900;
    line-height: 210px
}

.text-center {
    text-align: center;
}
</style>
</head>
<body>

	<section id="wrapper" class="error-page">
	    <div class="error-box">
	        <div class="error-body text-center">
	            <h1 class="text-danger">403</h1>
	            <h3 class="text-uppercase">Access is denied!</h3>
	            <p class="text-muted m-t-30 m-b-30">YOU DO NOT HAVE PERMISSION TO ACCESS THIS PAGE</p>
	            <a href="../1412593BtSpring/login" class="btn btn-danger btn-rounded waves-effect waves-light m-b-40">Back to home</a> </div>
	    </div>
	</section>

</body>
</html>