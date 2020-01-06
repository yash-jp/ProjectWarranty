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
	<h2>SEARCH OR Update USER</h2>
	<a href ="admin_page.jsp"> Go back</a><br/>
		<form action="" method="post">
			<input type="text" name="userID" placeholder="Please enter user ID"/>
			<input type="submit" name="search" value="search"/>
		</form>
		
		<c:if test="${param.search!= null}">
				<c:choose>
					  <c:when test="${empty param.userID}">
					  	<h2>Please enter UserID</h2>
					  </c:when>
				  
				  <c:otherwise>
						<sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/project_phoenix"
                           user="root"  password="12345"/>
 
        				<sql:query dataSource="${dbsource}" var="result">
           					 SELECT * from users WHERE user_id="${param.userID}"
       					 </sql:query>
       					 
       					  <c:choose>
							<c:when test="${result.rowCount > 0 }">
								<c:redirect url="update_user.jsp">
									 <c:forEach var="col" items="${result.rows}">
												<c:param name="user_id" value="${col.user_id}"/>
												<c:param name="user_name" value="${col.user_name}"/>
												<c:param name="user_password" value="${col.user_password}"/>
												<c:param name="user_address" value="${col.user_address}"/>
												<c:param name="user_contact_no" value="${col.user_contact_no}"/>		
										</c:forEach>
								</c:redirect>
							</c:when>
							
							<c:otherwise>
								<font size="5" color='red'>No User Found, Please try again!</font> 
							</c:otherwise>
						</c:choose>			
				  </c:otherwise>
       			</c:choose>
       	</c:if>
</body>
</html>