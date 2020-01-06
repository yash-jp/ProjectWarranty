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
	<h2>Welcome <span style="color:blue">${param.userID}</span></h2>
	<h2>Claim Product</h2>
	
	<%-- QUERYING PRODUCTS WHICH HAS STATUS OF EITHER NOT CLAIMNED OR CLAIMED --%>
	<h3>You will only be able to see the products which you can claim, nothing to worry just you won't be able to see whose status is pending and which has been claimed 3 times</h3>
	<div class="productInfo">
		<sql:setDataSource var="dbCon" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/project_phoenix" user="root" password="12345"></sql:setDataSource>
		<sql:query dataSource="${dbCon}" var="products">
			select u.user_name, p.product_id, p.product_name, rp.registered_product_date, rp.registered_product_status,rp.registered_product_claimed_times from users u JOIN registered_products rp ON u.user_id = rp.registered_product_userid 
			JOIN products p ON p.product_id = rp.registered_product_productid
			where u.user_id="${param.userID}" AND rp.registered_product_status NOT LIKE 'pending' AND rp.registered_product_claimed_times <= 2
		</sql:query>
		
		<form action="" method="post">
			Please select Product ID : <select name="productID">
				<c:forEach var="col" items="${products.rows }">
					<option>${col.product_id }</option>
				</c:forEach>
			</select><br/><br/>
			Please select Date : <input type="date" name="date"/><br/><br/>
			Please enter Description : <textarea name="description" cols="35" rows="5"></textarea><br/><br/>
			Please enter inscident Details : <textarea name="inscident" cols="35" rows="5"></textarea><br/><br/>
			
			<input type="submit" name="claim" value="Claim Product"/>
			
			<c:if test="${param.claim!= null}">
				<c:choose>
					  <c:when test="${empty param.description}">
					  	<h2>Please enter Description</h2>
					  </c:when>
				  
					  <c:when test="${empty param.inscident}">
					  	<h2>Please enter Inscident Details</h2>
					  </c:when>
					  
				  <c:otherwise>
						<sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/project_phoenix"
                           user="root"  password="12345"/>
 
        				<sql:update dataSource="${dbsource}" var="claim_result">
           					 INSERT INTO claimed_products (claimed_products_id,claimed_products_detail_description,claimed_products_inscident) VALUES ('${param.productID}','${param.description}','${param.inscident}')
       					 </sql:update>
       					 
       					 <c:choose>
							<c:when test="${claim_result > 0 }">
								<sql:update dataSource="${dbsource}" var="claimed_status_updated">
           					 		UPDATE registered_products SET registered_product_claimed_times = registered_product_claimed_times + 1, registered_product_claimed_date = "${param.date}", registered_product_status = 'pending'
           					 		WHERE registered_product_userid = "${param.userID}" AND registered_product_productid="${param.productID}"
       					 		</sql:update>
       					 		
       					 		<c:choose>
									<c:when test="${claimed_status_updated>0}">
								  		 <c:redirect url="customer_page.jsp" >
								  		 	<c:param name="userID" value="${param.userID }"></c:param>
											<c:param name="successMessage" value="Your product have claimed successfully, Please wait for approval, Thank You :)"></c:param>
										</c:redirect>
									</c:when>
									<c:otherwise>
										<font size="5" color='red'> Please try again!.</font> 
									</c:otherwise>
								</c:choose>		
							</c:when>
							
							<c:otherwise>
								<font size="5" color='red'> Please try again!.</font> 
							</c:otherwise>
						</c:choose>			
				  </c:otherwise>
				  
			</c:choose>
		</c:if>
		</form>
</div>
</body>
</html>