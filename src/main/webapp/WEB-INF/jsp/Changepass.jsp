<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    <link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
    <link rel="icon" type="image/png" href="assets/img/favicon.png">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>TDS</title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
    <!--     Fonts and icons     -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
    <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
    <!-- CSS Files -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="assets/css/now-ui-dashboard.css?v=1.0.1" rel="stylesheet" />
    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link href="assets/demo/demo.css" rel="stylesheet" />
    
</head>

<body class="">
<% 
response.setHeader("Cache-control","no-store"); //HTTP 1.1 
response.setHeader("Pragma","no-cache"); //HTTP1.0 
response.setDateHeader("Expire",0); //prevents caching at the proxy server 
%> 

    <div class="sidebar" data-color="blue">
            <!--
        Tip 1: You can change the color of the sidebar using: data-color="blue | green | orange | red | yellow"
    -->
            <div class="logo">
                
               <a href="#" class="simple-text logo-normal" style="text-align:center;font-weight:600;">
                    T&D System
                </a>
            </div>
            <div class="sidebar-wrapper">
              <ul class="nav">
                    <li>
                        <a href="/pathTDS/index">
                            <i class="now-ui-icons design_app"></i>
                            <p>Admin</p>
                        </a>
                    </li>
                   <!--   <li >
                        <a href="/pathTDS/privileges">
                            <i class="now-ui-icons education_atom"></i>
                            <p>Privileges</p>
                        </a>
                    </li>-->
                    <li >
                        <a href="/pathTDS/usermangmnt">
                            <i class="now-ui-icons location_map-big"></i>
                            <p>User Management</p>
                        </a>
                    </li>
                    <li class="active">
                        <a href="/pathTDS/passwordMangement">
                            <i class="now-ui-icons ui-1_lock-circle-open"></i>
                            <p>Password Management</p>
                        </a>
                    </li>
                     <li >
                        <a href="/pathTDS/setuppara">
                            <i class="now-ui-icons text_caps-small"></i>
                            <p>Parameter setup</p>
                        </a>
                    </li>
                    <li>
                        <a href="/pathTDS/manageQuestions">
                            <i class="now-ui-icons ui-1_bell-53"></i>
                            <p>Questions</p>
                        </a>
                    </li>
                   
                    <li >
                        <a href="/pathTDS/exammangmnt">
                            <i class="now-ui-icons users_single-02"></i>
                            <p>Exam Management </p>
                        </a>
                    </li>
                    <li>
                        <a href="/pathTDS/viewApplicants">
                            <i class="now-ui-icons design_bullet-list-67"></i>
                            <p>Applications Management</p>
                        </a>
                    </li>
                    <li>
                        <a href="/pathTDS/viewResults">
                            <i class="now-ui-icons text_caps-small"></i>
                            <p>Old Results</p>
                        </a>
                    </li>
                    <li>
                        <a href="/pathTDS/UpgradeScoreResult">
                            <i class="now-ui-icons text_caps-small"></i>
                            <p>Results</p>
                        </a>
                    </li>
                     <li>
                        <a href="/pathTDS/TrainingModule">
                            <i class="now-ui-icons text_caps-small"></i>
                            <p>Training</p>
                        </a>
                    </li>
                    
                    
                </ul>
            </div>
        </div>
        <div class="main-panel">
            <!-- Navbar -->
            <nav class="navbar navbar-expand-lg navbar-transparent  navbar-absolute bg-primary fixed-top">
                <div class="container-fluid">
                    <div class="navbar-wrapper">
                        <div class="navbar-toggle">
                            <button type="button" class="navbar-toggler">
                                <span class="navbar-toggler-bar bar1"></span>
                                <span class="navbar-toggler-bar bar2"></span>
                                <span class="navbar-toggler-bar bar3"></span>
                            </button>
                        </div>
                        <a class="navbar-brand" href="#pablo">USER:<%= session.getAttribute("uname") %></a>
                    </div>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-bar navbar-kebab"></span>
                        <span class="navbar-toggler-bar navbar-kebab"></span>
                        <span class="navbar-toggler-bar navbar-kebab"></span>
                    </button>
                    <div class="collapse navbar-collapse justify-content-end" id="navigation">
                        
                        <ul class="navbar-nav">
                           
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i class="now-ui-icons location_world"></i>
                                    <p>
                                        <span class="d-lg-none d-md-block">Change Password</span>
                                    </p>
                                </a>
                                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
                                    <a class="dropdown-item" href="/pathTDS/logout">Logout</a>
                                   
                                </div>
                            </li>
                            
                        </ul>
                    </div>
                </div>
            </nav>
            <!-- End Navbar -->
            <div class="panel-header panel-header-sm">
            </div>
            <div class="content">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                                <h5 class="title "> Password Change </h5>
                            </div>
                            <div class="card-body">
                                <form id="changepass">
                                  
                                      
                                            
                                        
                                       
                                       


                                  
                                   <!--    <div class="row">
                                     <div class="col-md-6">
                                      <table class="table" style="margin-left:20px;">
                                      <tr>
                                      <td> <label>Enter Old Password </label></td>
                                        <td><input id="cpass" name="cpass"  type="password" class="form-control" onblur="passwordFunction();"  placeholder=" old Password" value="">
                                       
                                         <div id=curntpass style=display:none;color:red ><i><font size="2">Old password not matched</font> </i></div>
                                        
                                        </td>
                                       <td></td><td></td>
                                     
                                      </tr>
                                       <tr>
                                      <td><label>Enter New Password </label></td>
                                        <td><input id="npass" name="npass"  type="password" class="form-control"   placeholder="New Password" value="" >
                                         
                                        </td>
                                          
                                          <td></td><td></td>
                                      </tr>
                                       <tr>
                                      <td><label>Re enter new password to confirm </label></td>
                                        <td><input id="password" name="password"  type="password" class="form-control" onblur="confirmFunction();"  placeholder="Confirm New Password" value="">
                                        <div id=cnfmpass style=display:none;color:red ><i><font size="2">Confirm password not matched with new password</font> </i></div>
                                      
                                        </td>
                                         <td></td><td></td>
                                      </tr>
                                      <tr></tr>
                                      </table>
                             
                                        </div>
                                       
                                      </div>-->
                                      

                                        <input id="pass" name="pass"  type="hidden" class="form-control"   value="<%= session.getAttribute("curntpass") %>">
                                         <input id="UId" name="UId"  type="hidden" class="form-control"   value="<%= session.getAttribute("uid") %>">   
                                        
                                      
                                      
                                      
                                      
                                      
       
                                            <div class="row">
                                             <div class="col-md-3">
                                           <label>Enter Old Password </label>
                                           </div>
                                             <div class="col-md-4 ">
                                             <div class="form-group" >
                                              <div class="input-group">
                                             
                                              <input id="cpass" name="cpass"  type="password" class="form-control" onblur="passwordFunction();"  placeholder=" old Password" value=""> 
                                              <!-- <span class="input-group-addon"> <i class="fa fa-eye" aria-hidden="true"></i></span> -->
                                              </div>
                                                 <div id=curntpass style=display:none;color:red ><i><font size="2">Old password not matched</font> </i></div>
                                          </div>
                                           </div>
                                        </div>
                                        
                                        <br>
                                        <div class="row">
                                             <div class="col-md-3">
                                           <label>Enter New Password </label>
                                           </div>
                                             <div class="col-md-4 ">
                                             <div class="form-group" >
                                              <input id="npass" name="npass"  type="password" class="form-control"   placeholder="New Password" value="" >
                                            </div>
                                           </div>
                                        </div>
                                         <br>
                                        <div class="row">
                                             <div class="col-md-3">
                                           <label>Re-enter password to confirm </label>
                                           </div>
                                             <div class="col-md-4 ">
                                             <div class="form-group" >
                                              <input id="password" name="password"  type="password" class="form-control" onblur="confirmFunction();"  placeholder="Confirm New Password" value="">
                                        <div id=cnfmpass style=display:none;color:red ><i><font size="2">Confirm password not matched with new password</font> </i></div>
                                            </div>
                                           </div>
                                        </div>
                                        
                                        
                                   
        

                                    <div class="row">
                                        <div class="col-md-12 ">
                                            <div class="form-group" style="padding-left:20px;">
                                           
                                                <button id="changeuserpass" class="btn btn-info " >Save</button>
                                            </div>
                                        </div>
                                        
                                        
                                    </div>
                                    
                                </form>
                            </div>
                        </div>
                    </div>
                   
                </div>
            </div>
            <footer class="footer">
                <div class="container-fluid">
                    <nav>
                        <ul>
                            <li>
                                <a href="#">
                                    TDS
                                </a>
                            </li>
                           
                        </ul>
                    </nav>
                    <div class="copyright">
                        &copy;
                        <script>
                            document.write(new Date().getFullYear())
                        </script>
                        
, Ver 1.0 Beta
                    </div>
                </div>
            </footer>
        </div>
    </div>
</body>
<!--   Core JS Files   -->
<script src="assets/js/core/jquery.min.js"></script>
<script src="assets/js/core/popper.min.js"></script>
<script src="assets/js/core/bootstrap.min.js"></script>
<script src="assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
<!--  Google Maps Plugin    -->
<script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
<!-- Chart JS -->
<script src="assets/js/plugins/chartjs.min.js"></script>
<!--  Notifications Plugin    -->
<script src="assets/js/plugins/bootstrap-notify.js"></script>
<!-- Control Center for Now Ui Dashboard: parallax effects, scripts for the example pages etc -->
<script src="assets/js/now-ui-dashboard.js?v=1.0.1"></script>
<!-- Now Ui Dashboard DEMO methods, don't include it in your project! -->
<script src="assets/demo/demo.js"></script>
>
<script src="js/changepass.js"></script>

</html>
