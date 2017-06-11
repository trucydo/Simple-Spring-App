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
	<jsp:include page="../jsp/usermenu.jsp" />
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
		<h2>All Products</h2>

		<table class="table table-striped">
			<thead>
				<tr>
					<th>ID</th>
					<th>Name</th>
					<th>Category</th>
					<th>Price</th>
					<th>Description</th>
				</tr>
			</thead>
			<c:if test="${not empty productList}">
				<c:forEach var="product" items="${productList}"  >
					<tr>
						<td>${product.id}</td>
						<td>${product.name}</td>
						<td>${product.category}</td>
						<td>${product.price}</td>
						<td>${product.description}</td>
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