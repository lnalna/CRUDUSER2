<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Users List</title>
    <!-- Bootstrap CSS -->

    <link rel="stylesheet" href='<c:url value="/resources/3.3.5/css/bootstrap.min.css" />' />

    <style type="text/css">
        .myrow-container {
            margin: 20px;
        }   
        
 .paging-nav {
  text-align: right;
  padding-top: 2px;
}

.paging-nav a {
    margin: auto 1px;
    text-decoration: none;
    display: inline-block;
    padding: 1px 7px;
    background: #91b9e6;
    color: white;

    border-radius: 3px;
}

.paging-nav .selected-page {
  background: #187ed5;
  font-weight: bold;
}

.paging-nav,
#tableData {
  width: 400px;
  margin: 0 auto;
  font-family: Arial, sans-serif;
}
 </style>

 <script type="text/javascript"  src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
 <script type="text/javascript"  src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>
 <script type="text/javascript"  src="${pageContext.request.contextPath}/resources/js/paging.js"></script>
 
 <script type="text/javascript">
            $(document).ready(function() {
                $('#tabpag').paging({limit:5});
            });
 </script>

    
</head>

<body class=".container-fluid">
<div class="container myrow-container">
    <div class="panel panel-success">
        <div class="panel-heading">
            <h3 class="panel-title">
                <div align="left"><a href="getAllUsers"><b>Users List</b></a></div>
                <div align="right"><a href="createUser">Add New User</a></div>
            </h3>
        </div>
        <div class="panel-body">
            <c:if test="${empty userList}">
                There are no Users
            </c:if>
            <c:if test="${not empty userList}">
            
            	<form action="/cbvjrbweklbvebvjfbjjb/cbvjrbweklbvebvjfbjjb/searchUser">
            		<div class="row">
					  <div class="col-md-4">Search Users: <input type='text' name='searchName' id='searchName'/> </div>
					  <div class="col-md-4"><input class="btn btn-success" type='submit' value='Search'/></div>
					</div>
            	</form>  
            	  
            	
            	            	
                <table  id="tabpag" class="table table-hover table-bordered">
                    <thead style="background-color: #bce8f1;">
                    <tr>
                        <th>Id</th>
                        <th>Name</th>
                        <th>Age</th>
                        <th>isAdmin</th>
                        <th>createdDate</th>
                        <th>Edit</th>
                        <th>Delete</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${userList}" var="user">
                        <tr>
                        	<th><c:out value="${user.id}"/></th>
                        	<th><c:out value="${user.name}"/></th>
                        	<th><c:out value="${user.age}"/></th>
                            <th><c:out value="${user.isAdmin}"/></th>
                        	<th><c:out value="${user.createdDate}"/></th>
                        	<th><a href="editUser?id=<c:out value='${user.id}'/>">Edit</a></th>
                        	<th><a href="deleteUser?id=<c:out value='${user.id}'/>">Delete</a></th>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>             
          
            </c:if>
        </div>
    </div>
    </div>
 
</body>
</html>