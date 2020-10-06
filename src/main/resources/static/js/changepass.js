 $("#changeuserpass").click(function(e){
	
	 var cpass=$("#cpass").val();
	 var pass=$("#pass").val();
	 var newpass=$("#npass").val();
	  var confmpass=$("#password").val();
	  var userId=$("#UId").val();
	 
	  if(newpass!=""&&confmpass!=""&&cpass!=""){
		  
		  if(newpass!=confmpass){
			  $('#cnfmpass').show();  
			  return false;
		  }
		  else{
			 var url = "/pathTDS/Changepass";
		    

		     $.ajax({
		        type: "GET",
		        url: url,
		        data: {Password: confmpass,userId:userId}, // serializes the form's elements.
		     success: function(data)
		        {
		        	
		            // show response from the php script.
		        	
		         
		            	alert("Password Changed Sucessfully  !! \nYou will be redirect to Login Page");
		             window.location.href = "/pathTDS/";
		          
		           
		            
		           
		        },
		        error: function(data){
		     	   
		         console.log("error");
		         
		        }
		      });

		      e.preventDefault();
			  
		  
		  }
		  
			 }
			 else{
					alert("please fill  the required fields");
					return false;
				}
  
	  
	  
	  
	 
 });
 
 function passwordFunction(){
	 var cpass=$("#cpass").val();
	 var pass=$("#pass").val(); 
	 if(cpass!=pass){
		 $('#curntpass').show();
		 }
	 else{
		 $('#curntpass').hide(); 
	 }
 }
 
  function confirmFunction(){
	  var newpass=$("#npass").val();
	  var confmpass=$("#password").val();
	  if(newpass!=confmpass){
		  $('#cnfmpass').show();  
	  }
	  else{
			 $('#cnfmpass').hide(); 
		 }
  }