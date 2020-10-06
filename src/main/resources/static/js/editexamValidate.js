
  function exmnameFunction(){
	  var a= $("#examName").val();
	  if(a==""){
		  $('#exmname').show();
	  }
  }
  
  
  
    function hideexmname(){
    	$('#exmname').hide();
    }
    
    
    
    function exmdateFunction(){
    	var a= $("#examName").val();
    	var b=$("#examDate").val();
  	  if(a==""&&b==""){
  		  $('#exmname').show();
  		 $('#exmdate').show();
  	  }
  	  else if(b==""){
  		 $('#exmdate').show();
  	  }
  	  else if(a==""){
  		$('#exmname').show(); 
  	  }
    }
    
    
    
    function hideemdate(){
    	 $('#exmdate').hide();
    }
    
    
    
    
       function exmfinaldate(){
       var a= $("#examName").val();
       	var b=$("#examDate").val();
       	var c=$("#finalExamDate").val();
     	  if(a==""&&b==""&&c==""){
     		  $('#exmname').show();
     		 $('#exmdate').show();
     		 $('#finalexmdate').show();
     	  }
     	  else if(b==""&&c==""){
     		 
      		 $('#exmdate').show();
      		 $('#finalexmdate').show();
      	  }
            else if(c==""){
     		 
      		 
      		 $('#finalexmdate').show();
      	  }
            else if(a==""){
          		$('#exmname').show(); 
          	  }
            else if(b==""){
            	$('#exmdate').show();
            }
       }
       
       function hidefinaldate(){
    	   $('#finalexmdate').hide();
       }
       
       
       
       
       
      function exmstartFunction(){
    	  var a= $("#examName").val();
         	var b=$("#examDate").val();
         	var c=$("#finalExamDate").val();
         	var d=$("#examTime").val();
       	  if(a==""&&b==""&&c==""&&d==""){
       		  $('#exmname').show();
       		 $('#exmdate').show();
       		 $('#finalexmdate').show();
       		$('#exmstart').show();
       	  }
       	  else if(b==""&&c==""&&d==""){
       		  
        		 $('#exmdate').show();
        		 $('#finalexmdate').show();
        		$('#exmstart').show();
        	  }
       	  else if(c==""&&d==""){
     	
   		    $('#finalexmdate').show();
   		   $('#exmstart').show();
   	       }
       	  
       	  
       	else if(a==""&&b==""){
       		$('#exmname').show();
       	    $('#exmdate').show();
      	  }
       	else if(a==""&&c==""){
       		$('#exmname').show();
       	 $('#finalexmdate').show();
      	  }
       	  
    	else if(a==""&&d==""){
       		$('#exmname').show();
       		$('#exmstart').show();
      	  }
    	else if(a==""&&b==""&&c==""){
       		$('#exmname').show();
       	    $('#exmdate').show();
        	 $('#finalexmdate').show();
      	  }
    	else if(a==""&&d==""&&b==""){
       		$('#exmname').show();
       	    $('#exmdate').show();
       		$('#exmstart').show();
      	  }
    	else if(b==""&&c==""){
       		
       	    $('#exmdate').show();
        	 $('#finalexmdate').show();
         }
        else if(b==""&&d==""){
       		
       	    $('#exmdate').show();
       	 $('#exmstart').show();
         }
    else if(b==""&&d==""&&c==""){
	     $('#finalexmdate').show();
       	    $('#exmdate').show();
       	 $('#exmstart').show();
         }
    else if(a==""){
    	$('#exmname').show();
    }
    else if(b==""){
    	$('#exmdate').show();
    }
    else if(c==""){
    	 $('#finalexmdate').show();
    }
    else if(d==""){
   		$('#exmstart').show(); 
   	  }
       	  
      }
       function hideexmst(){
    	   $('#exmstart').hide();  
       }
       
       function acctimeto(){
    	   var a= $("#examName").val();
        	var b=$("#examDate").val();
        	var c=$("#finalExamDate").val();
        	var d=$("#examTime").val();
        	var e=$("#accessibleTimeFrom").val();
      	  if(a==""&&b==""&&c==""&&d==""&&e==""){
      		  $('#exmname').show();
      		 $('#exmdate').show();
      		 $('#finalexmdate').show();
      		$('#exmstart').show();
      		$('#acctime').show();
      	  }
      	
      	  
      	  else  if(b==""&&c==""&&d==""&&e==""){
      		  
       		 $('#exmdate').show();
       		 $('#finalexmdate').show();
       		$('#exmstart').show();
       		$('#acctime').show();
       	  } 
      	else  if(c==""&&d==""&&e==""){
    		  
      		
      		 $('#finalexmdate').show();
      		$('#exmstart').show();
      		$('#acctime').show();
      	  } 
      	else  if(d==""&&e==""){
  		   $('#exmstart').show();
     		$('#acctime').show();
     	  } 
      		  
      	
       		  
         else if(a==""&&b==""&&c==""&&d==""){
      		  $('#exmname').show();
        		 $('#exmdate').show();
        		 $('#finalexmdate').show();
        		$('#exmstart').show();
        	  }
        	  else if(b==""&&c==""&&d==""){
        		  
         		 $('#exmdate').show();
         		 $('#finalexmdate').show();
         		$('#exmstart').show();
         	  }
        	
     	else if(a==""&&b==""&&c==""){
        		$('#exmname').show();
        	    $('#exmdate').show();
         	 $('#finalexmdate').show();
       	  }
     	else if(a==""&&d==""&&b==""){
        		$('#exmname').show();
        	    $('#exmdate').show();
        		$('#exmstart').show();
       	  }
     	else if(b==""&&c==""){
        		
        	    $('#exmdate').show();
         	 $('#finalexmdate').show();
          }
         else if(b==""&&d==""){
        		
        	    $('#exmdate').show();
        	 $('#exmstart').show();
          }
     else if(b==""&&d==""&&c==""){
 	     $('#finalexmdate').show();
        	    $('#exmdate').show();
        	 $('#exmstart').show();
          }
     else if(c==""&&d==""){
       	
		    $('#finalexmdate').show();
		   $('#exmstart').show();
	       }
 	  
     else if(b==""&&d==""){
 		
 	    $('#exmdate').show();
 	 $('#exmstart').show();
   }
 	else if(a==""&&b==""){
 		$('#exmname').show();
 	    $('#exmdate').show();
	  }
 	else if(a==""&&c==""){
 		$('#exmname').show();
 	 $('#finalexmdate').show();
	  }
 	  
	else if(a==""&&d==""){
 		$('#exmname').show();
 		$('#exmstart').show();
	  }
     else  if(e==""){
    	   	
   		$('#acctime').show();
   	  } 
   	 else if(a==""){
      	$('#exmname').show();
      }
      else if(b==""){
      	$('#exmdate').show();
      }
      else if(c==""){
      	 $('#finalexmdate').show();
      }
      else if(d==""){
     		$('#exmstart').show(); 
     	  }
    }
       
       
       function hideacctimefrom(){
    	   $('#acctime').hide();
       }
       
      
       function qnnoFunction(){
    	   var a= $("#examName").val();
       	var b=$("#examDate").val();
       	var c=$("#finalExamDate").val();
       	var d=$("#examTime").val();
       	var e=$("#accessibleTimeFrom").val();
       	var f=$("#accessibletimeTo").val();
     	  if(a==""&&b==""&&c==""&&d==""&&e==""&&f==""){
     		  $('#exmname').show();
     		 $('#exmdate').show();
     		 $('#finalexmdate').show();
     		$('#exmstart').show();
     		$('#acctime').show();
     		$('#accto').show();
     	  }
     	  
     	  else if(b==""&&c==""&&d==""&&e==""&&f==""){
     		 
      		 $('#exmdate').show();
      		 $('#finalexmdate').show();
      		$('#exmstart').show();
      		$('#acctime').show();
      		$('#accto').show();
      	  }
     	  else if(c==""&&d==""&&e==""&&f==""){
      		 
       		 
       		 $('#finalexmdate').show();
       		$('#exmstart').show();
       		$('#acctime').show();
       		$('#accto').show();
       	  }
     	  else if(d==""&&e==""&&f==""){
      		 
            $('#exmstart').show();
       		$('#acctime').show();
       		$('#accto').show();
       	  }
           else if(e==""&&f==""){
      		 
            $('#acctime').show();
       		$('#accto').show();
       	  }
           else if(f==""){
        	   $('#accto').show();  
           }
     	  
           else  if(a==""&&b==""&&c==""&&d==""&&e==""){
       		  $('#exmname').show();
       		 $('#exmdate').show();
       		 $('#finalexmdate').show();
       		$('#exmstart').show();
       		$('#acctime').show();
       	  }
       	
       	  
       	  else if(b==""&&c==""&&d==""&&e==""){
       		  
        		 $('#exmdate').show();
        		 $('#finalexmdate').show();
        		$('#exmstart').show();
        		$('#acctime').show();
        	  } 
       	else  if(c==""&&d==""&&e==""){
     		  
       		
       		 $('#finalexmdate').show();
       		$('#exmstart').show();
       		$('#acctime').show();
       	  } 
       	else  if(d==""&&e==""){
   		   $('#exmstart').show();
      		$('#acctime').show();
      	  } 
       		  
       	
        		  
          else if(a==""&&b==""&&c==""&&d==""){
       		  $('#exmname').show();
         		 $('#exmdate').show();
         		 $('#finalexmdate').show();
         		$('#exmstart').show();
         	  }
         	  else if(b==""&&c==""&&d==""){
         		  
          		 $('#exmdate').show();
          		 $('#finalexmdate').show();
          		$('#exmstart').show();
          	  }
         	
      	else if(a==""&&b==""&&c==""){
         		$('#exmname').show();
         	    $('#exmdate').show();
          	 $('#finalexmdate').show();
        	  }
      	else if(a==""&&d==""&&b==""){
         		$('#exmname').show();
         	    $('#exmdate').show();
         		$('#exmstart').show();
        	  }
      	else if(b==""&&c==""){
         		
         	    $('#exmdate').show();
          	 $('#finalexmdate').show();
           }
          else if(b==""&&d==""){
         		
         	    $('#exmdate').show();
         	 $('#exmstart').show();
           }
      else if(b==""&&d==""&&c==""){
  	     $('#finalexmdate').show();
         	    $('#exmdate').show();
         	 $('#exmstart').show();
           }
      else if(c==""&&d==""){
        	
 		    $('#finalexmdate').show();
 		   $('#exmstart').show();
 	       }
  	  
      else if(b==""&&d==""){
  		
  	    $('#exmdate').show();
  	 $('#exmstart').show();
    }
  	else if(a==""&&b==""){
  		$('#exmname').show();
  	    $('#exmdate').show();
 	  }
  	else if(a==""&&c==""){
  		$('#exmname').show();
  	 $('#finalexmdate').show();
 	  }
  	  
 	else if(a==""&&d==""){
  		$('#exmname').show();
  		$('#exmstart').show();
 	  }
      else  if(e==""){
     	   	
    		$('#acctime').show();
    	  } 
    	 else if(a==""){
       	$('#exmname').show();
       }
       else if(b==""){
       	$('#exmdate').show();
       }
       else if(c==""){
       	 $('#finalexmdate').show();
       }
       else if(d==""){
      		$('#exmstart').show(); 
      	  }
     	  
     	  
     	  
       }
       
       function hideacctimeto(){
    	   $('#accto').hide();
       }
       
       
     /*  function whoFunction(){
    	   var a= $("#examName").val();
          	var b=$("#examDate").val();
          	var c=$("#finalExamDate").val();
          	var d=$("#examTime").val();
          	var e=$("#accessibleTimeFrom").val();
          	var f=$("#accessibletimeTo").val();
          	var g=$("#accessibletimeTo").val();
        	  if(a==""&&b==""&&c==""&&d==""&&e==""&&f==""&&g==""){
        		  $('#exmname').show();
        		 $('#exmdate').show();
        		 $('#finalexmdate').show();
        		$('#exmstart').show();
        		$('#acctime').show();
        		$('#accto').show();
        	  }  
       }*/
       