<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     <%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Login</title>
</head>
<body>
	<h1>Customer Login</h1>
		<form action="" method="post">
			<input type = "text" name="userName" placeholder="enter user name"/></br></br>
			<input type = "password" name="password" placeholder="enter user password"/></br></br>
			<input type="submit" name="login" value="Login"/><a href ="index.html"> Go to HomePage</a>
		</form>
		
			<c:if test="${param.login!= null}">
				<c:choose>
					  <c:when test="${empty param.userName}">
					  	<h2>Please enter UserName</h2>
					  </c:when>
				  
					  <c:when test="${empty param.password}">
					  	<h2>Please enter Password</h2>
					  </c:when>
					  
					  <c:when test="${param.userName=='admin' && param.password=='admin'}">
					  	<font size="5" color='red'> You are not admin! bro you are logging in from customer :)</font> 
					  </c:when>
				  
				  <c:otherwise>
						<sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/project_phoenix"
                           user="root"  password="12345"/>
 
        				<sql:query dataSource="${dbsource}" var="result">
           					 SELECT * from users WHERE user_name="${param.userName}" AND user_password="${param.password}"
       					 </sql:query>
       					 
       					 <c:choose>
							<c:when test="${result.rowCount > 0 }">
								<c:forEach var="col" items="${result.rows}">
									<c:redirect url="customer_page.jsp" >
										<c:param name="userID" value="${col.user_id}"></c:param>
										<c:param name="userName" value="${col.user_name}"></c:param>
									</c:redirect>
								</c:forEach>
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

