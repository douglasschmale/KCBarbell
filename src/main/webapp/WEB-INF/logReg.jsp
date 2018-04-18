<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head> 
		<meta name="viewport" content="width=device-width, initial-scale=1">



		<link rel="stylesheet" type="text/css" href="/css/logReg.css">

		<!-- Font -->
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
        <link rel="stylesheet" id="bootstrap-css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" >
		<!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Lato:400,700" rel="stylesheet">
		<link href='https://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css'>

		<title>Admin</title>
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
			<div class="row main">
				<div class="panel-heading">
	               <div class="panel-title text-center">
                        <img src="/images/logo.png" alt="KC Barbell" width="330">
	               		<!-- <h1 class="title">KC Barbell</h1> -->
	               		<!-- <hr /> -->
	               	</div>
	            </div> 
				<div class="main-login main-center">
					<form class="form-horizontal" method="POST" action="/registration">
                            <p><form:errors path="user.*" /></p>
                            <c:if test="${emailError !=null}">
                                <c:out value="${emailError}"></c:out>
                            </c:if>
						<!-- <div class="form-group">
							<label for="name" class="cols-sm-2 control-label">Your Name</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
									<input type="text" class="form-control" name="name" id="name"  placeholder="Enter your Name"/>
								</div>
							</div>
                        </div> -->
                        
                        <div class="form-group">
                            <label for="username" class="cols-sm-2 control-label">Username</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon">
                                        <i class="fa fa-users fa" aria-hidden="true"></i>
                                    </span>
                                    <input type="text" class="form-control" name="username" id="username" placeholder="Enter your Username" />
                                </div>
                            </div>
                        </div>

						<div class="form-group">
							<label for="email" class="cols-sm-2 control-label">Your Email</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
									<input type="text" class="form-control" name="email" id="email"  placeholder="Enter your Email"/>
								</div>
							</div>
						</div>



						<div class="form-group">
							<label for="password" class="cols-sm-2 control-label">Password</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
									<input type="password" class="form-control" name="password" id="password"  placeholder="Enter your Password"/>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="confirm" class="cols-sm-2 control-label">Confirm Password</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
									<input type="password" class="form-control" name="passwordConfirmation" id="passwordConfirmation"  placeholder="Confirm your Password"/>
								</div>
							</div>
						</div>

						<div class="form-group ">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                            <input type="submit" class="btn btn-primary btn-lg btn-block login-button" value="Login">
						</div>
						<div class="login-register">
				            <a href="/login">Login</a>
				         </div>
					</form>
				</div>
			</div>
		</div>

        <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
            crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
            crossorigin="anonymous"></script>
        <!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script> -->
        <!-- <script src="https://code.jquery.com/jquery-1.11.1.min.js"></script> -->
	</body>
</html>