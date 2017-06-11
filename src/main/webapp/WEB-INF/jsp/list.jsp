<%@ page session="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">

<jsp:include page="../jsp/header.jsp" />


<body>
<div class="row affix-row">
    <div class="col-sm-3 col-md-2 affix-sidebar">
	<jsp:include page="../jsp/adminmenu.jsp" />
	</div>
	<div class="col-sm-9 col-md-10">
	<div class="container">
		<c:if test="${not empty msg}">
			<div class="alert alert-${css} alert-dismissible" role="alert">
				<button type="button" class="close" data-dismiss="alert" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<strong>${msg}</strong>
			</div>
		</c:if>
		<div class="row">
		<div class="col-sm-9 col-md-9">

		</div>
		<div class="col-sm-3 col-md-3">
			<spring:url value="/admin/product" var="addUrl" />
			<spring:url value="/admin/deleteMany" var="DeleteMUrl" /> 			
			<button class="btn btn-primary" onclick="location.href='${addUrl}'">Add new product</button>
			<button class="btn btn-danger" onclick="location.href='${DeleteMUrl}'">Delete products</button>
		</div>
		<h2>All Products</h2>

		<table class="table table-striped">
			<thead>
				<tr>
					<th></th>
					<th>ID</th>
					<th>Name</th>
					<th>Category</th>
					<th>Price</th>
					<th>Description</th>
					<th>Edit</th>
					<th>Delete</th>
				</tr>
			</thead>
			<c:if test="${not empty productList}">
				<c:forEach var="product" items="${productList}"  >
					<tr>
						<td>
							<input type="checkbox" path="product.isSelected"/>
						</td>
						<td>${product.id}</td>
						<td>${product.name}</td>
						<td>${product.category}</td>
						<td>${product.price}</td>
						<td>${product.description}</td>
						<td>
							<spring:url value="/admin/edit/id=${product.id}" var="updateUrl" />
							<button class="btn btn-primary" onclick="location.href='${updateUrl}'">Edit</button>
							
						</td>
						<td>
							<spring:url value="/admin/delete/id=${product.id}" var="deleteUrl" /> 
							
							<button class="btn btn-danger" onclick="location.href='${deleteUrl}'">Delete</button></td>
						</td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
	</div>
		<jsp:include page="../jsp/footer.jsp" />
	</div>
</div>

</body>
</html>
<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Product List</title>
<!--Font awesome icon -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- Bootstrap Core CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    
    <!-- Menu CSS -->
    <link href="../plugins/bower_components/sidebar-nav/dist/sidebar-nav.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/resources/css/style.css" type="text/css" />
    <style>
#wrapper {
    width: 100%
}
.navbar-header {
    width: 100%;
    background: #3c4451;
    border: 0
}
.navbar-default {
    border: 0
}
.navbar-header .navbar-toggle {
    float: none;
    padding: 0 15px;
    line-height: 60px;
    border: 0;
    color: rgba(255, 255, 255, .5);
    margin: 0;
    display: inline-block;
    border-radius: 0
}
.navbar-header .navbar-toggle:focus,
.navbar-header .navbar-toggle:hover {
    background: rgba(0, 0, 0, .3);
    color: #fff
}

@media (min-width: 768px) {
    #page-wrapper {
        position: inherit;
        margin: 0 0 0 240px
    }
    .navbar-default {
        position: relative;
        width: 100%;
        top: 0
    }
    .sidebar {
        z-index: 1001;
        position: fixed;
        width: 240px;
        padding-top: 0;
        height: 100%;
        transition: .05s ease-in
    }
    .sidebar:hover {
        width: 240px
    }
    .fix-header .navbar-static-top {
        position: fixed;
        z-index: 1010
    }
    .fix-header #page-wrapper {
        margin-top: 60px
    }
}
.navbar-static-top {
        position: fixed;
        top: 0;
        width: 100%
}

