<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container">
    <div class="row">
        <div class="col-md-3">
            <ul class="nav nav-pills nav-stacked admin-menu">
                <li class="active"><a href="../../../1412593BtSpring/admin/products" ><i class="fa fa-list-alt fa-fw"></i> Products</a></li>
                <li><a href="../../../1412593BtSpring/" ><i class="fa fa-book fa-fw"></i> User</a></li>
                <sec:authorize access="hasRole('ROLE_USER')">
					<!-- For login user -->
					<c:url value="/j_spring_security_logout" var="logoutUrl" />
					<form action="${logoutUrl}" method="post" id="logoutForm">
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />
					</form>
					<script>
						function formSubmit() {
							document.getElementById("logoutForm").submit();
						}
					</script>
			
					<c:if test="${pageContext.request.userPrincipal.name != null}">
						<li><a href="javascript:formSubmit()" ><i class="fa fa-sign-out fa-fw"></i> Sign Out</a></li>
					</c:if>
				</sec:authorize>
            </ul>
        </div>
    </div>
</div>