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
	<h1>Update User</h1>
	
	<form action="" method="post">
		<input type="text" name="userID" value="${param.user_id}" readonly/></br></br>
		<input type="text" name="userName" value="${param.user_name }"/></br></br>
		<input type="text" name="password" value="${param.user_password }"/></br></br>
		<input type="text" name="contact" value="${param.user_contact_no }"/></br></br>
		<input type="text" name="address" value="${param.user_address }"/></br></br>
		<input type="submit" name="update" value="Update"/>
	</form>
	
		<c:if test="${param.update!= null}">
			<c:choose>
				  <c:when test="${empty param.userName}">
				  	<h2>Please enter UserName</h2>
				  </c:when>
				  
				  <c:when test="${empty param.password}">
				  	<h2>Please enter Password</h2>
				  </c:when>
				  
				   <c:when test="${empty param.contact}">
				  	<h2>Please enter Contact Number</h2>
				  </c:when>
				  
				   <c:when test="${empty param.address}">
				  	<h2>Please enter Address</h2>
				  </c:when>
				  
				  <c:otherwise>
						<sql:setDataSource var="dbCon" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/project_phoenix" user="root" password="12345"></sql:setDataSource>
						<sql:update dataSource="${dbCon}" var="result">
							 UPDATE users SET user_name=?,user_address=?,user_password=?,user_contact_no=?
					            WHERE user_id="${param.user_id}"
					            <sql:param value="${param.userName}" />
								<sql:param value="${param.address}" />
								<sql:param value="${param.password}" />
								<sql:param value="${param.contact}" />
						</sql:update>
						
						<c:choose>
							<c:when test="${result>=1}">
						  		<font size="5" color='green'> Congratulations ! User Registered successfully.</font>
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