<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Group Sign-up</title>
	<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<!-- <link href="https://fonts.googleapis.com/css?family=Lato:400,700" rel="stylesheet"> -->
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	 crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="/css/groups.css">
</head>
<body>
		<nav class="navbar navbar-default">
			<div class="container">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					 aria-expanded="false">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="https://www.google.com/maps/place/1714+Holmes+St,+Kansas+City,+MO+64108/@39.0927385,-94.576565,15.75z/data=!4m5!3m4!1s0x87c0f06ef1042ba3:0x7a8d0b29137c0275!8m2!3d39.092584!4d-94.575802">Kansas City Barbell</a>
				</div>
		
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li class="active">
							<a href="/">Home</a>
						</li>
						<li>
							<a href="/about">About</a>
						</li>
						<li>
							<a href="/groups">Schedule</a>
						</li>
						<li>
							<a href="https://www.google.com/maps/place/1714+Holmes+St,+Kansas+City,+MO+64108/@39.0927385,-94.576565,15.75z/data=!4m5!3m4!1s0x87c0f06ef1042ba3:0x7a8d0b29137c0275!8m2!3d39.092584!4d-94.575802">Location</a>
						</li>
					</ul>
		
					<ul class="nav navbar-nav navbar-right">
						<li>
							<a href="/registration">Sign Up
								<i class="fa fa-user-plus" aria-hidden="true"></i>
							</a>
						</li>
						<li>
							<a href="/login">Login
								<i class="fa fa-user" aria-hidden="true"></i>
							</a>
						</li>
		
					</ul>
				</div>
				<!-- /.navbar-collapse -->
			</div>
			<!-- /.container-fluid -->
		</nav>
<div class="container">
	<div class="row justify-content-center"></div>
	<div class="col-lg-2"></div>
	<div class="col-lg-8">
<h1>Welcome, ${currentUser.username}</h1><br>

<h3>Groups</h3>
		<table id="content" class="table table-hover">
			<thead>
				<tr>
					<th scope="col">Name</th>
					<th scope="col">Instructor</th>
					<th scope="col">Scheduled for</th>
					<th scope="col">Limit</th>
					<th scope="col">Attendees</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<c:forEach items="${groups}" var="group">
				<tr>
					<th scope = "row">${group.name }</th>
					<td>${group.instructor }</td>
					<td>${group.time }</td>
					<td>${group.maxPeople }</td>
					<td>${group.signups }</td>
					<td><a href="/groups/${group.id}/add">Add</a></td>
				</tr>
			</c:forEach>
		</table><br>
	<a href="/groups/new"><button type="button">Add a New Group</button></a><br><br>
	<form id="logoutForm" method="POST" action="/logout">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <input type="submit" value="Logout!" />
	</form>
</div>
<div class="col-lg-2"></div>
</div>
<script src="https://code.jquery.com/jquery-3.2.1.js" integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE=" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
 crossorigin="anonymous"></script>

</body>
</html>