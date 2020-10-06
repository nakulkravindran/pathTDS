<!DOCTYPE html>
<html lang="en">

<head>
    
    <link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
    <link rel="icon" type="image/png" href="assets/img/favicon.png">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    
    <title>TDS</title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
    <!--     Fonts and icons     -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
    <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
    <!-- CSS Files -->
    <link href="assets/css2/bootstrap.min.css" rel="stylesheet" />
    <link href="assets/css2/now-ui-dashboard.css?v=1.0.1" rel="stylesheet" />
    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link href="assets/demo/demo.css" rel="stylesheet" />
    
    
</head>

<body class="bcks" >
<% 
response.setHeader("Cache-control","no-store"); //HTTP 1.1 
response.setHeader("Pragma","no-cache"); //HTTP1.0 
response.setDateHeader("Expire",0); //prevents caching at the proxy server 
%> 


    <div class="wrapper ">
        <div class="">
            <!-- Navbar -->
            
            <!-- End Navbar -->
            <div class="content">
                <div class="row">
                    <div class="col-md-8">
                    		
	                    		<div class="text-center" style="padding-top:20%"> 
	  							
								
                    		<!-- <p class="text-info">TDS</p><br> --><br><br><br><br><br><br><br>
                    		<p class="title tds">Training </p>
                    		<p class="title tds">&amp;</p>
                    		<p class="title tds">Development System</p><br><br><br>
                    		<p class="title" style="color:#f0a465;font-weight:600;font-size:14px;">Path Solutions</p>
                    		<p class="title" style="color:#f0a465;font-weight:600;font-size:12px;">Powering Islamic Financial Markets</p>
                    		</div>
                    
                    </div>
                    <div class="col-md-4"style="height:100%"><br><br><br><br><br><br>
                        <div class="card card-user" >
                            <div class="image">
                                <img src="assets/img//loginbck.jpg" alt="...">
                            </div>
                            <div class="card-body">
                                <div class="author">
                                    
                                        <img class="avatar border-gray" src="assets/img//mike.jpg" alt="...">
                                        <h5 class="text-info"><a href="#">LOGIN</a></h5>
                                    
                                    <p class="description">
                                        Login to access TDS
                                    </p>
                                </div>
                                
                                <form id="userLoginDetails">
                                    <div class="row">
                                    	<div class="col-md-2 px-1"></div>
                                        <div class="col-md-8 px-1">
                                            <div class="form-group">
                                            
                                                <h5>User Name</h5>
                                                <input type="text" class="form-control" placeholder="Username" id="emailId" onblur="hideusername();" name="userName">
                                            </div>
                                             <div id=username style=display:none;color:red ><i><font size="2">Please Enter User Name</font> </i></div>
                                        </div>
                                        <div class="col-md-2 px-1"></div>
                                    </div>
                                    <div class="row">
                                    	<div class="col-md-2 px-1"></div>
                                        <div class="col-md-8 px-1">
                                            <div class="form-group">
                                                <h5>Password</h5>
                                                <input type="password" class="form-control" placeholder="Password" onfocus="usernameFunction()" id="applicantPassword" onblur="hidepass();" name="password">
                                            </div>
                                            <div id=pass style=display:none;color:red ><i><font size="2">Please Enter Password</font> </i></div>
                                        </div>
                                        <div class="col-md-2 px-1"></div>
                                    </div>
                                    <div class="row">
                                    	<div class="col-md-2 px-1"></div>
                                        <div class="col-md-8 px-1">
                                            <div class="form-group">
                                             <div id=logn style=display:none;color:red ><i><font size="2">No Matching Data Found !!!!!</font> </i></div>
                                                <button id="loginButton" type="submit" class="btn btn-block btn-info" onfocus="adminlogin();">Login</button>
                                            </div>
                                        </div>
                                        <div class="col-md-2 px-1"></div>
                                    </div>
                               </form>
                                
                                <p class="description text-center">
                                    <br>Welcome to TDS
                                    <br><br>
                                    "An investment in knowledge pays the best interest."
                                    <br>
                                    Ver 1.0 Beta
                                    
                                </p>

                            </div>
                            
                            <!-- <div class="button-container">
                                <button href="#" class="btn btn-neutral btn-icon btn-round btn-lg">
                                    <i class="fab fa-facebook-f"></i>
                                </button>
                                <button href="#" class="btn btn-neutral btn-icon btn-round btn-lg">
                                    <i class="fab fa-twitter"></i>
                                </button>
                                <button href="#" class="btn btn-neutral btn-icon btn-round btn-lg">
                                    <i class="fab fa-google-plus-g"></i>
                                </button>
                            </div> -->
                            
                        </div>
                    </div>
                </div>
            </div>
            <!-- <footer class="footer">
                <div class="container-fluid">
                    <nav>
                        <ul>
                            <li>
                                <a href="https://www.path-solutions.com">
                                 <img src="assets/img//logo2.png" alt="...">   
                                </a>
                            </li>
                            
                        </ul>
                    </nav><br><br>
                    
                </div>
            </footer> -->
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
<script src="js/loginHelper.js"></script>

</html>
