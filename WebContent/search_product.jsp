<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>SEARCH OR Update Product</title>
</head>
<body>
	<h2>SEARCH OR Update Product</h2>
	<a href ="admin_page.jsp"> Go back</a><br/>
		<form action="" method="post">
			<input type="text" name="productID" placeholder="Please enter product ID"/>
			<input type="submit" name="search" value="search"/>
		</form>
		
		<c:if test="${param.search!= null}">
				<c:choose>
					  <c:when test="${empty param.productID}">
					  	<h2>Please enter Product ID</h2>
					  </c:when>
				  
				  <c:otherwise>
						<sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/project_phoenix"
                           user="root"  password="12345"/>
 
        				<sql:query dataSource="${dbsource}" var="result">
           					 SELECT * from products WHERE product_id="${param.productID}"
       					 </sql:query>
       					 
       					  <c:choose>
							<c:when test="${result.rowCount > 0 }">
								<c:redirect url="update_product.jsp">
									 <c:forEach var="col" items="${result.rows}">
												<c:param name="product_id" value="${col.product_id}"/>
												<c:param name="product_name" value="${col.product_name}"/>
												<c:param name="product_color" value="${col.product_color}"/>	
										</c:forEach>
								</c:redirect>
							</c:when>
							
							<c:otherwise>
								<font size="5" color='red'>No Product Found, Please try again!</font> 
							</c:otherwise>
						</c:choose>			
				  </c:otherwise>
       			</c:choose>
       	</c:if>
</body>
</html>