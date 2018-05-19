<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="icon" href="images/favicon.ico">
    <title>Employee Management App - Update Password</title>
    <!-- Bootstrap core CSS -->
    <link href="./css/external/bootstrap.min.css" rel="stylesheet">
    <link href="./css/external/dataTables.bootstrap4.min.css" rel="stylesheet">
    <!--Fonts-->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i"
          rel="stylesheet">
    <!-- Icons -->
    <link href="./css/external/font-awesome.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="./css/style.css" rel="stylesheet">
</head>
<body>
<div class="container-fluid" id="wrapper">
    <div class="row">
        <nav class="sidebar col-xs-12 col-sm-4 col-lg-3 col-xl-2 bg-faded sidebar-style-1">
            <h1 class="site-title">
                <a href="/employeeManagement/dashboard">
                    <img src="./images/company_logo.jpg" class="img-fluid">
                </a>
            </h1>

            <a href="#menu-toggle" class="btn btn-default" id="menu-toggle">
                <em class="fa fa-bars"></em>
            </a>

            <ul class="nav nav-pills flex-column sidebar-nav">
                <li class="nav-item">
                    <a class="nav-link active" href="/employeeManagement/dashboard">
                        <em class="fa fa-dashboard"></em>
                        Dashboard <span class="sr-only">(current)</span>
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="/employeeManagement/addTimesheet">
                        <em class="fa fa-calendar-o"></em> Upload Timesheet
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="/employeeManagement/reports">
                        <em class="fa fa-bar-chart"></em> Reports
                    </a>
                </li>
            </ul>
        </nav>

        <main class="col-xs-12 col-sm-8 offset-sm-4 col-lg-9 offset-lg-3 col-xl-10 offset-xl-2 pt-3 pl-4">
            <header class="page-header row justify-center">
                <div class="col-md-6 col-lg-8">
                    <h1 class="float-left text-center text-md-left">Update Password</h1>
                </div>

                <div class="dropdown user-dropdown col-md-6 col-lg-4 text-center text-md-right">
                    <a class="btn btn-stripped dropdown-toggle" href="https://example.com" id="dropdownMenuLink"
                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <img src="images/profile-pic.png" alt="profile photo" class="circle float-left profile-photo"
                             width="50" height="auto">

                        <div class="username mt-1">
                            <h4 class="mb-1">${user.employeeFirstName} ${user.employeeFirstName}</h4>
                            <h6 class="text-muted">${user.employeeRoleDesc}</h6>
                        </div>
                    </a>

                    <div class="dropdown-menu dropdown-menu-right" style="margin-right: 1.5rem;"
                         aria-labelledby="dropdownMenuLink">
                        <a class="dropdown-item" href="/employeeManagement/settings">
                            <em class="fa fa-sliders mr-1"></em>
                            Settings
                        </a>
                        <a class="dropdown-item" href="/employeeManagement/logout">
                            <em class="fa fa-power-off mr-1"></em>
                            Logout
                        </a>
                    </div>
                </div>

                <div class="clear"></div>
            </header>

            <section class="row">
                <div class="col-sm-12">
                    <section class="row">
                        <div class="col-sm-12">
                            <section class="row">
                                <div class="col-md-12">
                                    <c:if test="${not empty msg}">
                                        <div class="col-md-10">
                                            <div class="alert alert-${css} alert-dismissible" role="alert">
                                                <button type="button" class="close" data-dismiss="alert"
                                                        aria-label="Close">
                                                    <span aria-hidden="true">X</span>
                                                </button>
                                                <i class="fa fa-info-circle faa-flash animated"></i><strong> ${msg}</strong>
                                            </div>
                                        </div>
                                    </c:if>

                                    <spring:url value="/updatePassword" var="updatePasswordUrl"/>
                                    <form:form method="POST" modelAttribute="employee" action="${updatePasswordUrl}">

                                        <form:hidden path="employeeRoleId"/>
                                        <form:hidden path="employeeEmailId"/>

                                        <div class="row">
                                            <spring:bind path="empPassword">
                                                <div class="form-group required col-md-6 ${status.error ? 'has-danger' : ''}">
                                                    <label class="form-control-label" for="employeePassword">
                                                        New password
                                                    </label>
                                                    <div class="inputGroupContainer">
                                                        <form:password path="empPassword"
                                                                       name="employeePassword" id="employeePassword"
                                                                       maxlength="50" placeholder="Enter New Password"
                                                                       data-toggle="tooltip"
                                                                       data-animation="false"
                                                                       class="form-control ${status.error ? 'form-control-danger' : ''}"
                                                                       required="required"/>
                                                        <div class="form-control-feedback">
                                                            <form:errors path="empPassword"/>
                                                        </div>
                                                    </div>
                                                </div>
                                            </spring:bind>
                                        </div>

                                        <div class="row">
                                            <spring:bind path="empPassword2">
                                                <div class="form-group required col-md-6 ${status.error ? 'has-danger' : ''}">
                                                    <label class="form-control-label" for="empPassword2">
                                                        Confirm new password
                                                    </label>
                                                    <div class="inputGroupContainer">
                                                        <form:password path="empPassword2"
                                                                       name="empPassword2" id="empPassword2"
                                                                       maxlength="50" placeholder="Enter Last Name"
                                                                       data-toggle="tooltip"
                                                                       data-animation="false"
                                                                       class="form-control ${status.error ? 'form-control-danger' : ''}"
                                                                       required="required"/>
                                                        <div class="form-control-feedback">
                                                            <form:errors path="empPassword2"/>
                                                        </div>
                                                    </div>
                                                </div>
                                            </spring:bind>
                                        </div>
                                        <br>
                                        <div class="text-center col-md-6">
                                            <input type="submit" class="btn btn-success"
                                                   value="Update Password"/>
                                        </div>
                                    </form:form>
                                    <hr>
                                </div>
                            </section>
                        </div>
                    </section>

                    <section class="row">
                        <div class="col-12 mt-1 mb-4">Copy Right by <a href="http://www.Employee Management App.com/">
                            Employee Management App.,</a>
                        </div>
                    </section>
                </div>
            </section>
        </main>
    </div>
</div>
<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="./js/external/jquery-3.2.1.min.js"></script>
<script src="./js/external/tether.min.js"></script>
<script src="./js/external/bootstrap.min.js"></script>
<script src="./js/external/moment.min.js"></script>
</body>
</html>
