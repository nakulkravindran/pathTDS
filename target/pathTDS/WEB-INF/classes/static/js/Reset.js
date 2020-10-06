
function userFunction(){
	
	
	 //values.push($("input[name='Username[]']").map(function(){return $(this).val();}).get());
	
		var uname=$("#uname").val();
		var inps = document.getElementsByName('Username[]');
		 
		var flag=false;
    
		var inp;
      
      
      for (var i = 0; i <inps.length; i++) {
			inp=inps[i];
			    //alert("Username["+i+"].value="+inp.value);
			if(inp.value==uname){
				flag=true;
				break;
			}
            }
			
      if(flag==true){
    	  $('#usernamecheck').hide();
      }
      else{
    	  $('#usernamecheck').show();
      }
			
			  
			  
       }



$("#resetpassclick").click(function(e){
	
	 
	 var newpass=$("#npass").val();
	  var confmpass=$("#password").val();
	  var uname=$("#uname").val();
	 
	  if(newpass!=""&&confmpass!=""){
		  
		  if(newpass!=confmpass){
			  $('#cnfmpass').show();  
			  return false;
		  }
		  else{
			 var url = "/pathTDS/Reset";
		    

		     $.ajax({
		        type: "GET",
		        url: url,
		        data: {Password: confmpass,username:uname}, // serializes the form's elements.
		     success: function(data)
		        {
		        	
		            // show response from the php script.
		        	
		         
		            	alert("Password Updated Sucessfully!! ");
		             window.location.href = "/pathTDS/index";
		          
		           
		            
		           
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

