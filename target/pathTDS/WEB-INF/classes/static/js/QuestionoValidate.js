
 $("#questionPaperEditNumber").change(function(){
	 var qnno=$("#questionPaperEditNumber").val();
	 
	 
	  var inps = document.getElementsByName('qstno[]');
	 
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
 	  alert("Invalid QuestionPaper Number !!");
   }
   
  });

 
 
 $("#questionPaperNumberview").change(function(){
	 var qnno=$("#questionPaperNumberview").val();
	 
	 
	 var inps = document.getElementsByName('qstno[]');
	 
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
 	  alert("Invalid QuestionPaper Number !!");
   }
 });
 
 
 /*function Resultfunction(){
	 
	 
 var inps = document.getElementsByName('qstno[]');
 
	 var result=document.getElementsByName('qstpaperno[]');
	 var inp;
	 var res;
	 var duplicate = false;
	 for (var i = 0; i <inps.length; i++) {
			
	   for (var k = 0; k<result.length; k++) {
		
	   if(inps[i].value!=result[k].value){
		  alert("fsg");
	   }
			
		 }
		 
		
		   
	 }  
	
	
 }*/
	 
	
	
 
 

 
 
 
 
