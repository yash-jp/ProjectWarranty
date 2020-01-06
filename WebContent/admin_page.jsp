<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<button onclick="location.href='search_user.jsp'" type="button">Search OR Update User</button>
	<button onclick="location.href='search_product.jsp'" type="button">Search OR Update Product</button>
	<button onclick="location.href='recent_claims.jsp'" type="button">Recent Claims</button>
	<a href ="index.html"> Go to HomePage</a>
	
	<h2>Users</h2>
	<div class="adminInfo">
	<sql:setDataSource var="dbCon" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/project_phoenix" user="root" password="12345"></sql:setDataSource>
	<sql:query dataSource="${dbCon}" var="result">
	select * from users;
	</sql:query>
	<table border="1">
	<tr>
		<th><c:out value="USER ID"></c:out></th>
		<th><c:out value="USER Name"></c:out></th>
		<th><c:out value="USER Address"></c:out></th>
		<th><c:out value="USER Password"></c:out></th>
		<th><c:out value="USER Contact"></c:out></th>
	</tr>
	<c:forEach var="col" items="${result.rows}">
	<tr>
	<td><c:out value="${col.user_id}"></c:out></td>
		<td><c:out value="${col.user_name}"></c:out></td>
		<td><c:out value="${col.user_address}"></c:out></td>
		<td><c:out value="${col.user_password}"></c:out></td>
		<td><c:out value="${col.user_contact_no}"></c:out></td>
	</tr>
	</c:forEach>
	</table>
</div>


	<h2>Products</h2>
	<div class="productInfo">
	<sql:setDataSource var="dbCon" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/project_phoenix" user="root" password="12345"></sql:setDataSource>
	<sql:query dataSource="${dbCon}" var="result">
	select * from products;
	</sql:query>
	<table border="1">
	<tr>
		<th><c:out value="Product ID"></c:out></th>
		<th><c:out value="product Name"></c:out></th>
		<th><c:out value="product Color"></c:out></th>
	</tr>
	<c:forEach var="col" items="${result.rows}">
	<tr>
	<td><c:out value="${col.product_id}"></c:out></td>
		<td><c:out value="${col.product_name}"></c:out></td>
		<td><c:out value="${col.product_color}"></c:out></td>
	</tr>
	</c:forEach>
	</table>
	</div>
	
	<h2>Claims</h2>
	<div class="productClaims">
	<sql:setDataSource var="dbCon" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/project_phoenix" user="root" password="12345"></sql:setDataSource>
	<sql:query dataSource="${dbCon}" var="result">
		select * from registered_products
	</sql:query>
	<table border="1">
	<tr>
		<th><c:out value="userID"></c:out></th>
		<th><c:out value="productID"></c:out></th>
		<th><c:out value="Registration Date"></c:out></th>
		<th><c:out value="Status"></c:out></th>
		<th><c:out value="Claimed Times"></c:out></th>
		<th><c:out value="Claim"></c:out></th>
	</tr>
	<c:forEach var="col" items="${result.rows}">
	<tr>
	<td><c:out value="${col.registered_product_userid}"></c:out></td>
		<td><c:out value="${col.registered_product_productid}"></c:out></td>
		<td><c:out value="${col.registered_product_date}"></c:out></td>
		<td><c:out value="${col.registered_product_status}"></c:out></td>
		<td><c:out value="${col.registered_product_claimed_times}"></c:out></td>
		<td><c:out value="${col.registered_product_claimed_date}"></c:out></td>
	</tr>
	</c:forEach>
	</table>
	</div>
</body>
</html>