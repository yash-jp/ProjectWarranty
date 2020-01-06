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
	<h1>Update Product</h1>
	
	<form action="" method="post">
		<input type="text" name="productID" value="${param.product_id}" readonly/></br></br>
		<input type="text" name="productName" value="${param.product_name }"/></br></br>
		<input type="text" name="productColor" value="${param.product_color }"/></br></br>
		<input type="submit" name="update" value="Update"/>
	</form>
	
		<c:if test="${param.update!= null}">
			<c:choose>
				  <c:when test="${empty param.productName}">
				  	<h2>Please enter Product Name</h2>
				  </c:when>
				  
				  <c:when test="${empty param.productColor}">
				  	<h2>Please enter Product Color</h2>
				  </c:when>
				  
				  <c:otherwise>
						<sql:setDataSource var="dbCon" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/project_phoenix" user="root" password="12345"></sql:setDataSource>
						<sql:update dataSource="${dbCon}" var="result">
							 UPDATE products SET product_name=?,product_color=?
					            WHERE product_id="${param.productID}"
					            <sql:param value="${param.productName}" />
								<sql:param value="${param.productColor}" />
						</sql:update>
						
						<c:choose>
							<c:when test="${result>=1}">
						  		<font size="5" color='green'> Congratulations ! Product has been updated successfully.</font>
						  		<a href="admin_page.jsp">Go Back</a>
						  		<a href="index.html">Home</a> 
							</c:when>
							<c:otherwise>
								<font size="5" color='red'> Please try again!.</font> 
							</c:otherwise>
						</c:choose>			
				  </c:otherwise>
			</c:choose>
		</c:if>
</body>
</html>