.top-left-part {
    width: 240px;
    float: left;
    border-right: 1px solid rgba(0, 0, 0, .08)
}
.top-left-part a {
    color: #fff;
    line-height: 59px;
    font-size: 18px;
    padding-left: 10px;
    text-transform: uppercase
}
.top-left-part .light-logo {
    display: none
}
.m-b-0 {
    margin-bottom: 0!important
}
.pull-right {
    float: right
}
.app-search {
    position: relative;
    margin: 0
}
.form-control {
    background-color: #fff;
    border: 1px solid #e4e7ea;
    border-radius: 0;
    box-shadow: 4px;
    color: #565656;
    height: 38px;
    max-width: 100%;
    padding: 7px 12px;
    transition: all 300ms linear 0s
}
.form-control:focus {
    box-shadow: none;
    border-color: #263238
}
.sidebar {
    overflow-y: auto
}
.sidebar .sidebar-nav.navbar-collapse {
    padding-left: 0;
    padding-right: 0
}
.sidebar .fa-fw {
    width: 20px;
    text-align: center!important;
    display: inline-block;
    font-style: normal;
    font-weight: 500;
    margin-right: 7px;
    font-size: 16px;
    vertical-align: middle
}
.sidebar .mdi {
    font-size: 21px
}
.sidebar .sidebar-head {
    padding: 4px 20px;
    width: 240px;
    position: fixed;
    z-index: 10;
    left: 0;
    top: 0
}
.sidebar .sidebar-head h3 {
    color: #fff;
    font-weight: 400
}
.sidebar .sidebar-head h3 i {
    font-size: 20px
}
.sidebar:hover .sidebar-head {
    width: 240px
}
.sidebar .label {
    font-size: 10px;
    border-radius: 60px;
    padding: 6px 8px;
    min-width: 30px;
    height: 20px;
    margin-top: 0
}
.sidebar #side-menu .user-pro .img-circle {
    width: 30px;
    margin-right: 10px
}
.sidebar #side-menu .user-pro>a {
    padding-left: 15px
}
.sidebar #side-menu .user-pro ul li a {
    padding-left: 25px
}
.sidebar #side-menu .user-pro .nav-second-level li i {
    margin-right: 10px
}
#side-menu {
    overflow: hidden
}
.sidebar .sidebar-search {
    padding: 15px
}
#side-menu li.active>a {
    background: rgba(0, 0, 0, 0)
}
#side-menu li a {
    color: #97999f;
    width: 240px
}
#side-menu li a:focus {
    background: rgba(0, 0, 0, 0)
}
#side-menu li.devider {
    margin: 7px 0;
    border-top: 1px solid rgba(120, 130, 140, .13)
}
#side-menu>li>a {
    padding: 15px 35px 15px 20px;
    display: block
}
#side-menu>li>a:focus,
#side-menu>li>a:hover {
    background: rgba(0, 0, 0, .1)
}
#side-menu>li>a.active {
    color: #2cabe3
}
#side-menu ul>li>a:hover {
    color: #2cabe3;
    background: 0 0
}
#side-menu ul>li>a.active {
    color: #2cabe3
}
.sidebar .arrow {
    position: absolute;
    right: 20px;
    top: 17px
}
.sidebar .nav-second-level .arrow {
    right: 20px;
    top: 17px
}
.sidebar .fa.arrow:before {
    content: "\f105"
}
.sidebar .active>a>span>.fa.arrow:before {
    content: "\f107"
}
.sidebar .nav-second-level li,
.sidebar .nav-third-level li {
    border-bottom: none!important
}
.sidebar .nav-second-level li a {
    padding: 14px 10px 14px 40px
}
.sidebar .nav-third-level li a {
    padding-left: 60px
}
.content-wrapper .nicescroll-rails {
    display: none!important
}
#page-wrapper {
        margin-left: 0
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
.container-fluid {
    padding-left: 25px;
    padding-right: 25px;
    padding-bottom: 15px
}
.bg-title .breadcrumb {
        float: left;
        margin-top: 100px;
        margin-bottom: 10px
    }

    </style>
</head>
<body>
	    <!-- ============================================================== -->
		<!-- Wrapper -->
		<!-- ============================================================== -->
		<div id="wrapper">
		    <!-- ============================================================== -->
		    <!-- Topbar header - style you can find in pages.scss -->
		    <!-- ============================================================== -->
		    <nav class="navbar navbar-default navbar-static-top m-b-0">
		        <div class="navbar-header">
		            <div class="top-left-part">
		            </div>
		             <div class="nav navbar-top-links navbar-right pull-right">
		                   1412593
		               </div>
		        </div>
		        <!-- /.navbar-header -->
		        <!-- /.navbar-top-links -->
		        <!-- /.navbar-static-side -->
		    </nav>
		    <!-- End Top Navigation -->
		    <!-- ============================================================== -->
		    <!-- Left Sidebar - style you can find in sidebar.scss  -->
		    <!-- ============================================================== -->
		    <div class="navbar-default sidebar" role="navigation">
		        <div class="sidebar-nav slimscrollsidebar">
		            <div class="sidebar-head">
		                <h4><span class="fa-fw open-close"><i class="ti-close ti-menu"></i></span> <span class="hide-menu">Navigation</span></h4>
		            </div>
		            <ul class="nav" id="side-menu">
		                <li style="padding: 70px 0 0;">
		                    <a href="/admin" class="waves-effect {{active_dashboard}}"><i class="fa fa-clock-o fa-fw" aria-hidden="true"></i>Dashboard</a>
		                </li>
		                <li>
		                    <a href="/admin/products" class="waves-effect {{active_product}}"><i class="fa fa-book fa-fw" aria-hidden="true"></i>Products</a>
		                </li>
		                <li>
		                    <a href="/logout" class="waves-effect"><i class="fa fa-sign-out fa-fw" aria-hidden="true"></i>Sign Out</a>
		                </li>
		            </ul>
		        </div>
		    </div>
		    <!-- ============================================================== -->
		    <!-- End Left Sidebar -->
		    <!-- ============================================================== -->
		   </div>
	<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row bg-title">
            <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                <h4 class="page-title">Products</h4> </div>
            <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                <a href="/admin/products/add" class="btn btn-danger pull-right m-l-20 hidden-xs hidden-sm waves-effect waves-light">Add new product</a>
                <ol class="breadcrumb">
                    <li><a href="/admin">Dashboard</a></li>
                    <li class="active">Products</li>
                </ol>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        
	<center>
		<b>Product List</b>
		<c:if test="${not empty productList}">
			<table border="1">
				<tr>
					<td class="heading">ID</td>
					<td class="heading">Name</td>
					<td class="heading">Category</td>
					<td class="heading">Price</td>
					<td class="heading">Description</td>
				</tr>
				<c:forEach var="product" items="${productList}"  >
					<tr>
						<td>${product.id}</td>
						<td>${product.name}</td>
						<td>${product.category}</td>
						<td>${product.price}</td>
						<td>${product.description}</td>
						<td><a href="edit/id=${product.id}">Edit</a></td>
						<td><a href="delete/id=${product.id}">Delete</a></td>
					</tr>
				</c:forEach>
				<tr><td colspan="7"><a href="product">Add New Product</a>
			</table>
		</c:if>
	</center>
	</div>
    <!-- /.container-fluid -->
    <footer class="footer text-center"> This is a footer :))</footer>
</div>
</body>
</html>
 --%>