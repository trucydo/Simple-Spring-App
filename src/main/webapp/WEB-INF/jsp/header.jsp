<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<head>
<title>Spring MVC Form Handling Example</title>
    <!--Font awesome icon -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<spring:url value="/resources/core/css/bootstrap.min.css"
	var="bootstrapCss" />
<link href="${bootstrapCss}" rel="stylesheet" />
</head>

<spring:url value="/" var="urlHome" />
<spring:url value="/addProduct" var="urlAddProduct" />

<nav class="navbar navbar-inverse ">
	<div class="container">
		<div class="navbar-header">
			<div class="navbar-brand"">Header</div>
		</div>
		<div id="navbar">
			<ul class="nav navbar-nav navbar-right">
				
			</ul>
		</div>
	</div>
</nav>