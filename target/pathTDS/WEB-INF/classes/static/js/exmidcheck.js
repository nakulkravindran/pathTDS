$("#examlistview").change(function(){
	 var qnno=$("#examlistview").val();
	 
	 
	  var inps = document.getElementsByName('exmssid[]');
	 
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
 	  
   }
   else{
 	  alert("Invalid Exam Id !!");
 	 window.location.href = "/pathTDS/Examsview";
 	  return false;
   }
   
  });


$("#examlistedit").change(function(){
	 var qnno=$("#examlistedit").val();
	 
	 
	  var inps = document.getElementsByName('exmsid[]');
	 
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
	  
  }
  else{
	  alert("Invalid Exam Id !!");
	 window.location.href = "/pathTDS/viewExam";
	  return false;
  }
  
 });






