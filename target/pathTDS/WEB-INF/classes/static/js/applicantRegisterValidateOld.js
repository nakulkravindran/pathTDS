  

    function checkFunction(){
	
	 var k=$("input[name='pathEmployee']:checked").val();
	 if(k==undefined){
		 $('#pathempl').show(); 
		 document.getElementById("TrainingRegisterButton").disabled = true;
		
	 }
	 else{
			$('#pathempl').hide(); 
			document.getElementById("TrainingRegisterButton").disabled = false;
			
			
	      }
       }


 var checked;
	$(".pathEmployeeButton").click(function(){
		$('#pathempl').hide();
		$('#cname').hide();
		$('#cmpnyname').hide();
		$('#loc').hide();
		$('#dept').hide();
		$('#job').hide();
		$('#email').hide();
		$('#phn').hide();
		$('#valiemail').hide();	
	     checked = $('#pathEmployee').is(':checked');
	    if(checked){
	       
//	    	 var app=$("input[name='approvedByLineManager']:checked").val();
//	    	 
//	    		 if(app==undefined){
//	    			 
//	    			 $('#ser').hide();
//	    			 alert(app);
//	    		 }
//	    		 else{
//	    			
//	    			 $('#ser').show(); 
//	    		 }
	    		 
	    	 
	    	
	    	
	    	}
	   
	  });
	
	
	$(".approved").click(function(){
	
	
		 var p=$("#employeid").val();
			var q=$("#lineManager").val();
			var r=$("#lineManagerEmail").val();
			var t=$("#serviceDurationYear").val();
			 if(p==""&&q==""&&r==""&&t==""){
				 
				 $('#emid').show();
				 $('#line').show();
				 $('#linemail').show();
				 $('#ser').show();
			 }
			 else if(q==""&&r==""&&t==""){
				 
				 
				 $('#line').show();
				 $('#linemail').show();
				 $('#ser').show();
			 }
             else if(r==""&&t==""){
				 
				 $('#linemail').show();
				 $('#ser').show();
			 }
               else if(t==""){
				 
				
				 $('#ser').show();
			 }
	
	     });
	
	
	function yearFunction(){
		var t=$("#serviceDurationYear").val();
		if(t>30 || t<0){
			 
			$('#yearvalidate').show();
		}
		else{
			$('#yearvalidate').hide();	
		}
		
	}
	
	
	 function monthFunction(){
		 var w=$("#serviceDurationMonth").val();
		 if(w>11||w<0){
			 $('#monthvalidate').show(); 
		 }
		 else{
			 $('#monthvalidate').hide();  
		 }
	 }
	
	

	
	function emplyidFunction(){
		var p=$("#employeid").val();
		 if(p==""){
			 
			 $('#emid').show();
		 }
	   
    }
	
	function lineFunction(){
		
		var p=$("#employeid").val();
		var q=$("#lineManager").val();
		 if(p==""&&q==""){
			 
			 $('#emid').show();
			 $('#line').show();
		 }
		 else if(q==""){
			 
			 $('#line').show();
		 }
	}

   function lineemailFunction(){
	   var p=$("#employeid").val();
		var q=$("#lineManager").val();
		var r=$("#lineManagerEmail").val();
		 if(p==""&&q==""&&r==""){
			 
			 $('#emid').show();
			 $('#line').show();
			 $('#linemail').show();
		 }
		 else if(q==""&&r==""){
			 
			
			 $('#line').show();
			 $('#linemail').show();
		 }
		 else if(r==""){
			 
				
			 
			 $('#linemail').show();
		 }
		 }
   
   
  
	 
	 
	 
	function HideEm(){
		$('#emid').hide();
	}
    function Hideemid(){
    	$('#line').hide();
    }

  function Hideline(){
	  $('#linemail').hide(); 
  }


