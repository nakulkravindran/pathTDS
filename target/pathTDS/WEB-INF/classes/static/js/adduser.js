
 $("#addnewuser").click(function(e){
    	
	 var Name=$("#Name").val().trim();
	 var username=$("#username").val().trim();
	 var password=$("#password").val().trim();
	 var jobtitle=$("#jobtitle").val().trim();
	 var department=$("#department").val().trim();
	 var employeid=$("#employeid").val().trim();
	 var emailid=$("#emailid").val().trim();
	 var status=$("#status").val().trim();
	 
	 
	 var favorite = [];
     $.each($("input[name='ScreenId']:checked"), function(){            
         favorite.push($(this).val());
     });
     //alert("privilegs are: " + favorite.join(", "));
     
   /* var unchek=[]
     $.each($("input[name='ScreenId']:not(:checked)"), function(){            
    	 unchek.push($(this).val());
     });
     alert("unchekeds are: " + unchek.join(", "));*/
     
     
     
     
	 
	 if(username!=""&&password!=""&&department!=""){
	 var url = "/pathTDS/addnewuser";
     var formData = $("#newuser").serializeArray();

     $.ajax({
        type: "POST",
        url: url,
       // data: {name:Name,username:username,password:password,jobtitle:jobtitle,department:department,employeid:employeid,emailid:emailid,status:status},
        data: formData, // serializes the form's elements.
     success: function(data)
        {
        	
            // show response from the php script.
        	
            if(data == "sucess"){
            	alert("sucessfully added new user!!");
             window.location.href = "/pathTDS/index";
            }
            
            else{
            	alert("Data Already exist.....\nEmployee ID,Username& EmailId should be unique");	
            	 console.log("error"); 
            }
           
        },
        error: function(data){
     	   
         console.log("error");
        
        }
      });

      e.preventDefault();
	 }
	 else{
			alert("please fill  the required fields");
			return false;
		}

    });
 
 
  function updateuser(userid) {

	   
	
	    var url = "/pathTDS/addnewuser?userId=" + userid;
	   
	       var formData = $("#newuser").serializeArray();
	       //alert("user details updated successfully.");
	       $.ajax({
	    	  
	           type: "POST",
	           
	           data: formData,
	           url: url,
	           // serializes the form's elements.
	           success: function(data) {
	        	  
	               // show response from the php script.
	               if (data !== null) {

	                alert("user details updated successfully.");
	                window.location.href = "/pathTDS/viewuser";
	               }
	              },
	              error: function(data) {
	               console.log("error");
	              }
	             });

	        e.preventDefault();


	       }
  
  
  
  
  
 
				  function empidFunction() {
					  var empid = document.getElementById('employeid').value.length;
					  if(empid>=13){
						  $('#classname').show();
					  }
					  else{
						  $('#classname').hide(); 
					  }
					}
 
  
  
			 function empnameFunction(){
				 var empname = document.getElementById('Name').value.length;
				 if(empname>=61){
					 $('#emname').show(); 
				 }
				 else{
					 $('#emname').hide(); 
				 }
				 
			 }
			 
			 
			 
			 function deptFunction(){
				 var deprt = document.getElementById('department').value.length;
				 if(deprt>=41){
					 $('#dept').show(); 
				 }
				 else{
					 $('#dept').hide(); 
				 }
				 
			 } 
			 
			 
			 
			 
			 
			 function jobFunction(){
				 var jobtitle = document.getElementById('jobtitle').value.length;
				 if(jobtitle>=41){
					 $('#job').show();  
				 }
				 else{
					 $('#job').hide();   
				 }
					 
			 }
			 
			 
			 function usernameFunction(){
				 var username = document.getElementById('username').value.length; 
				 if(username>=13){
					 $('#uname').show();  
				 }
				 else{
					 $('#uname').hide();   
				 }
			 }
			 
			 function passwdFunction(){
				 var password = document.getElementById('password').value.length;  
				 if(password>=13){
					 
					 $('#upass').show();  
				 }
				 else{
					 $('#upass').hide();   
				 }
			 }
			 
			 
			 
			 