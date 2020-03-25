<!DOCTYPE html >
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="sat, 01 Dec 2001 00:00:00 GMT">
<title>Student Mart</title>
<link href="static/css/bootstrap.min.css" rel="stylesheet">
<link href="static/css/style.css" rel="stylesheet">
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<body>
	<div role="navigation">
		<div class="navbar navbar-inverse">
			<a href="/welcome" class="navbar-brand">Student Mart</a>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li><a href="/login">Login</a></li>
					<li><a href="/register">New Registration</a></li>
					<li><a href="/show-users">All Users</a></li>
					<li><a href="/all-items">All items</a></li>
				</ul>
			</div>
		</div>
	</div>
<c:choose>



		<c:when test="${mode=='All items' }">
			<div class="container text-center" id="tasksDiv">
				<h3>All items</h3>
				<hr>
				<div class="table-responsive">
					<table class="table table-striped table-bordered">
						<thead>
							<tr>
								<th>ItemID</th>
								<th>SellerID</th>
								<th>ItemName</th>
								
								<th>ItemPrice</th>
								<th>ItemWeight</th>
								<th>ItemCartDesc</th>
								
								
								<th>ItemLongDesc</th>
								<th>ItemCategoryID</th>
								
								<th>ItemImageRef</th>
								<th>SellerID</th>
								<th>ItemNumber</th>
								<th>ItemSold</th>
								<th>Delete</th>
								<th>Edit</th>
								
							</tr>
						</thead>
						<tbody>
							<c:forEach var="user" items="${items }">
								<tr>
									<td>${item.ItemID}</td>
									<td>${item.SellerID}</td>
									<td>${item.firstname}</td>
									<td>${item.lastname}</td>
									<td>${item.age}</td>
									<td><a href="/delete-user?id=${item.id }"><span
											class="glyphicon glyphicon-trash"></span></a></td>
									<td><a href="/edit-user?id=${item.id }"><span
											class="glyphicon glyphicon-pencil"></span></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</c:when>
		







	
</c:choose>
	
	
	
	
	
	
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="static/js/jquery-1.11.1.min.js"></script>
	<script src="static/js/bootstrap.min.js"></script>
</body>
</html>