function Hidelineemail(){
	 $('#ser').hide();
}
 
 


  
  
  
  
  
  function nameFunction(){
	 var a= $("#candidateName").val();
	   
		 if(a==""&& checked==undefined){
			 $('#cname').show();
			 $('#pathempl').show(); 
		 }
		 else if(a==""){
			 $('#cname').show();
		 }
	 
}

  function Hidedname(){
	$('#cname').hide();
	 $('#cmpnyname').hide(); 
	 $('#loc').hide();
	 $('#dept').hide();
	 $('#job').hide(); 
	 $('#email').hide();
	 $('#phn').hide();
      }
  
     function Hidecmpnyname(){
    	 $('#cmpnyname').hide();  
     }
     
     function Hidecntryname(){
    	 $('#loc').hide();
     }
      
     
     
     function Hidedeptname(){
    	 $('#dept').hide(); 
     }
     
     function Hidejob(){
    	 $('#job').hide(); 
     }
     
    
     
     function Hidephn(){
    		$('#phn').hide();
     }
     
     
     
          
  function countrynameFunction(){
	  var a= $("#candidateName").val();
	  var b=$("#companyName").val();
	  if(a==""&&b==""&& checked==undefined){
		  $('#cname').show();
		  $('#cmpnyname').show();
		  $('#pathempl').show(); 
	  }
	  else if(b==""&& a==""){
		  $('#cname').show();
		  $('#cmpnyname').show();
	  }
	  
	  else if(b==""){
		  $('#cmpnyname').show();  
	  }
	  
  }
  
     function departFunction(){
    	
    	 var a= $("#candidateName").val();
   	     var b=$("#companyName").val();
   	     var c=$("#location").val();
   	  if(checked==undefined && a==""&&b==""&&c==""){
   		  
   		  $('#pathempl').show();
   		  $('#cname').show();
   		  $('#cmpnyname').show();
   		  $('#loc').show();
   		 
   	  } 
    	
   	  else if( a==""&& b==""&&c==""){
   		$('#cname').show();
   		  $('#cmpnyname').show();
   		  $('#loc').show();
   		 
   	  } 
   	  else if(c==""&& b==""){
   		 
   		$('#cmpnyname').show();
 		  $('#loc').show();
   	  }
   	else if(c==""){
  		 
 		  $('#loc').show();
 		 	  }
     }
    	
   	  function jobtitleFunction(){
   		 var a= $("#candidateName").val();
   	     var b=$("#companyName").val();
   	     var c=$("#location").val();
   	     var d=$("#department").val();
   	     
   	   if(checked==undefined && a==""&&b==""&&c==""&&d==""){
   		 
   		   $('#pathempl').show(); 
   		  $('#cname').show();
   		  $('#cmpnyname').show();
   		  $('#loc').show();
   		 $('#dept').show();
   	  } 
   	     
   	     else if(a==""&&b==""&&c==""&&d==""){
   		 
   		  $('#cname').show();
   		  $('#cmpnyname').show();
   		  $('#loc').show();
   		 $('#dept').show();
   	  } 
   	  else if(b==""&&c==""&&d==""){
   		 
   		  
   		  $('#cmpnyname').show();
   		  $('#loc').show();
   		 $('#dept').show();
   	  }
   	 else if(c==""&&d==""){
   		 $('#loc').show();
  		 $('#dept').show();
  	  }
   	  
   	else if(d==""){
  		 
 		 $('#dept').show();
 	  }
   	  }
   	  
   	 
   	  
   	  function emailFunction(){
   		 var a= $("#candidateName").val();
   	     var b=$("#companyName").val();
   	     var c=$("#location").val();
   	     var d=$("#department").val();
   	     var e=$("#jobTitle").val();
   	     
   	   if(checked==undefined &&a==""&&b==""&&c==""&&d==""&&e==""){
   		 $('#pathempl').show(); 
   		  $('#cname').show();
   		  $('#cmpnyname').show();
   		  $('#loc').show();
   		 $('#dept').show();
   		$('#job').show();
   	  }  
   	  
   	     else if(a==""&&b==""&&c==""&&d==""&&e==""){
   		 
   		  $('#cname').show();
   		  $('#cmpnyname').show();
   		  $('#loc').show();
   		 $('#dept').show();
   		$('#job').show();
   	  }  
   	  
   	  
   	  else if (b==""&&c==""&&d==""&&e==""){
   		 
   		 
   		  $('#cmpnyname').show();
   		  $('#loc').show();
   		 $('#dept').show();
   		$('#job').show();
   	  }
   	  
   	 else if (c==""&&d==""&&e==""){
   		 $('#loc').show();
  		 $('#dept').show();
  		$('#job').show();
  	  }
   	else if (d==""&&e==""){
  		
 		 $('#dept').show();
 		$('#job').show();
 	  }
   	else if (e==""){
  		
		 
		$('#job').show();
	  } 
   	  }
   	  
   	  
   	  
   	  function phoneFunction(){
   		  
   		 var a= $("#candidateName").val();
   	     var b=$("#companyName").val();
   	     var c=$("#location").val();
   	     var d=$("#department").val();
   	     var e=$("#jobTitle").val();
   	     var f=$("#emailId").val();
   	  
   	     if(checked==undefined &&a==""&&b==""&&c==""&&d==""&&e==""&&f==""){
   	    	$('#pathempl').show(); 
   		  $('#cname').show();
   		  $('#cmpnyname').show();
   		  $('#loc').show();
   		 $('#dept').show();
   		$('#job').show();
   		$('#email').show();
   	  }
   	     
   	     else if(a==""&&b==""&&c==""&&d==""&&e==""&&f==""){
   		 
   		  $('#cname').show();
   		  $('#cmpnyname').show();
   		  $('#loc').show();
   		 $('#dept').show();
   		$('#job').show();
   		$('#email').show();
   	  } 
   	  else if(b==""&&c==""&&d==""&&e==""&&f==""){
   		 
   		 
   		  $('#cmpnyname').show();
   		  $('#loc').show();
   		 $('#dept').show();
   		$('#job').show();
   		$('#email').show();
   	  } 
   	 else if(c==""&&d==""&&e==""&&f==""){
   		 
   	     $('#loc').show();
  		 $('#dept').show();
  		$('#job').show();
  		$('#email').show();
  	  } 
   else if(d==""&&e==""&&f==""){
   		 
   	   
  		 $('#dept').show();
  		$('#job').show();
  		$('#email').show();
  	  } 
   else if(e==""&&f==""){
 		 
   	   
		
		$('#job').show();
		$('#email').show();
	  } 
   else if(f==""){
 		 
   	   $('#email').show();
	  } 
   	  }
   	  
   	  
   	 
   	  function remarkfunction(){
   		 var a= $("#candidateName").val();
   	     var b=$("#companyName").val();
   	     var c=$("#location").val();
   	     var d=$("#department").val();
   	     var e=$("#jobTitle").val();
   	     var f=$("#emailId").val();
   	     var g=$("#phoneNumber").val();
   	     
   	  if(checked==undefined && a==""&&b==""&&c==""&&d==""&&e==""&&f==""&&g==""){
   		$('#pathempl').show();  
   		  $('#cname').show();
   		  $('#cmpnyname').show();
   		  $('#loc').show();
   		 $('#dept').show();
   		$('#job').show();
   		$('#email').show();
   		$('#phn').show();
   	  } 
   	     
   	     else if(a==""&&b==""&&c==""&&d==""&&e==""&&f==""&&g==""){
   		 
   		  $('#cname').show();
   		  $('#cmpnyname').show();
   		  $('#loc').show();
   		 $('#dept').show();
   		$('#job').show();
   		$('#email').show();
   		$('#phn').show();
   	  } 
   	  
   	  else if(b==""&&c==""&&d==""&&e==""&&f==""&&g==""){
   		 
   		 
   		  $('#cmpnyname').show();
   		  $('#loc').show();
   		 $('#dept').show();
   		$('#job').show();
   		$('#email').show();
   		$('#phn').show();
   	  } 
   	  
   	  else if(b==""&&c==""&&d==""&&e==""&&f==""&&g==""){
   		 
   		 
   		  $('#cmpnyname').show();
   		  $('#loc').show();
   		 $('#dept').show();
   		$('#job').show();
   		$('#email').show();
   		$('#phn').show();
   	  } 
   	  else if(c==""&&d==""&&e==""&&f==""&&g==""){
    		 
    	 $('#loc').show();
   		 $('#dept').show();
   		$('#job').show();
   		$('#email').show();
   		$('#phn').show();
   	  } 
   	  
   	 else if(d==""&&e==""&&f==""&&g==""){
		 
    	 
   		 $('#dept').show();
   		$('#job').show();
   		$('#email').show();
   		$('#phn').show();
   	  } 
   	  
   	 else if(e==""&&f==""&&g==""){
		 
    	 
   		$('#job').show();
   		$('#email').show();
   		$('#phn').show();
   	  } 
   	 else if(f==""&&g==""){
		 
    	
   		$('#email').show();
   		$('#phn').show();
   	  } 
   	  
   	 else if(g==""){
		 
    	
   		$('#phn').show();
   	  } 
   	 
   	  }
   	  
   	   function myFunction(){
   		var g=$("#phoneNumber").val();
   		var phno= /^\+?([0-9]{2})\)?[-. ]?([0-9]{4})[-. ]?([0-9]{4})$/;
   		if(g.match(phno)){
   			
   		$('#phone').hide(); 
   		
   	   } 
   		else{
   			$('#phone').show();	
   		}
   	 } 
   	
   	
   	 
   	function EmailValidate() {
   		$('#exstemail').hide();
   	    var x = $("#emailId").val();
   	    var atpos = x.indexOf("@");
   	    var dotpos = x.lastIndexOf(".");
   	    if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length) {
   	    	$('#valiemail').show();	
   	    	document.getElementById("examRegisterButton").disabled = true;
   	        return false;
   	    }
   	    else{
   	    	$('#valiemail').hide();	
   	    	document.getElementById("examRegisterButton").disabled = false;
   	    }
    }
   	
   	
   	function emailchecking(){
   		$('#exstemail').hide();
   	    var x = $("#Email").val();
   	    var atpos = x.indexOf("@");
   	    var dotpos = x.lastIndexOf(".");
   	    if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length) {
   	    	$('#emailvalid').show();	
   	    	document.getElementById("TrainingRegisterButton").disabled = true;
   	        return false;
   	    }
   	    else{
   	    	$('#emailvalid').hide();	
   	    	document.getElementById("TrainingRegisterButton").disabled = false;
   	    }
   	}
    
   	  
   	  function Emailexist(){
   		$('#email').hide(); 
      	 $('#valiemail').hide();
   		 var x = $("#emailId").val();

   	  var inps = document.getElementsByName('appemail[]');
   	  var flag=false;
    
	  var inp;


    for (var i = 0; i <inps.length; i++) {
		inp=inps[i];
		    
		if(inp.value==x){
			
			 $('#exstemail').show();
			 document.getElementById("examRegisterButton").disabled = true;
				}
		
     }
    
		 }
   	  
   
     
  
  