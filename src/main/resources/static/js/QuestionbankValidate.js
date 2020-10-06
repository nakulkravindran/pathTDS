
 var op1Image="";
     function op1changeimg(){                   //onchange of op1image
    	 op1Image= $("#option1Img").val();
    	
    			$('#op1chek').hide();
    			document.getElementById("saveandnxt").disabled = false;
    		
     }

     
     var op2Image="";
     function op2changeimg(){                   //onchange of op2image
    	 op2Image= $("#option2Img").val();
    	 $('#opt2chek').hide();
    	 var op1 = $("#option1").val();
    	 if(op1==""&&op1Image==""){
    		 $('#op1chek').show();
    			document.getElementById("saveandnxt").disabled = true; 
    	 }
    	 else{
    		 $('#opt2chek').hide();
    		 $('#op1chek').hide();
    	 }
    	 
     }


     var op3Image="";
     function op3changeimg(){                   //onchange of op3image
    	 op3Image= $("#option3Img").val();
    	 $('#op3tchek').hide();
    	 var op1 = $("#option1").val();
    	 var op2 = $("#option2").val();
    	
    	 if(op1==""&&op1Image==""&&op2==""&&op2Image==""){
    		 $('#op1chek').show();
    		 $('#opt2chek').show();
    			document.getElementById("saveandnxt").disabled = true; 
    	 }
    	 else if(op2==""&&op2Image==""){
    		 $('#opt2chek').show();
 			document.getElementById("saveandnxt").disabled = true;  
    	 }
    	 else if(op1==""&&op1Image==""){
    			$('#op1chek').show();
    	   document.getElementById("saveandnxt").disabled = true;
    	   	}
    	 else{
    		 $('#opt2chek').hide();
    		 $('#op1chek').hide();
    	 }
     }
     
     
     

     var op4Image="";
     function op4changeimg(){                   //onchange of op4image
    	 op4Image= $("#option4Img").val();
    	 var op1 = $("#option1").val();
       	 var op2 = $("#option2").val();
       	 var op3 = $("#option3").val();
       	if(op1==""&&op1Image==""&&op2==""&&op2Image==""&&op3==""&&op3Image==""){
       		
       		$('#op3tchek').show();
       		$('#opt2chek').show();
       		$('#op1chek').show();
       		document.getElementById("saveandnxt").disabled = true;
       	}
       	
       	else if(op2==""&&op2Image==""&&op3==""&&op3Image==""){
       		$('#op3tchek').show();
       		$('#opt2chek').show();
           document.getElementById("saveandnxt").disabled = true;
       	}
       	
       	else if(op1==""&&op1Image==""&&op3==""&&op3Image==""){
       		$('#op3tchek').show();
       		$('#op1chek').show();
           document.getElementById("saveandnxt").disabled = true;
       	}
       	else if(op1==""&&op1Image==""&&op2==""&&op2Image==""){
       		$('#op1chek').show();
       		$('#op2chek').show();
       document.getElementById("saveandnxt").disabled = true;
       	}
    	
       	
       	else if(op3==""&&op3Image==""){
       		$('#op3tchek').show();
       document.getElementById("saveandnxt").disabled = true;
       	}
        else if(op2==""&&op2Image==""){
   		 $('#opt2chek').show();
   		document.getElementById("saveandnxt").disabled = true;  
   	 }
   	 else if(op1==""&&op1Image==""){
   			$('#op1chek').show();
   	   document.getElementById("saveandnxt").disabled = true;
   	   	}
       	
       	else{
       		$('#opt2chek').hide();
       		$('#op3tchek').hide();
       		$('#op1chek').hide();
       		document.getElementById("saveandnxt").disabled = false;
       	}
    	 
     }



