<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.sql.*" %> 
<!DO CTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
   <link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
   <link rel="icon" type="image/png" href="assets/img/favicon.png">
   <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
   <title>EXAMINATION</title>
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

<body class="">
   <div class="wrapper ">
       <div class="sidebar" data-color="orange">
           <!--
       Tip 1: You can change the color of the sidebar using: data-color="blue | green | orange | red | yellow"
   -->
           <!-- <div class="logo">
               <a href="http://www.creative-tim.com" class="simple-text logo-mini">
                   
               </a>
               <a href="" class="logo-normal">
                   TDS
               </a>
           </div> -->
           <div class="sidebar-wrapper">
               <ul class="nav">
                   
                   <li>
                      
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
                       <!-- <a class="navbar-brand" href="#pablo">Icons</a> -->
                   </div>
                   <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
                       <span class="navbar-toggler-bar navbar-kebab"></span>
                       <span class="navbar-toggler-bar navbar-kebab"></span>
                       <span class="navbar-toggler-bar navbar-kebab"></span>
                   </button>
                   <div class="collapse navbar-collapse justify-content-end" id="navigation">
                       <!-- <fo rm>
                           <div class="input-group no-border">
                               <input type="text" value="" class="form-control" placeholder="Search...">
                               <span class="input-group-addon">
                                   <i class="now-ui-icons ui-1_zoom-bold"></i>
                               </span>
                           </div>
                       </form> -->
                       <ul class="navbar-nav">
                           
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
                           Intsructions
                          
                             
                       
    
    <% String name,pass,sql,examid;
            name=request.getParameter("uname").trim();
             pass=request.getParameter("upass").trim();
              examid=request.getParameter("examid").trim();
             
             
             try{
                 Class.forName("com.mysql.jdbc.Driver");
                 Connection con=DriverManager.getConnection("jdbc:mysql://localhost/pathtds","root","root12tree!Q");
                 
               Statement stmt=con.createStatement();
       
                 sql="select * from applicants where APP_EMAIL='"+name+"' and APP_PASSWORD='"+pass+"' and EXAM_ID='"+examid+"' and APP_STATUS=1  ";
                  ResultSet rs=stmt.executeQuery(sql);
                  if(rs.next()){  
       
                                                        %>
                   <form action="examcon.jsp" method="post" >
                       <input type="hidden" name="appid" id="appid" value="<%= rs.getString(2)%>" >
                       <input type="hidden" name="examid" id="examid" value="<%= rs.getString(6)%>" >
                               <button class="btn btn-success">Accept and Start Exam</button>
                               
                      
                  </form>
                   <% }
                  else{
                    response.sendRedirect("login.html");  
                    //out.println("ERROR!!!!!!!!!!Incorect Details");
                  }
                  
             }
             catch(Exception e){
                 out.println("error"+e);
             } %>
           </div>
                   </div>
               </div>
           </div>
           <footer class="footer">
               <div class="container-fluid">
                   <nav>
                       <ul>
                           <li>
                               <a href="https://www.path-solutions.com">
                                  
                               </a>
                           </li>
                           
                       </ul>
                   </nav><br><br>
                   <div class="copyright">
                   <img src="assets/img//logo2.png" alt="..."> <br>
                       &copy;
                       <sc ript>
                           document.write(new Date().getFullYear())
                       </script>, Ver 1.0 Beta
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