<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
<html>  
<jsp:include page="../jsp/header.jsp" />
<body>
<div class="row affix-row">
    <div class="col-sm-3 col-md-2 affix-sidebar">
	<jsp:include page="../jsp/adminmenu.jsp" />
	</div>
	<div class="col-sm-9 col-md-10">
	<div class="container">
		<h2>Edit product</h2>  
		<form:form method="post" action="">
			
			<form:hidden path="id" />
			<spring:bind path="name">
				<div class="form-group">
						<label class="col-sm-2 control-label">Name</label>
						<div class="col-sm-10">
							<form:input path="name" type="text" class="form-control " id="name" placeholder="Name" />
							<form:errors path="name" class="control-label" />
						</div>
				</div>
			</spring:bind>
			<br/>
				<spring:bind path="category">
				<div class="form-group">
						<label class="col-sm-2 control-label">Category</label>
						<div class="col-sm-10">
							<form:input path="category" type="text" class="form-control " id="category" placeholder="category" />
							<form:errors path="category" class="control-label" />
						</div>
				</div>
			</spring:bind>	
				<spring:bind path="price">
				<div class="form-group">
						<label class="col-sm-2 control-label">Price</label>
						<div class="col-sm-10">
							<form:input path="price" type="text" class="form-control " id="price" placeholder="price" />
							<form:errors path="price" class="control-label" />
						</div>
				</div>
			</spring:bind>	
				<spring:bind path="description">
				<div class="form-group">
						<label class="col-sm-2 control-label">Description</label>
						<div class="col-sm-10">
							<form:input path="description" type="text" class="form-control " id="description" placeholder="description" />
							<form:errors path="description" class="control-label" />
						</div>
				</div>
			</spring:bind>
			
			<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="submit" class="btn-lg btn-primary pull-right">Save changes</button>
					</div>
				</div>
			</form:form>  
  </div>
  </div>
  </div>
 
   <%--  <table>  
    <tr>  
        <td><form:label path="name">Name</form:label></td>  
        <td><form:input path="name" /></td>   
    </tr>  
    <tr>  
        <td><form:label path="category">Category</form:label></td>  
        <td><form:input path="category" /></td>  
    </tr>  
    <tr>  
        <td><form:label path="price">Price</form:label></td>  
        <td><form:input path="price" /></td>  
    </tr>  
    <tr>  
        <td><form:label path="description">Description</form:label></td>  
        <td><form:input path="description" /></td>  
    </tr>  
    <tr>  
        <td colspan="2">  
            <input type="submit" value="Add Product"/>  
        </td>  
    </tr>  
</table>     --%>
      

</body>  
</html>  