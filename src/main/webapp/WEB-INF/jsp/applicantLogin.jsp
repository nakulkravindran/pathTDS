<!DOCTYPE html>
<html lang="en">

<head>
   <meta charset="utf-8" />
   <script>
        history.forward();
    </script>
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

<body class="bcks2" >
    <div class="wrapper ">
        <div class="">
        
        
        </div>
            <!-- Navbar -->
            
            <!-- End Navbar -->
            <div class="content">
                <div class="row ">
                    <div class="col-md-8">
                    		
	                    		<div class="text-center"> 
	  							
								
                    		
                    		<img class="img img-responsive" style="width:20%" src="assets/img/logoapplicat.png" alt="...">
                    		<br><br><br><br><br><br>
                    		<p class="tds">Welcome to </p><br><br>
                    		<p class="title tds">The Online Examination Portal </p>
                    		<p class="tds">Path Solutions</p>
                    		<p class="title" style="color:#f0a465;font-weight:600;font-size:12px;">Powering Islamic Financial Markets</p>
                    		</div>
                    
                    </div>
                    <div class="col-md-4">
                        <div class="card card-user" style="height:100%">
                            <div class="image">
                                <img src="assets/img/loginbck.jpg" alt="TDS">
                            </div>
                            <div class="card-body">
                                <div class="author">
                                    	<img class="avatar border-gray" src="assets/img/mike.jpg" alt="...">
                                        <h5 class="text-info"><a href="#">LOGIN</a></h5>
                                    
                                    <p class="description">
                                        Login to access Exam
                                    </p>
                                </div>
                                
                                <form id="applicantLoginDetails">
                                    <div class="row">
                                    	<div class="col-md-2 px-1"></div>
                                        <div class="col-md-8 px-1">
                                            <div class="form-group">
                                                <h5>User Name</h5>
                                                <input type="text" class="form-control" placeholder="Email Id" id="emailId" onblur="hideusername();" name="emailId">
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
                                                <input type="password" class="form-control" placeholder="Password" onfocus="usernameFunction()" id="applicantPassword" onblur="hidepass();" name="applicantPassword">
                                            </div>
                                             <div id=pass style=display:none;color:red ><i><font size="2">Please Enter Password</font> </i></div>
                                        </div>
                                        <div class="col-md-2 px-1"></div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-2 px-1"></div>
                                           <div class="col-md-8 px-1">
                                                <div class="form-group">
                                                    <h5>Exam ID</h5>
                                                    <input type="text" class="form-control" placeholder="Exam Id" onfocus="passwordFunction()" id="examid"  onblur="hideexamid();"name="examId">
                                                </div>
                                                <div id=exmid style=display:none;color:red ><i><font size="2">Please Enter Exam Id</font> </i></div>
                                           </div>
                                        <div class="col-md-2 px-1"></div>
                                    </div>
                                    <div class="row">
                                    	<div class="col-md-2 px-1"></div>
                                        <div class="col-md-8 px-1">
                                            <div class="form-group">
                                             <div id=logn style=display:none;color:red ><i><font size="2">No Matching Data Found...!!</font> </i></div>
                                             <div id=attndexam  style=display:none;color:red ><i><font size="2">Exam Already attended...!!</font> </i></div>
                                                <button id="applicantLoginButton" type="submit" onfocus="login()" class="btn btn-block btn-info">Login</button>
                                            </div>
                                             
                                        </div>
                                        <div class="col-md-2 px-1"></div>
                                    </div>
                               </form>
                                
                                <p class="description text-center">
                                   
                                        
                                    Version  1.0 Beta 
                                    
                                    <!--         -->
                                    
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
</body>
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

      <!--    <script>
function disableCtrlKeyCombination(e)
{
//list all CTRL + key combinations you want to disable
var forbiddenKeys = new Array('a', 'n', 'c', 'x', 'v', 'j' , 'w','i','s','u');
var key;
var isCtrl;
if(window.event)
{
key = window.event.keyCode;     //IE
if(window.event.ctrlKey)
isCtrl = true;
else
isCtrl = false;
}
else
{
key = e.which;     //firefox
if(e.ctrlKey)
isCtrl = true;
else
isCtrl = false;
}
//if ctrl is pressed check if other key is in forbidenKeys array
if(isCtrl)
{
for(i=0; i<forbiddenKeys.length; i++)
{
//case-insensitive comparation
if(forbiddenKeys[i].toLowerCase() == String.fromCharCode(key).toLowerCase())
{
//alert('Key combination CTRL + '+String.fromCharCode(key) +' has been disabled.');
return false;
}
}
}
return true;
}
</script> -->

<!-- 
<script>
//disable right click
document.oncontextmenu = document.body.oncontextmenu = function() {return false;}
</script> -->

</html>
