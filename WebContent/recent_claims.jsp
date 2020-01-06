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
	
	<c:if test= "${param.successMessage!=null}">
		<font size="5" color='green'>"${param.successMessage}"</font> 
	</c:if>
	
	<c:if test="${param.approve!= null}">
		<sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/project_phoenix"
                           user="root"  password="12345"/>
       	 <sql:update dataSource="${dbsource}" var="claimed_status_updated">
           	UPDATE registered_products SET registered_product_status = 'approved'
           	WHERE registered_product_userid = "${param.userID}" AND registered_product_productid="${param.productID}"
       	</sql:update>
       	<c:choose>
			<c:when test="${claimed_status_updated>0}">
				<c:redirect url="recent_claims.jsp" >
					<c:param name="successMessage" value="User ${param.userID }'s claim has been approved"></c:param>
				</c:redirect>
				
				</c:when>
					<c:otherwise>
						<font size="5" color='red'> Please try again!.</font> 
				</c:otherwise>
	</c:choose>				
	</c:if>
	
	<c:if test="${param.disapprove!= null}">
		<sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/project_phoenix"
                           user="root"  password="12345"/>
                                 	 <sql:update dataSource="${dbsource}" var="claimed_status_updated">
           	UPDATE registered_products SET registered_product_status = 'rejected'
           	WHERE registered_product_userid = "${param.userID}" AND registered_product_productid="${param.productID}"
       	</sql:update>
       	<c:choose>
			<c:when test="${claimed_status_updated>0}">
				<c:redirect url="recent_claims.jsp" >
					<c:param name="successMessage" value="User ${param.userID }'s claim has been rejected"></c:param>
				</c:redirect>
				
				</c:when>
					<c:otherwise>
						<font size="5" color='red'> Please try again!.</font> 
				</c:otherwise>
	</c:choose>				
	</c:if>
	
	<h2>Claims</h2>
	<a href ="admin_page.jsp"> Go back</a><br/>
	<div class="productClaims">
	<sql:setDataSource var="dbCon" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/project_phoenix" user="root" password="12345"></sql:setDataSource>
	<sql:query dataSource="${dbCon}" var="result">
		select * from registered_products where registered_product_status LIKE 'pending'
	</sql:query>
	<table border="1">
	<tr>
		<th><c:out value="USER ID"></c:out></th>
		<th><c:out value="PRODUCT DATE"></c:out></th>
		<th><c:out value="CLAIM DATE"></c:out></th>
	</tr>
	<c:forEach var="col" items="${result.rows}">
	<tr>
	<form action="" method="post">
	<td><input type="text" name="userID" value="${col.registered_product_userid}"/></td>
			<td><input type="text" name="productID" value="${col.registered_product_productid}"/></td>
			<td><input type="text" name="claim_date" value="${col.registered_product_claimed_date}"></td>
			<td><input type = "submit" name="approve" value="Approve"/></td>
			<td><input type = "submit" name="disapprove" value="DisApprove"/></td>
		</form>
	</tr>
	</c:forEach>
	</table>
	</div>
</body>
</html>