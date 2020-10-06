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
                
                <a href="#" class="simple-text logo-normal">
                    T&D System
                </a>
            </div>
            <div class="sidebar-wrapper">
                <ul class="nav">
                    <li class="active">
                        <a href="/pathTDS/index">
                            <i class="now-ui-icons design_app"></i>
                            <p>Admin</p>
                        </a>
                    </li>
                    <!--    <li >
                        <a href="/pathTDS/privileges">
                            <i class="now-ui-icons education_atom"></i>
                            <p>Privileges</p>
                        </a>
                    </li>-->
                    <li>
                        <a href="/pathTDS/usermangmnt">
                            <i class="now-ui-icons location_map-big"></i>
                            <p>User Management</p>
                        </a>
                    </li>
                    <li>
                        <a href="/pathTDS/manageQuestions">
                            <i class="now-ui-icons ui-1_bell-53"></i>
                            <p>Questions</p>
                        </a>
                    </li>
                    <li>
                        <a href="/pathTDS/exammangmnt">
                            <i class="now-ui-icons users_single-02"></i>
                            <p>Exam Management </p>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <i class="now-ui-icons design_bullet-list-67"></i>
                            <p>Applications Management</p>
                        </a>
                    </li>
                    <li>
                        <a href="#">
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
                        <a class="navbar-brand" href="#pablo">USER: Admin</a>
                    </div>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-bar navbar-kebab"></span>
                        <span class="navbar-toggler-bar navbar-kebab"></span>
                        <span class="navbar-toggler-bar navbar-kebab"></span>
                    </button>
                    <div class="collapse navbar-collapse justify-content-end" id="navigation">
                        <form>
                            <div class="input-group no-border">
                                <input type="text" value="" class="form-control" placeholder="Search...">
                                <span class="input-group-addon">
                                    <i class="now-ui-icons ui-1_zoom-bold"></i>
                                </span>
                            </div>
                        </form>
                        <ul class="navbar-nav">
                           
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i class="now-ui-icons location_world"></i>
                                    <p>
                                        <span class="d-lg-none d-md-block">Some Actions</span>
                                    </p>
                                </a>
                                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
                                    <a class="dropdown-item" href="/pathTDS/logout">Logout</a>
                                   
                                </div>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#pablo">
                                    <i class="now-ui-icons users_single-02"></i>
                                    <p>
                                        <span class="d-lg-none d-md-block">Account</span>
                                    </p>
                                </a>
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
                                <h5 class="title">Register for Examination : Exam Name</h5>
                            </div>
                            <div class="card-body">
                                <form action="">

                                <div class="row"  align="center">
                                <div class="col-md-12">
                                    Path Employee&emsp;
                                    <input type="radio" value="Y" class="radio-inline" "/>&emsp;Yes&emsp;
                                    <input type="radio" value="N" class="radio-inline""/>&emsp;No&emsp;   
                                </div>
                                </div><br><br>
                                <div class="row">
                                <div class="col-md-4">
                                    <div class="col-xs-12">
                                    Candidate Name
                                    <input type="text" class="form-control input-sm" placeholder=""/>
                                    </div><br>
                                    <div class="col-xs-12">
                                    Bank/Company Name
                                    <input type="text" class="form-control input-sm" placeholder=""/>
                                    </div><br>
                                    <div class="col-xs-12">
                                    Bank/Company Location
                                    <input type="text" class="form-control input-sm" placeholder=""/>
                                    <form:errors path="companyLocation" cssStyle="color: #ff0000;"/>
                                    </div><br>
                                    <div class="col-xs-12">     
                                    Department
                                    <input type="text" class="form-control input-sm" placeholder=""/>
                                    </div>
                                    <br>
                                </div>
                                <div class="col-md-4">
                                    <div class="col-xs-12"> 
                                    Job Title
                                    <input type="text" class="form-control input-sm" placeholder=""/>
                                    </div><br>
                                    <div class="col-xs-12"> 
                                    Email ID
                                    <input type="text" class="form-control input-sm" placeholder=""/>
                                    </div><br>
                                    <div class="col-xs-12"> 
                                    Phone Number
                                    <input type="text" class="form-control input-sm" placeholder=""/>
                                    </div><br>
                                    <div class="col-xs-12"> 
                                    Remarks
                                    <input type="text" class="form-control input-sm" placeholder=""/><br>
                                    </div><br>
                                    
                                    
                                </div>
                                <div class="col-md-4">
                                    <div class="col-xs-12" id="lineManager">
                                    Line Manager
                                    <input type="text" class="form-control input-sm" placeholder=""/>
                                    </div><br>
                                    <div class="col-xs-12" id="lineManagerEmail">   
                                    Line Manager Email ID
                                    <input type="text" class="form-control input-sm" placeholder=""/>
                                    </div><br>
                                    <div class="col-xs-12" id="serviceDuration">    
                                    Service Duration
                                    <input type="text" class="form-control input-sm" placeholder=""/>
                                    </div><br>
                                    <div class="col-xs-12" id="appByLineManager">   
                                    Approved By Line Manager<br>
                                    <input type="radio" value="Y" class="radio-inline"/> Yes
                                    <input type="radio" value="N" class="radio-inline input-sm"/> No <br><br>
                                    </div><br>
                                </div>
                                </div>
                                <br><br><br>
                                <div class="row">
                                <div class="col-md-12" align="center">
                                    <input type="submit" value="Submit" name="add" class="btn btn-success btn-sm"/>
                                </div>
                                </div>
                                <br>
                                
                                
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

</html>
