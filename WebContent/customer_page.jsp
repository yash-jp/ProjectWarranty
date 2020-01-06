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
	<h2>Welcome <span style="color:blue">${param.userName}</span></h2>
	<a href ="index.html"> Go to Home</a><br/>
	
	<div>
		<button onclick="location.href='claim_product.jsp?userID=${param.userID}'" type="button">Claim Product</button>
	</div>
	
	
	<%--WE NEED TO SHOW PRODUCTS THIS USER HAS REGISTERED, WE NEED TO JOIN ALL THREE TABLES --%>
	
	<c:if test= "${param.successMessage != null }">
		<font size='5' color='green'>"${param.successMessage}"</font> 
	</c:if>
	<h2>Registered Products</h2>
		<div class="productInfo">
		<sql:setDataSource var="dbCon" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/project_phoenix" user="root" password="12345"></sql:setDataSource>
		<sql:query dataSource="${dbCon}" var="result">
			select u.user_name, p.product_id, p.product_name, rp.registered_product_date, rp.registered_product_status from users u JOIN registered_products rp ON u.user_id = rp.registered_product_userid 
			JOIN products p ON p.product_id = rp.registered_product_productid
			where u.user_id="${param.userID}"
		</sql:query>
		
	<table border="1">
		<c:forEach var="col" items="${result.rows}">
			<tr>
				<td><c:out value="${col.user_name}"></c:out></td>
				<td><c:out value="${col.product_id}"></c:out></td>
				<td><c:out value="${col.product_name}"></c:out></td>
				<td><c:out value="${col.registered_product_date}"></c:out></td>
				<td><c:out value="${col.registered_product_status}"></c:out></td>
			</tr>
		</c:forEach>
	</table>
</div>
</body>
</html>