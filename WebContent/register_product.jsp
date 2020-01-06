<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register Product</title>
</head>
<body>

<%--  EVERY TIME PAGE RELODES THIS WILL QUERY DATABASE TO GET ALL THE users AND products --%>
<div>
	<sql:setDataSource var="dbCon" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/project_phoenix" user="root" password="12345"></sql:setDataSource>
	<sql:query dataSource="${dbCon}" var="products">
	select * from products;
	</sql:query>
</div>

<div>
	<sql:setDataSource var="dbCon" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/project_phoenix" user="root" password="12345"></sql:setDataSource>
	<sql:query dataSource="${dbCon}" var="users">
	select * from users;
	</sql:query>
</div>

<%--  REGISTER PRODUCT FORM --%>
<h2>Register Product</h2>
<form action="" method="POST">
	Please Enter User ID : <select name="userID">
		<c:forEach var="col" items="${users.rows}">
			<option><c:out value="${col.user_id}"></c:out></option>
		</c:forEach>
	</select><br/><br/>
	Please Select Your Product : <select name="productID">
		<c:forEach var="col" items="${products.rows}">
			<option><c:out value="${col.product_id}"></c:out></option>
		</c:forEach>
	</select><br/><br/>
	Please select Purchase Date : <input type="date" name="purchaseDate" placeholder="Please enter date of purchase"/></br><br/>
	<input type="submit" name="register" value="Register"/><a href ="index.html"> Go to HomePage</a>
</form>

<c:if test="${param.register!= null}">
			<c:choose>
				  <c:when test="${empty param.purchaseDate}">
				  	<h2>Please enter Purchase Date</h2>
				  </c:when>
				  
				  <c:otherwise>
				  	<c:catch var="e">
						<sql:setDataSource var="dbCon" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/project_phoenix" user="root" password="12345"></sql:setDataSource>
						<sql:update dataSource="${dbCon}" var="result">
							INSERT INTO registered_products (registered_product_userid,registered_product_productid,registered_product_date) VALUES ('${param.userID}','${param.productID}','${param.purchaseDate}')	
						</sql:update>
						
						
						<c:choose>
							<c:when test="${result>=1}">
						  		<font size="5" color='green'> Congratulations ! Product Registered successfully.</font> 
							</c:when>
							<c:otherwise>
								<font size="5" color='red'> Please try again!.</font> 
							</c:otherwise>
						</c:choose>
					</c:catch>
					
					<c:if test="${e != null }">
						<font size="5" color='red'> This product is already registered with you.</font>
					</c:if>		
				  </c:otherwise>
			</c:choose>
		</c:if>
</body>
</html>