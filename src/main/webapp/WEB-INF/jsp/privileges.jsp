<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
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
                    <li >
                        <a href="/pathTDS/index">
                            <i class="now-ui-icons design_app"></i>
                            <p>Admin</p>
                        </a>
                    </li>
                    <li class="active" >
                        <a href="/pathTDS/privileges">
                            <i class="now-ui-icons education_atom"></i>
                            <p>Privileges</p>
                        </a>
                    </li>
                    <li>
                        <a href="/pathTDS/usermangmnt">
                            <i class="now-ui-icons location_map-big"></i>
                            <p>User Management</p>
                        </a>
                    </li>
                     <li>
                        <a href="/pathTDS/manageQuestions">
                            <i class="now-ui-icons ui-1_bell-53"></i>
                            <p>Question Paper</p>
                        </a>
                    </li>
                    <li>
                        <a href="/pathTDS/Questionsbank">
                            <i class="now-ui-icons ui-1_bell-53"></i>
                            <p>Questions Bank</p>
                        </a>
                    </li>
                    <li>
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
                        <a class="navbar-brand" href="#pablo">User: Admin</a>
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
                                    <a class="dropdown-item" href="#">Logout</a>
                                   
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
                            
                            <div class="card-body all-icons">
                                <div class="row">
                    <div class="col-md-12">
                        <div class="card scrollmenu">
                            <div class="card-header">
                                <h5 class="title">Privileges</h5>
                                
                            </div>
                            <div class="card-body">
                                <div class="table-responsive table-striped" >
                               
                                    <table class="table" style="vertical-align: middle;">
                                        <thead class=" text-primary" style="font-weight:400;font-size:17px; background-color: #3498db ">
                                            <th style="font-weight:400;font-size:17px; "  >
                                                Name
                                            </th >
                                            
                                            
                                            <th style="font-weight:400;font-size:17px;width: 22px;">
                                             Department   
                                            </th>
                                             <c:forEach items="${screenList}" var="screns">
                                            <th style="font-weight:400;font-size:17px;">
                                               <c:out value="${screns.screenName}"/> 
                                            </th>
                                            </c:forEach>
                                        </thead>
                                        <tbody>

                                          
                                           <c:forEach items="${userList}" var="user">
                                          
                                            <tr>
                                            
                                                <td >
                                                 
                                                 <c:out value="${user.name}"/>  
                                                </td>
                                               <td>
                                                 
                                                 <c:out value="${user.department}"/>  
                                                </td>
                                                  
                                                 
                                                
                                              <!--   <a href="/pathTDS/addPrivilage?userId=${user.id}&screenId=1"><button class="btn btn-info " >Add</button></a>-->
                                               
                                                
                                               <!--  <button id="index" onclick='indexButtonClick("${user.id}")' class="btn btn-primary " >Add privilege</button>-->
                                              
                                              
                                               
                                                <c:forEach items="${screenAccessMap}" var="entry">
                                               
                                                <td>
                                             
                                               <!-- <input type="hidden" id="screnid${entry.key.getId()}" class="scren" value="${entry.key.getId()}"/> -->
                                              
                                            
                                               <!--<input type=checkbox  onclick='indexButtonClick("${entry.key.getId()},${user.id}")' id="index"  >-->
                                             <a href="/pathTDS/addPrivilage?userId=${user.id}&screenId=${entry.key.getId()}&screenAccess=yes">add</a>
                                             
                                              
                                               </td>
                                              
                                               </c:forEach> 
                                               </c:forEach> 
                                            </tr>
                                        
                                          <tr> 
                                         
                                          </tr>
                                              
                                          
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
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
                            document.write(new Date().getFullYear());
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
<script>
                    function indexButtonClick(screenId,userId){ // active or deactive button action
                        var retVal = confirm("Are you sure to change status ?. Click 'OK' to confirm.");
                       
                        if(retVal == true){
                           var scr=$(".scren").attr("id");
                          //var userId=$('#'+scr).val();
                         //  var userId=$("#userId").val();
                        // var userId=document.getElementById("userId").value;
                          // alert(userId);
                          
                           var screenAccess="yes"
                        //	window.location = "/pathTDS/viewuser?userId=" + userId ;
                             var url="/pathTDS/addPrivilage";
                        	    $.ajax({
                        	        type: "GET",
                        	        url: url,
                        	        data: {userId: userId,screenId:screenId,screenAccess:screenAccess}, // pass userid to controller.
                        	        success: function(data)
                        	        {
                        	        	
                        	        //window.location.href = "/pathTDS/privileges";
                        	               
                        	           },
                        	        error: function(data){
                        	     	   
                        	         console.log("error");
                        	        
                        	        }
                        	      });

                        	
                        }
                       
                       
                    }
                   
                </script>
</html>