function op1ChFn(){    //onfocus of option2
	 var op1 = $("#option1").val();
	
	if(op1==""&&op1Image==""){
		
		$('#op1chek').show();
		document.getElementById("saveandnxt").disabled = true;
	}
	else{
		$('#op1chek').hide();
		document.getElementById("saveandnxt").disabled = false;
	}
}



    function op2ChFn(){    //onfocus of option3
	 var op1 = $("#option1").val();
	 var op2 = $("#option2").val();
	if(op1==""&&op1Image=="" &&op2==""&&op2Image==""){
		
		$('#opt2chek').show();
		$('#op1chek').show();
		document.getElementById("saveandnxt").disabled = true;
	}
	 else if(op2==""&&op2Image==""){
		 $('#opt2chek').show();
		document.getElementById("saveandnxt").disabled = true;  
	 }
	 else if(op1==""&&op1Image==""){
			$('#op1chek').show();
	   document.getElementById("saveandnxt").disabled = true;
	   	}
	else{
		$('#opt2chek').hide();
		$('#op1chek').hide();
		document.getElementById("saveandnxt").disabled = false;
	}
}
    
    
    
  function op3ChFn(){    //onfocus of option4
   	 var op1 = $("#option1").val();
   	 var op2 = $("#option2").val();
   	 var op3 = $("#option3").val();
   	if(op1==""&&op1Image==""&&op2==""&&op2Image==""&&op3==""&&op3Image==""){
   		
   		$('#op3tchek').show();
   		$('#opt2chek').show();
   		$('#op1chek').show();
   		document.getElementById("saveandnxt").disabled = true;
   	}
   	
   	else if(op2==""&&op2Image==""&&op3==""&&op3Image==""){
   		$('#op3tchek').show();
   		$('#opt2chek').show();
       document.getElementById("saveandnxt").disabled = true;
   	}
   	
   	else if(op1==""&&op1Image==""&&op3==""&&op3Image==""){
   		$('#op3tchek').show();
   		$('#op1chek').show();
       document.getElementById("saveandnxt").disabled = true;
   	}
   	else if(op1==""&&op1Image==""&&op2==""&&op2Image==""){
   		$('#op1chek').show();
   		$('#op2chek').show();
   document.getElementById("saveandnxt").disabled = true;
   	}
	
   	
   	else if(op3==""&&op3Image==""){
   		$('#op3tchek').show();
   document.getElementById("saveandnxt").disabled = true;
   	}
	else if(op1==""&&op1Image==""){
		$('#op1chek').show();
   document.getElementById("saveandnxt").disabled = true;
   	}
	else if(op2==""&&op2Image==""){
		$('#op2chek').show();
   document.getElementById("saveandnxt").disabled = true;
   	}
   	else{
   		$('#opt2chek').hide();
   		$('#op3tchek').hide();
   		$('#op1chek').hide();
   		document.getElementById("saveandnxt").disabled = false;
   	}
   }

    function checknulop1(){
    	 var op1 = $("#option1").val();
    	if(op1==""&&op1Image==""){
    		$('#op1chek').show();
       document.getElementById("saveandnxt").disabled = true;
       	}
    	else{
    		document.getElementById("saveandnxt").disabled = false;
    	}
    }
    
    function checknulop2(){
   	 var op2 = $("#option2").val();
   	if(op2==""&&op2Image==""){
   		$('#opt2chek').show();
      document.getElementById("saveandnxt").disabled = true;
      	}
   	else{
   		document.getElementById("saveandnxt").disabled = false;
   	}
   }
    function checknulop3(){
      	 var op3 = $("#option3").val();
      	if(op3==""&&op3Image==""){
      		$('#op3tchek').show();
         document.getElementById("saveandnxt").disabled = true;
         	}
      	else{
      		document.getElementById("saveandnxt").disabled = false;
      	}
      }
    
    
    

	 $(document).ready(function() {
		    $("#timeperQuestion").keydown(function (e) {
		        // Allow: backspace, delete, tab, escape, enter and .
		        if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110]) !== -1 ||
		             // Allow: Ctrl+A, Command+A
		            (e.keyCode === 65 && (e.ctrlKey === true || e.metaKey === true)) || 
		             // Allow: home, end, left, right, down, up
		            (e.keyCode >= 35 && e.keyCode <= 40)) {
		                 // let it happen, don't do anything
		                return;
		                
		        }
		        // Ensure that it is a number and stop the keypress
		        if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
		            e.preventDefault();
		        }
		    });
		});
	
	 

	 $(document).ready(function() {
		    $("#scoreperQuesion").keydown(function (e) {
		        // Allow: backspace, delete, tab, escape, enter and .
		        if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110]) !== -1 ||
		             // Allow: Ctrl+A, Command+A
		            (e.keyCode === 65 && (e.ctrlKey === true || e.metaKey === true)) || 
		             // Allow: home, end, left, right, down, up
		            (e.keyCode >= 35 && e.keyCode <= 40)) {
		                 // let it happen, don't do anything
		                return;
		                
		        }
		        // Ensure that it is a number and stop the keypress
		        if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
		            e.preventDefault();
		        }
		    });
		});
    
    function generateAnswerList(){

    	//$("#Answer").change(function (){

    	   var op1 = $("#option1").val();
    	    var op2 = $("#option2").val();
    	    var op3 = $("#option3").val();
    	    var op4 = $("#option4").val();
    	    var op5 = $("#option5").val();
    	  
    	   
    	   
    	    
    	    if(op1 != "" || op2 != "" || op3 != "" || op4 != "" || op5 != ""|| op1Image !=""||op2Image !=""||op3Image!=""||op4Image !=""){

    			        if(op1 != ""||op1Image !=""){
    			            $("#answer1").prop("disabled", false);
    			        }
    			        
    			        else{
    			            $("#answer1").prop("disabled", true);
    			        }
    	        
    	        
    	        
    	        
    	        if(op2 != ""||op2Image !=""){
    	             $("#answer2").prop("disabled", false);
    	        }
    	         else{
    	             $("#answer2").prop("disabled", true);
    	        }
    	        
    	        
    	        
    	        if(op3 != ""||op3Image !=""){
    	             $("#answer3").prop("disabled", false);
    	        }
    	        else{
    	             $("#answer3").prop("disabled", true);
    	        }
    	        if(op4 != ""||op4Image !=""){
    	             $("#answer4").prop("disabled", false);
    	        }
    	        else{
    	             $("#answer4").prop("disabled", true);
    	        }
    	        if(op5 != ""){
    	             $("#answer5").prop("disabled", false);
    	        }
    	        else{
    	             $("#answer5").prop("disabled", true);
    	         }
    	    }
    	    else{
    	        alert("Please enter valid options");

    	    }
    	}
    	//); 
    
    
    
    $("#className").change(function(){
   	 var qnno=$("#className").val();
   	 
   	 
   	  var inps = document.getElementsByName('classchek[]');
   	 
   		var flag=false;
    
   		var inp;
      
      
      for (var i = 0; i <inps.length; i++) {
   			inp=inps[i];
   			    
   			if(inp.value==qnno){
   				flag=true;
   				break;
   			}
            }
   			
      if(flag==true){
    	  document.getElementById("saveandnxt").disabled = false;
    	  
      }
      else{
    	  alert("Invalid Class Name !!");
    	  document.getElementById("saveandnxt").disabled = true;
      }
      
     });

    
    $("#Section").change(function(){
      	 var qnno=$("#Section").val();
      	 
      	 
      	  var inps = document.getElementsByName('sectionchek[]');
      	 
      		var flag=false;
       
      		var inp;
         
         
         for (var i = 0; i <inps.length; i++) {
      			inp=inps[i];
      			    
      			if(inp.value==qnno){
      				flag=true;
      				break;
      			}
               }
      			
         if(flag==true){
       	  document.getElementById("saveandnxt").disabled = false;
       	  
         }
         else{
       	  alert("Invalid Section !!");
       	  document.getElementById("saveandnxt").disabled = true;
         }
         
        });

    
    
    $("#difficultylevel").change(function(){
     	 var qnno=$("#difficultylevel").val();     	 
     	 
     	 var flag=false;
     	
     	 /* var inps = document.getElementsByName('difficultychek[]');    	
     	
     		var flag=false;
      
     		var inp;
        
     		 
        for (var i = 0; i <inps.length; i++) {
     			inp=inps[i];
     			
     			if(inp.value==qnno){
     				flag=true;
     				break;
     			}
              }*/
     	 
     	if(qnno=="1" || qnno=="2" || qnno=="3"){flag=true;}
     		
        if(flag==true){
      	  document.getElementById("saveandnxt").disabled = false;
      	  
        }
        else{
      	  alert("Invalid Difficulty Level !!");
      	  document.getElementById("saveandnxt").disabled = true;
        }
        
       });
    
    
    

   
    
    
    
    
    
    
    
    

