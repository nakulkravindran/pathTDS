


    $("#loginButton").click(function(e){
    	
            var url = "/pathTDS/getUserDetails";
            var formData = $("#userLoginDetails").serializeArray();

            $.ajax({
               type: "POST",
               url: url,
               data: formData, // serializes the form's elements.
               success: function(data)
               {
                   //alert(data); // show response from the php script.
                   if(data === "success"){
                    window.location.href = "/pathTDS/index";
                   }
                   else{
                	   $('#logn').show();
                	  // console.log("error");
                   }
               },
               error: function(data){
            	   
                console.log("error");
               
               }
             });

             e.preventDefault();

    });
       
    
    
  $("#applicantLoginButton").click(function(e){
    	

                var url = "/pathTDS/validateApplicantDetails";
                var formData = $("#applicantLoginDetails").serializeArray();

                $.ajax({
                   type: "POST",
                   url: url,
                   data: formData, // serializes the form's elements.
                   success: function(data)
                   {
                       if(data === "examAttended"){
                           //alert(" Exam Already attended...!");
                           $('#attndexam').show();
                       }
                       else if(data != "failed"){
                            //alert(data); // show response from the php script.
                            window.location.href = "/pathTDS/examDetails?examId=" + data;
                       }
                       else{
                    	   $('#logn').show();
                    	   
                       }


                   },
                   error: function(data){
                    console.log("error");
                   }
                 });

                 e.preventDefault();

        });
    
    
    function usernameFunction(){
    	var a= $("#emailId").val();
		 if(a==""){
		 $('#username').show();
		}
    }
    
    function hideusername(){
    	 $('#username').hide();
    }
    
    function passwordFunction(){
    	var a= $("#emailId").val();
    	var b= $("#applicantPassword").val();
    	if(a==""&&b==""){
    		 $('#username').show();
    		 $('#pass').show();
    	}
    	else if(b==""){
    		 $('#pass').show();
    	}
    	
    }
    function hidepass(){
    	 $('#pass').hide();
    }
    function hideexamid(){
    	$('#exmid').hide();
    }
    function login(){
    	var a= $("#emailId").val();
    	var b= $("#applicantPassword").val();
    	var c=$("#examid").val();
    	if(a==""&&b==""&&c==""){
    		 $('#username').show();
    		 $('#pass').show();
    		 $('#exmid').show();
    	}
    	else if(b==""&&c==""){
    	
   		 $('#pass').show();
   		 $('#exmid').show();
    	}
    	else if(c==""){
    		 $('#exmid').show();
    	}
    }
    
     function adminlogin(){
    	 var a= $("#emailId").val();
     	var b= $("#applicantPassword").val();
     	if(a==""&&b==""){
     		 $('#username').show();
     		 $('#pass').show();
     	}
     	else if(b==""){
     		 $('#pass').show();
     	}
     }
