
 function checkdupli(){
 var exmid=$("#examId").val();
	 
	 
var inps = document.getElementsByName('exmisd[]');
	 
		var flag=false;
 
		var inp;
   
   
   for (var i = 0; i <inps.length; i++) {
			inp=inps[i];
			    
			if(inp.value==exmid){
				flag=true;
				break;
			}
         }
			
   if(flag==true){
	   //alert("Exam Id Alredy exist !!"); 
	   $('#exmssid').show(); 
	   document.getElementById("announceexam").disabled = true; 
   }
   else{
	   $('#exmssid').hide(); 
	   document.getElementById("announceexam").disabled = false; 
   }

 
 }