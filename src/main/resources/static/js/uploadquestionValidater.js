
															  function Checkqno() {
																  $('#noc').hide();
														var a= $("#questionPaperNumber").val();
															
													
																 if(a==""){
																	 
																 $('#qno').show();
																  }
																 
																 
													
															
			                                         }
															  
															  
											function noCheck(){
												var qnno = document.getElementById('questionPaperNumber').value.length; 
												if(qnno==20){
													
													 $('#noc').show();
												   }
												else{
													$('#noc').hide();
												}
											}				 					  
												
										function classcheck(){
										var classname=document.getElementById('className').value.length; 
										if(classname==30){
											

											 $('#checkcls').show();
											
										}
										else{
											 $('#checkcls').hide();
										}
										}					  
															  
															  
															  
															  
															  
															  
							 function MsgFunction(){

								 $('#qno').hide();
								 $('#classname').hide();
								 $('#pass').hide();
								 $('#time').hide();
								 $('#scoreqn').hide();
								 $('#tottimeexam').hide();
								 $('#noofquest').hide();
								 $('#maxscore').hide();
								 $('#dificult').hide();
								 $('#quesn').hide();
								 $('#session').hide(); 
								 $('#sect1').hide(); 
								 $('#sect2').hide();
								 $('#sect3').hide();
								 document.getElementById("saveandnxt").disabled = false; 
							 }

				 function Hidediv(){
					 $('#classname').hide();
					 document.getElementById("saveandnxt").disabled = false; 

				 }
	 function Hidepass(){
		 $('#pass').hide();
		 document.getElementById("saveandnxt").disabled = false; 
	 }

	 function HideTime(){
		 $('#time').hide();
		 document.getElementById("saveandnxt").disabled = false; 
	 }

	 function HideScore(){
		 $('#scoreqn').hide();
		 document.getElementById("saveandnxt").disabled = false; 
	 }

	 function HideTotaltime(){
		 $('#tottimeexam').hide();
		 document.getElementById("saveandnxt").disabled = false; 
	 }

	 function Hidenoofquest(){
		 $('#noofquest').hide();
		 document.getElementById("saveandnxt").disabled = false; 
	 }

	 function Hidemaxscore(){

		 $('#maxscore').hide();
		 document.getElementById("saveandnxt").disabled = false; 
	  }


	 function Hidedificult(){
		 $('#dificult').hide();
		 document.getElementById("saveandnxt").disabled = false; 
	 }

	 function HidedQuest(){
		 $('#quesn').hide();
		 document.getElementById("saveandnxt").disabled = false; 
	 }
	 function Hidedop1(){
		 $('#op1').hide();
		 $('#op1chek').hide();
		 document.getElementById("saveandnxt").disabled = false; 
	 }

	 function Hidedop2(){
		 $('#op2').hide();
		 document.getElementById("saveandnxt").disabled = false; 
	 }




		 function PassFunction(){
			 $('#checkcls').hide();
			 $('#noc').hide();
			 var a= $("#questionPaperNumber").val();
			 var b=$("#className").val();
			 var c=$("#passPercentage").val();

			 if(a==""&& b==""){

				 $('#classname').show();
				 $('#qno').show();


			 }
			 else if(b==""){
				 $('#classname').show();

			 }
		   }



			 function Passmsg(){
				 var c=$("#passPercentage").val();
				 
				 if(c>100){
					 $('#passmsg').show();
					 var passPercentage=$("#passPercentage").val();
					 document.getElementById("passPercentage").value = "100";
				 }
				 else{
					 $('#passmsg').hide();
				} }
			  

			 
			 
			 $(document).ready(function() {
				    $("#passPercentage").keydown(function (e) {
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
				    $("#timePerQuestion").keydown(function (e) {
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
			 
			 
			 
			 
			 
			 function digitfunction(){
				 var timePerQuestion = document.getElementById('timePerQuestion').value.length;
				 if(timePerQuestion>=5){
					 $('#digit').show();
				 }
				 else{
					 $('#digit').hide();	 
				 }
			 }
			 
			 
			 $(document).ready(function() {
				    $("#scorePerQuestion").keydown(function (e) {
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
				    $("#totalTimeAllowedForExam").keydown(function (e) {
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
				    $("#noOfQuestionsForEvaluation").keydown(function (e) {
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
				    $("#maximumScore").keydown(function (e) {
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
			 
			 
			 
			 
			 function scorecheck(){
				 var scorePerQuestion = document.getElementById('scorePerQuestion').value.length; 
				 if(scorePerQuestion>=3){
					 $('#scre').show(); 
				 }
				 else{
					 $('#scre').hide();  
				 }
			 }
			 
			 
			 function checksec1(){
				 var section1 = document.getElementById('section1').value.length;
				 if(section1>=31){
					 $('#cksec1').show();  
				 }
				 else{
					 $('#cksec1').hide(); 
				 }
			 }
			 
			 function checksec2(){
				
				 var section2 = document.getElementById('section2').value.length;
				 if(section2>=31){
					 $('#cksec2').show();  
				 }
				 else{
					 $('#cksec2').hide(); 
				 }
			 }
		
			 function checksec3(){
					
				 var section3 = document.getElementById('section3').value.length;
				 if(section3>=31){
					 $('#cksec3').show();  
				 }
				 else{
					 $('#cksec3').hide(); 
				 }
			 }
			 
			 function checktot(){
				 var totalTimeAllowedForExam = document.getElementById('totalTimeAllowedForExam').value.length; 
				 if(totalTimeAllowedForExam>=5){
					 $('#totex').show();   
				 }
				 else{
					 $('#totex').hide();  
				 }
			 }
			 
			 function checkqun(){
				 var noOfQuestionsForEvaluation = document.getElementById('noOfQuestionsForEvaluation').value.length;  
				 if(noOfQuestionsForEvaluation>4){
					 $('#noqnev').show();   
				 } 
				 else{
					 $('#noqnev').hide();  
				 }
				 }
			 
			 
			 function checkMaxscre(){
				 var maximumScore = document.getElementById('maximumScore').value.length;  
				 if(maximumScore>=7){
					 $('#maxev').show();   
				 }
				 else{
					 $('#maxev').hide();  
				 }
			 }
			 
			 
			 
   

	function TimeFunction(){
	    var a= $("#questionPaperNumber").val();
		 var b=$("#className").val();
		 var c=$("#passPercentage").val();
		 $('#passmsg').hide();
		 $('#checkcls').hide();
		 $('#noc').hide();
		 if(a==""&& b=="" && c=="" ){

			 $('#classname').show();
			 $('#qno').show();
			 $('#pass').show();
			 $('#passmsg').hide();

		 }

		 else if(a==""&& b==""){
			 $('#classname').show();
			 $('#qno').show();
			 $('#passmsg').hide();

		 }
		 else if(b==""&& c==""){
			 $('#classname').show();
		     $('#pass').show();
		     $('#passmsg').hide();


        }
		 else if(a==""&& c==""){
			 $('#qno').show();
		     $('#pass').show();
		     $('#passmsg').hide();


        }
		 else if(c==""){
			 $('#pass').show();
			 $('#passmsg').hide();

		 }
  }


  function ScoreFunction(){

    	var a= $("#questionPaperNumber").val();
		 var b=$("#className").val();
		 var c=$("#passPercentage").val();
		 var d=$("#timePerQuestion").val();
		   if(a==""&& b=="" && c==""&&d=="" ){

			 $('#classname').show();
			 $('#qno').show();
			 $('#pass').show();
			 $('#time').show();

		 }

		   else if(a==""&& b=="" && c=="" ){

				 $('#classname').show();
				 $('#qno').show();
				 $('#pass').show();

			 }
		   else if(a==""&& c=="" && d=="" ){


				 $('#qno').show();
				 $('#pass').show();
				 $('#time').show();

			 }
		   else if(b==""&& c=="" && d=="" ){


			   $('#classname').show();
				 $('#pass').show();
				 $('#time').show();

			 }
		   else if(d==""){
			    $('#time').show();

		   }

  }

   function TotimeFunction(){

	  var a= $("#questionPaperNumber").val();
		 var b=$("#className").val();
		 var c=$("#passPercentage").val();
		 var d=$("#timePerQuestion").val();
		 var e=$("#scorePerQuestion").val();
		 var section1=$("#section1").val();
  		 var section2=$("#section2").val();
  		 var section3=$("#section3").val();
		   if(a==""&& b=="" && c==""&&d=="" &&e==""&&section1=="Default"&&section2=="Default"&&section3=="Default"){

			 $('#classname').show();
			 $('#qno').show();
			 $('#pass').show();
			 $('#time').show();
			 $('#scoreqn').show();
			 $('#sect1').show(); 
			 $('#sect2').show();
			 $('#sect3').show();


		 }

		   else if(a==""&& b=="" && c==""&&d==""&&section1=="Default"&&section2=="Default"&&section3=="Default"){

				 $('#classname').show();
				 $('#qno').show();
				 $('#pass').show();
				 $('#time').show();
				 $('#scoreqn').show();
				 $('#sect1').show(); 
				 $('#sect2').show();
				 $('#sect3').show();


			 }
		   else if( b=="" && c==""&&d==""&&e==""&&section1==""&&section2==""&&section3==""){

				 $('#classname').show();
				 $('#pass').show();
				 $('#time').show();
				 $('#scoreqn').show();
				 $('#sect1').show(); 
				 $('#sect2').show();
				 $('#sect3').show();


			 }
		   else if(c==""&&d==""&&e==""&&section1==""&&section2==""&&section3==""){

				$('#pass').show();
				 $('#time').show();
				 $('#scoreqn').show();
				 $('#sect1').show(); 
				 $('#sect2').show();
				 $('#sect3').show();


			 }
		   else if(d==""&&e==""&&section1==""&&section2==""&&section3==""){
			   $('#time').show();
				 $('#scoreqn').show();
				 $('#sect1').show(); 
				 $('#sect2').show();
				 $('#sect3').show();



		   }

		  else if(e==""&&section1==""&&section2==""&&section3==""){
			   $('#scoreqn').show();
			   $('#sect1').show(); 
				 $('#sect2').show();
				 $('#sect3').show();


		   }
		  else if(section1==""&&section2==""&&section3==""){
			   
			   $('#sect1').show(); 
				 $('#sect2').show();
				 $('#sect3').show();


		   }
		  else if(section2==""&&section3==""){
			   
			  
				 $('#sect2').show();
				 $('#sect3').show();


		   }
		  else if(section3==""){
			   
			  
				
				 $('#sect3').show();


		   }
  }


  function noqestFunction(){

 	 var a= $("#questionPaperNumber").val();
		 var b=$("#className").val();
		 var c=$("#passPercentage").val();
		 var d=$("#timePerQuestion").val();
		 var e=$("#scorePerQuestion").val();
		 var f=$("#totalTimeAllowedForExam").val();
		 var section1=$("#section1").val();
  		 var section2=$("#section2").val();
  		 var section3=$("#section3").val();

		 if(a==""&& b=="" && c==""&&d=="" &&e=="" &&f==""&&section1=="Default"&&section2=="Default"&&section3=="Default"){

			 $('#classname').show();
			 $('#qno').show();
			 $('#pass').show();
			 $('#time').show();
			 $('#scoreqn').show();
			 $('#tottimeexam').show();
			 $('#sect1').show(); 
			 $('#sect2').show();
			 $('#sect3').show();

		 }
		 else if(b=="" && c==""&&d=="" &&e=="" &&f==""&&section1==""&&section2==""&&section3==""){
			
			 $('#classname').show();
			
			 $('#pass').show();
			 $('#time').show();
			 $('#scoreqn').show();
			 $('#tottimeexam').show();
			 $('#sect1').show(); 
			 $('#sect2').show();
			 $('#sect3').show();
		 }
		 else if(c==""&&d=="" &&e=="" &&f==""&&section1==""&&section2==""&&section3==""){


			 $('#pass').show();
			 $('#time').show();
			 $('#scoreqn').show();
			 $('#tottimeexam').show();
			 $('#sect1').show(); 
			 $('#sect2').show();
			 $('#sect3').show();

		 }
		 else if(d=="" &&e=="" &&f==""&&section1==""&&section2==""&&section3==""){

			 $('#time').show();
			 $('#scoreqn').show();
			 $('#tottimeexam').show();
			 $('#sect1').show(); 
			 $('#sect2').show();
			 $('#sect3').show();

		 }
		 else if(e=="" &&f==""&&section1==""&&section2==""&&section3==""){

			 $('#scoreqn').show();
			 $('#tottimeexam').show();
			 $('#sect1').show(); 
			 $('#sect2').show();
			 $('#sect3').show();

		 }
       else if(f==""&&section1==""&&section2==""&&section3==""){


			 $('#tottimeexam').show();
			 $('#sect1').show(); 
			 $('#sect2').show();
			 $('#sect3').show();

		 }
       else if(f==""&&section2==""&&section3==""){


			 $('#tottimeexam').show();
			
			 $('#sect2').show();
			 $('#sect3').show();

		 }
       else if(f==""&&section3==""){


			 $('#tottimeexam').show();
			
			 
			 $('#sect3').show();

		 }
       else if(f==""){


			 $('#tottimeexam').show();
       }
  	

  }
			

	

        function MaxscoreFunction(){

        	 var a= $("#questionPaperNumber").val();
    		 var b=$("#className").val();
    		 var c=$("#passPercentage").val();
    		 var d=$("#timePerQuestion").val();
    		 var e=$("#scorePerQuestion").val();
    		 var f=$("#totalTimeAllowedForExam").val();
    		var g=$("#noOfQuestionsForEvaluation").val();
    		var section1=$("#section1").val();
     		 var section2=$("#section2").val();
     		 var section3=$("#section3").val();
    		 if(a==""&& b=="" && c==""&&d=="" &&e=="" &&f==""&&g==""&&section1=="Default"&&section2=="Default"&&section3=="Default"){

    			 $('#classname').show();
    			 $('#qno').show();
    			 $('#pass').show();
    			 $('#time').show();
    			 $('#scoreqn').show();
    			 $('#tottimeexam').show();
    			 $('#noofquest').show();
    			 $('#sect1').show(); 
    			 $('#sect2').show();
    			 $('#sect3').show();

    		 }

    		 else if( b=="" && c==""&&d=="" &&e=="" &&f==""&&g==""&&section1==""&&section2==""&&section3==""){

    			 $('#classname').show();
    			 $('#pass').show();
    			 $('#time').show();
    			 $('#scoreqn').show();
    			 $('#tottimeexam').show();
    			 $('#noofquest').show();
    			 $('#sect1').show(); 
    			 $('#sect2').show();
    			 $('#sect3').show();


    		 }
    		 else if(c==""&&d=="" &&e=="" &&f==""&&g==""&&section1==""&&section2==""&&section3==""){


    			 $('#pass').show();
    			 $('#time').show();
    			 $('#scoreqn').show();
    			 $('#tottimeexam').show();
    			 $('#noofquest').show();
    			 $('#sect1').show(); 
    			 $('#sect2').show();
    			 $('#sect3').show();


    		 }


    		 else if(d=="" &&e=="" &&f==""&&g==""&&section1==""&&section2==""&&section3==""){

    			 $('#time').show();
    			 $('#scoreqn').show();
    			 $('#tottimeexam').show();
    			 $('#noofquest').show();
    			 $('#sect1').show(); 
    			 $('#sect2').show();
    			 $('#sect3').show();


    		 }
    		 else if(e=="" &&f==""&&g==""&&section1==""&&section2==""&&section3==""){

    			 $('#scoreqn').show();
    			 $('#tottimeexam').show();
    			 $('#noofquest').show();
    			 $('#sect1').show(); 
    			 $('#sect2').show();
    			 $('#sect3').show();


    		 }
        else if(f==""&&g==""&&section1==""&&section2==""&&section3==""){


    			 $('#tottimeexam').show();
    			 $('#noofquest').show();
    			 $('#sect1').show(); 
    			 $('#sect2').show();
    			 $('#sect3').show();


    		 }
        else if(g==""&&section1==""&&section2==""&&section3==""){


			 $('#noofquest').show();
			 $('#sect1').show(); 
			 $('#sect2').show();
			 $('#sect3').show();

         }
        else if(g==""&&section2==""&&section3==""){


			 $('#noofquest').show();
			
			 $('#sect2').show();
			 $('#sect3').show();

        }
       
        else if(g==""&&f==""&&section3==""){


			 $('#noofquest').show();
			 $('#tottimeexam').show();
			 $('#sect3').show();

      }
        else if(g==""&&f==""&&section2==""){


			 $('#noofquest').show();
			 $('#tottimeexam').show();
			 $('#sect2').show();

     }
        else if(g==""&&f==""&&section1==""){


			 $('#noofquest').show();
			 $('#tottimeexam').show();
			 $('#sect1').show();

    }
        else if(g==""&&f==""){


			 $('#noofquest').show();
			 $('#tottimeexam').show();

     }
        else if(g==""&&section3==""){


			 $('#noofquest').show();
	             $('#sect3').show();

      }
        else if(g==""){


			 $('#noofquest').show();
	            

      }


        }

		

        function DificultFunction(){
        	var a= $("#questionPaperNumber").val();
    		 var b=$("#className").val();
    		 var c=$("#passPercentage").val();
    		 var d=$("#timePerQuestion").val();
    		 var e=$("#scorePerQuestion").val();
    		 var f=$("#totalTimeAllowedForExam").val();
    		var g=$("#noOfQuestionsForEvaluation").val();
    		var h=$("#maximumScore").val();
    		 if(a==""&& b=="" && c==""&&d=="" &&e=="" &&f==""&&g==""&&h==""){

    			 $('#classname').show();
    			 $('#qno').show();
    			 $('#pass').show();
    			 $('#time').show();
    			 $('#scoreqn').show();
    			 $('#tottimeexam').show();
    			 $('#noofquest').show();
    			 $('#maxscore').show();

    		 }
    		 else if( b=="" && c==""&&d=="" &&e=="" &&f==""&&g==""&&h==""){

    			 $('#classname').show();

    			 $('#pass').show();
    			 $('#time').show();
    			 $('#scoreqn').show();
    			 $('#tottimeexam').show();
    			 $('#noofquest').show();
    			 $('#maxscore').show();

    		 }
    		 else if(c==""&&d=="" &&e=="" &&f==""&&g==""&&h==""){

    			 $('#pass').show();
    			 $('#time').show();
    			 $('#scoreqn').show();
    			 $('#tottimeexam').show();
    			 $('#noofquest').show();
    			 $('#maxscore').show();

    		 }
               else if(d=="" &&e=="" &&f==""&&g==""&&h==""){

    			 $('#time').show();
    			 $('#scoreqn').show();
    			 $('#tottimeexam').show();
    			 $('#noofquest').show();
    			 $('#maxscore').show();

    		 }

               else if(e=="" &&f==""&&g==""&&h==""){
    				$('#scoreqn').show();
      			 $('#tottimeexam').show();
      			 $('#noofquest').show();
      			 $('#maxscore').show();

      		 }

               else if(f==""&&g==""&&h==""){
   				 $('#tottimeexam').show();
     			 $('#noofquest').show();
     			 $('#maxscore').show();

     		 }
               else if(g==""&&h==""){
   				 $('#noofquest').show();
     			 $('#maxscore').show();

     		 }
               else if(h==""){

       			 $('#maxscore').show();

       		 }
        }



     function QuestionFunction(){
    	 var a= $("#questionPaperNumber").val();
		 var b=$("#className").val();
		 var c=$("#passPercentage").val();
		 var d=$("#timePerQuestion").val();
		 var e=$("#scorePerQuestion").val();
		 var f=$("#totalTimeAllowedForExam").val();
		var g=$("#noOfQuestionsForEvaluation").val();
		var h=$("#maximumScore").val();
		var i=$("#difficultyLevel").val();
		var section1=$("#section1").val();
		 var section2=$("#section2").val();
		 var section3=$("#section3").val();
		
		var ddl = document.getElementById("section");
		 var selectedValue = ddl.options[ddl.selectedIndex].value;
		   
		  
      if(a==""&& b=="" && c==""&&d=="" &&e=="" &&f==""&&g==""&&h==""&&i==""&&selectedValue == "selectcard"&&section1=="Default"&&section2=="Default"&&section3=="Default"){

			 $('#classname').show();
			 $('#qno').show();
			 $('#pass').show();
			 $('#time').show();
			 $('#scoreqn').show();
			 $('#tottimeexam').show();
			 $('#noofquest').show();
			 $('#maxscore').show();
			 $('#dificult').show();
			 $('#session').show();
			 $('#sect1').show(); 
			 $('#sect2').show();
			 $('#sect3').show();
			
		 }

		 else if(b=="" && c==""&&d=="" &&e=="" &&f==""&&g==""&&h==""&&i==""&&selectedValue == "selectcard"&&section1==""&&section2==""&&section3==""){

			 $('#classname').show();

			 $('#pass').show();
			 $('#time').show();
			 $('#scoreqn').show();
			 $('#tottimeexam').show();
			 $('#noofquest').show();
			 $('#maxscore').show();
			 $('#dificult').show();
			 $('#session').show();
			 $('#sect1').show(); 
			 $('#sect2').show();
			 $('#sect3').show();
		 }
		 else if(c==""&&d=="" &&e=="" &&f==""&&g==""&&h==""&&i==""&&selectedValue == "selectcard"&&section1==""&&section2==""&&section3==""){

			 $('#pass').show();
			 $('#time').show();
			 $('#scoreqn').show();
			 $('#tottimeexam').show();
			 $('#noofquest').show();
			 $('#maxscore').show();
			 $('#dificult').show();
			 $('#session').show();
			 $('#sect1').show(); 
			 $('#sect2').show();
			 $('#sect3').show();
		 }
		 else if(d=="" &&e=="" &&f==""&&g==""&&h==""&&i==""&&selectedValue == "selectcard"&&section1==""&&section2==""&&section3==""){

			 $('#time').show();
			 $('#scoreqn').show();
			 $('#tottimeexam').show();
			 $('#noofquest').show();
			 $('#maxscore').show();
			 $('#dificult').show();
			 $('#session').show();
			 $('#sect1').show(); 
			 $('#sect2').show();
			 $('#sect3').show();
		 }
      else if(e=="" &&f==""&&g==""&&h==""&&i==""&&selectedValue == "selectcard"&&section1==""&&section2==""&&section3==""){


			 $('#scoreqn').show();
			 $('#tottimeexam').show();
			 $('#noofquest').show();
			 $('#maxscore').show();
			 $('#dificult').show();
			 $('#session').show();
			 $('#sect1').show(); 
			 $('#sect2').show();
			 $('#sect3').show();
		 }
      else if(f==""&&g==""&&h==""&&i==""&&selectedValue == "selectcard"&&section1==""&&section2==""&&section3==""){


			 $('#tottimeexam').show();
			 $('#noofquest').show();
			 $('#maxscore').show();
			 $('#dificult').show();
			 $('#session').show();
			 $('#sect1').show(); 
			 $('#sect2').show();
			 $('#sect3').show();
		 }
      else if(f==""&&g==""&&h==""&&i==""&&selectedValue == "selectcard"){


			 $('#tottimeexam').show();
			 $('#noofquest').show();
			 $('#maxscore').show();
			 $('#dificult').show();
			 $('#session').show();
			
		 }
      
      else if(g==""&&h==""&&i==""&&selectedValue == "selectcard"&&section1==""&&section2==""&&section3==""){



			 $('#noofquest').show();
			 $('#maxscore').show();
			 $('#dificult').show();
			 $('#session').show();
			 $('#sect1').show(); 
			 $('#sect2').show();
			 $('#sect3').show();
		 }
      else if(h==""&&i==""&&selectedValue == "selectcard"&&section1==""&&section2==""&&section3==""){
	         $('#maxscore').show();
			 $('#dificult').show();
			 $('#session').show();
			 $('#sect1').show(); 
			 $('#sect2').show();
			 $('#sect3').show();
		 }
      else if(section1==""&&section2==""&&section3==""&&i==""&&selectedValue == "selectcard"){

    	  $('#dificult').show();
    	  $('#session').show();
    	  $('#sect1').show(); 
			 $('#sect2').show();
			 $('#sect3').show();
		 }
      else if(section1==""&&section2==""&&section3==""&&selectedValue == "selectcard"){
    	  $('#session').show();
    	  $('#sect1').show(); 
			 $('#sect2').show();
			 $('#sect3').show();
		 }
      else if(section2==""&&section3==""&&selectedValue == "selectcard"){
    	  $('#session').show();
    	 
			 $('#sect2').show();
			 $('#sect3').show();
		 }
      else if(f==""&&g==""&&h==""&&section3==""&&selectedValue == "selectcard"){
    	    $('#session').show();
    	    $('#noofquest').show();
    	    $('#tottimeexam').show();
			 $('#maxscore').show();
			 $('#sect3').show();
			 
		 }
      else if(g==""&&h==""&&section3==""&&selectedValue == "selectcard"){
    	  $('#session').show();
    	  $('#noofquest').show();
			 $('#maxscore').show();
			 $('#tottimeexam').show();
			 $('#sect3').show();
		 }
      else if(section3==""&&selectedValue == "selectcard"){
    	  $('#session').show();
    	 
			 
			 $('#sect3').show();
		 }
      else if(g==""&&h==""&&i==""&&selectedValue == "selectcard"){


			
			 $('#noofquest').show();
			 $('#maxscore').show();
			 $('#dificult').show();
			 $('#session').show();
			
		 }
      else if(h==""&&i==""&&selectedValue == "selectcard"){


			
			 
			 $('#maxscore').show();
			 $('#dificult').show();
			 $('#session').show();
			
		 }
    
      else if(selectedValue == "selectcard"){
    	  $('#session').show();
    	 
			 
			 
		 }

     }
     function hidesection(){
    	 $('#session').hide(); 
    	 
		 
     }

     function option1Function(){
    	 var a= $("#questionPaperNumber").val();
		 var b=$("#className").val();
		 var c=$("#passPercentage").val();
		 var d=$("#timePerQuestion").val();
		 var e=$("#scorePerQuestion").val();
		 var f=$("#totalTimeAllowedForExam").val();
		var g=$("#noOfQuestionsForEvaluation").val();
		var h=$("#maximumScore").val();
		var i=$("#difficultyLevel").val();
		var j=$("#Question").val();
		var ddl = document.getElementById("section");
		var selectedValue = ddl.options[ddl.selectedIndex].value;
		 if(a==""&& b=="" && c==""&&d=="" &&e=="" &&f==""&&g==""&&h==""&&i==""&&j==""&&selectedValue == "selectcard"){

			 $('#classname').show();
			 $('#qno').show();
			 $('#pass').show();
			 $('#time').show();
			 $('#scoreqn').show();
			 $('#tottimeexam').show();
			 $('#noofquest').show();
			 $('#maxscore').show();
			 $('#dificult').show();
			 $('#quesn').show();
			  $('#session').show();
			  document.getElementById("saveandnxt").disabled = true;

		 }

		 else if( b=="" && c==""&&d=="" &&e=="" &&f==""&&g==""&&h==""&&i==""&&j==""&&selectedValue == "selectcard"){

			 $('#classname').show();
		      $('#pass').show();
			 $('#time').show();
			 $('#scoreqn').show();
			 $('#tottimeexam').show();
			 $('#noofquest').show();
			 $('#maxscore').show();
			 $('#dificult').show();
			 $('#quesn').show();
			 $('#session').show();
			 document.getElementById("saveandnxt").disabled = true;

		 }
		 else if( c==""&&d=="" &&e=="" &&f==""&&g==""&&h==""&&i==""&&j==""&&selectedValue == "selectcard"){

			 $('#pass').show();
			 $('#time').show();
			 $('#scoreqn').show();
			 $('#tottimeexam').show();
			 $('#noofquest').show();
			 $('#maxscore').show();
			 $('#dificult').show();
			 $('#quesn').show();
			 $('#session').show();
			 document.getElementById("saveandnxt").disabled = true;

		 }
		 else if(d=="" &&e=="" &&f==""&&g==""&&h==""&&i==""&&j==""&&selectedValue == "selectcard"){


			 $('#time').show();
			 $('#scoreqn').show();
			 $('#tottimeexam').show();
			 $('#noofquest').show();
			 $('#maxscore').show();
			 $('#dificult').show();
			 $('#quesn').show();
			 $('#session').show();
			 document.getElementById("saveandnxt").disabled = true;

		 }
     else if(e=="" &&f==""&&g==""&&h==""&&i==""&&j==""&&selectedValue == "selectcard"){

    	   $('#scoreqn').show();
			 $('#tottimeexam').show();
			 $('#noofquest').show();
			 $('#maxscore').show();
			 $('#dificult').show();
			 $('#quesn').show();
			 $('#session').show();

			 document.getElementById("saveandnxt").disabled = true;
		 }

     else if(f==""&&g==""&&h==""&&i==""&&j==""&&selectedValue == "selectcard"){

		 $('#tottimeexam').show();
		 $('#noofquest').show();
		 $('#maxscore').show();
		 $('#dificult').show();
		 $('#quesn').show();
		 $('#session').show();
		 document.getElementById("saveandnxt").disabled = true;

	 }
     else if(g==""&&h==""&&i==""&&j==""&&selectedValue == "selectcard"){


		 $('#noofquest').show();
		 $('#maxscore').show();
		 $('#dificult').show();
		 $('#quesn').show();
		 $('#session').show();
		 document.getElementById("saveandnxt").disabled = true;

	 }
     else if(h==""&&i==""&&j==""&&selectedValue == "selectcard"){



		 $('#maxscore').show();
		 $('#dificult').show();
		 $('#quesn').show();
		 $('#session').show();
		 document.getElementById("saveandnxt").disabled = true;

	 }
     else if(i==""&&j==""&&selectedValue == "selectcard"){

         $('#dificult').show();
		 $('#quesn').show();
		 $('#session').show();
		 document.getElementById("saveandnxt").disabled = true;

	 }
     else if(j==""&&selectedValue == "selectcard"){


		 $('#quesn').show();
		 $('#session').show();
		 document.getElementById("saveandnxt").disabled = true;

	 }
     else if(j==""){


		 $('#quesn').show();
		 $('#session').show();
		 document.getElementById("saveandnxt").disabled = true;

	 }
     else{
    	 document.getElementById("saveandnxt").disabled = false; 
     }


     }


    
   
     function option2Function(){

    	 var a= $("#questionPaperNumber").val();
		 var b=$("#className").val();
		 var c=$("#passPercentage").val();
		 var d=$("#timePerQuestion").val();
		 var e=$("#scorePerQuestion").val();
		 var f=$("#totalTimeAllowedForExam").val();
		var g=$("#noOfQuestionsForEvaluation").val();
		var h=$("#maximumScore").val();
		var ddl = document.getElementById("section");
		 var selectedValue = ddl.options[ddl.selectedIndex].value;
		
		var j=$("#Question").val();
		var k=$("#option1").val();
		//alert(op1Img);
		 
		    
		
		 if(a==""&& b=="" && c==""&&d=="" &&e=="" &&f==""&&g==""&&h==""&&j==""&&k==""&&selectedValue == "selectcard"&&op1Img==""){

			 $('#classname').show();
			 $('#qno').show();
			 $('#pass').show();
			 $('#time').show();
			 $('#scoreqn').show();
			 $('#tottimeexam').show();
			 $('#noofquest').show();
			 $('#maxscore').show();
		
			 $('#quesn').show();
			 $('#session').show();
			// $('#op1').show();
			 $('#op1chek').show();
			 document.getElementById("saveandnxt").disabled = true;
			 document.getElementById("SubmitQuestionPaper").disabled = true;
		 }
		 

		 else if( b=="" && c==""&&d=="" &&e=="" &&f==""&&g==""&&h==""&&j==""&&k==""&&selectedValue == "selectcard"&&op1Img==""){

			 $('#classname').show();

			 $('#pass').show();
			 $('#time').show();
			 $('#scoreqn').show();
			 $('#tottimeexam').show();
			 $('#noofquest').show();
			 $('#maxscore').show();
			
			 $('#quesn').show();
			 $('#session').show();
			 $('#op1chek').show();
			// $('#op1').show();
			 document.getElementById("saveandnxt").disabled = true;
			 document.getElementById("SubmitQuestionPaper").disabled = true;
		 }
		 else if(c==""&&d=="" &&e=="" &&f==""&&g==""&&h==""&&j==""&&k==""&&selectedValue == "selectcard"&&op1Img==""){

			 $('#pass').show();
			 $('#time').show();
			 $('#scoreqn').show();
			 $('#tottimeexam').show();
			 $('#noofquest').show();
			 $('#maxscore').show();
			
			 $('#quesn').show();
			 $('#session').show();
			 $('#op1chek').show();
			 //$('#op1').show();
			 document.getElementById("saveandnxt").disabled = true;
			 document.getElementById("SubmitQuestionPaper").disabled = true;
		 }
		 else if(d=="" &&e=="" &&f==""&&g==""&&h==""&&i==""&&j==""&&k==""&&selectedValue == "selectcard"&&op1Img=="")
		 
			 {


			 $('#time').show();
			 $('#scoreqn').show();
			 $('#tottimeexam').show();
			 $('#noofquest').show();
			 $('#maxscore').show();
			
			 $('#quesn').show();
			 $('#session').show();
			 $('#op1chek').show();
			// $('#op1').show();
			 document.getElementById("saveandnxt").disabled = true;
			 document.getElementById("SubmitQuestionPaper").disabled = true;
		 }
		 else if(e=="" &&f==""&&g==""&&h==""&&i==""&&j==""&&k==""&&selectedValue == "selectcard"&&op1Img==""){

		     $('#scoreqn').show();
			 $('#tottimeexam').show();
			 $('#noofquest').show();
			 $('#maxscore').show();
			
			 $('#quesn').show();
			// $('#op1').show();
			 $('#session').show();
			 $('#op1chek').show();
			 document.getElementById("saveandnxt").disabled = true;
			 document.getElementById("SubmitQuestionPaper").disabled = true;
		 }
		 else if(f==""&&g==""&&h==""&&i==""&&j==""&&k==""&&selectedValue == "selectcard"&&op1Img==""){


			 $('#tottimeexam').show();
			 $('#noofquest').show();
			 $('#maxscore').show();
			
			 $('#quesn').show();
			 $('#op1chek').show();
			 //$('#op1').show();
			document.getElementById("saveandnxt").disabled = true;
			document.getElementById("SubmitQuestionPaper").disabled = true;
		 }

		 else if(g==""&&h==""&&i==""&&j==""&&k==""&&selectedValue == "selectcard"&&op1Img==""){

			 $('#noofquest').show();
			 $('#maxscore').show();
			
			 $('#quesn').show();
			// $('#op1').show();
			 $('#session').show();
			 $('#op1chek').show();
			document.getElementById("saveandnxt").disabled = true;
			document.getElementById("SubmitQuestionPaper").disabled = true;
		 }
		 else if(h==""&&j==""&&k==""&&selectedValue == "selectcard"&&op1Img==""){

			 $('#maxscore').show();
			
			 $('#quesn').show();
			// $('#op1').show();
			 $('#session').show();
			 $('#op1chek').show();
			document.getElementById("saveandnxt").disabled = true;
			document.getElementById("SubmitQuestionPaper").disabled = true;
		   }
		 else if(j==""&&k==""&&selectedValue == "selectcard"&&op1Img==""){

			
			 $('#quesn').show();
			// $('#op1').show();
			 $('#session').show();
			 document.getElementById("saveandnxt").disabled = true;
			 document.getElementById("SubmitQuestionPaper").disabled = true;
		   }

		 else if(j==""&&k==""&&op1Img==""){

			 $('#op1chek').show();
			 $('#quesn').show();
			 $('#op1').show();
			 document.getElementById("saveandnxt").disabled = true;
			 document.getElementById("SubmitQuestionPaper").disabled = true;
		   }
             else if(k==""&&op1Img==""){

            	 $('#op1chek').show();
			  document.getElementById("saveandnxt").disabled = true;
			  document.getElementById("SubmitQuestionPaper").disabled = true;
		   }
            
             else{
            	 document.getElementById("saveandnxt").disabled = false; 
            	 document.getElementById("SubmitQuestionPaper").disabled = false;
             }  		
        
     }
   

      function option3Function(){

    	  var a= $("#questionPaperNumber").val();
 		 var b=$("#className").val();
 		 var c=$("#passPercentage").val();
 		 var d=$("#timePerQuestion").val();
 		 var e=$("#scorePerQuestion").val();
 		 var f=$("#totalTimeAllowedForExam").val();
 		var g=$("#noOfQuestionsForEvaluation").val();
 		var h=$("#maximumScore").val();
 		
 		var j=$("#Question").val();
 		var k=$("#option1").val();
 		var l=$("#option2").val();
 		var ddl = document.getElementById("section");
		 var selectedValue = ddl.options[ddl.selectedIndex].value;
 		
 		
		  if(a==""&& b=="" && c==""&&d=="" &&e=="" &&f==""&&g==""&&h==""&&j==""&&k==""&&l==""&&selectedValue == "selectcard"&&op1Img==""&&op2Img==""){

 			 $('#classname').show();
 			 $('#qno').show();
 			 $('#pass').show();
 			 $('#time').show();
 			 $('#scoreqn').show();
 			 $('#tottimeexam').show();
 			 $('#noofquest').show();
 			 $('#maxscore').show();
 			 $('#session').show();
 			 $('#quesn').show();
 			 $('#op1chek').show();
 			// $('#op1').show();
 			$('#op2chek').show();
 			document.getElementById("saveandnxt").disabled = true;
 			document.getElementById("SubmitQuestionPaper").disabled = true;

 		 }
 		 else if(b=="" && c==""&&d=="" &&e=="" &&f==""&&g==""&&h==""&&j==""&&k==""&&l==""&&selectedValue == "selectcard"&&op1Img==""&&op2Img==""){

 			 $('#classname').show();
 			 $('#pass').show();
 			 $('#time').show();
 			 $('#scoreqn').show();
 			 $('#tottimeexam').show();
 			 $('#noofquest').show();
 			 $('#maxscore').show();
 			 $('#session').show();
 			 $('#quesn').show();
 			 //$('#op1').show();
 			//$('#op2').show();
 			$('#op1chek').show();
 			$('#op2chek').show();
 			document.getElementById("saveandnxt").disabled = true;
 			document.getElementById("SubmitQuestionPaper").disabled = true;

 		 }
 		 else if( c==""&&d=="" &&e=="" &&f==""&&g==""&&h==""&&j==""&&k==""&&l==""&&selectedValue == "selectcard"&&op1Img==""&&op2Img==""){


 			 $('#pass').show();
 			 $('#time').show();
 			 $('#scoreqn').show();
 			 $('#tottimeexam').show();
 			 $('#noofquest').show();
 			 $('#maxscore').show();
 			 $('#session').show();
 			 $('#quesn').show();
 			 //$('#op1').show();
 			//$('#op2').show();
 			$('#op1chek').show();
 			$('#op2chek').show();
 			document.getElementById("saveandnxt").disabled = true;
 			document.getElementById("SubmitQuestionPaper").disabled = true;

 		 }

      else if(d=="" &&e=="" &&f==""&&g==""&&h==""&&j==""&&k==""&&l==""&&selectedValue == "selectcard"&&op1Img==""&&op2Img==""){

 			 $('#time').show();
 			 $('#scoreqn').show();
 			 $('#tottimeexam').show();
 			 $('#noofquest').show();
 			 $('#maxscore').show();
 			 $('#session').show();
 			 $('#quesn').show();
 			// $('#op1').show();
 			//$('#op2').show();
 			$('#op1chek').show();
 			$('#op2chek').show();
 			document.getElementById("saveandnxt").disabled = true;
 			document.getElementById("SubmitQuestionPaper").disabled = true;

 		    }
      else if(e=="" &&f==""&&g==""&&h==""&&j==""&&k==""&&l==""&&selectedValue == "selectcard"&&op1Img==""&&op2Img==""){

    	     $('#scoreqn').show();
			 $('#tottimeexam').show();
			 $('#noofquest').show();
			 $('#maxscore').show();
			 $('#session').show();
			 $('#quesn').show();
			// $('#op1').show();
			//$('#op2').show();
			 $('#op1chek').show();
	 			$('#op2chek').show();
			document.getElementById("saveandnxt").disabled = true;
			document.getElementById("SubmitQuestionPaper").disabled = true;

		    }
      else if(f==""&&g==""&&h==""&&j==""&&k==""&&l==""&&selectedValue == "selectcard"&&op1Img==""&&op2Img==""){

 	         $('#tottimeexam').show();
			 $('#noofquest').show();
			 $('#maxscore').show();
			 $('#session').show();
			 $('#quesn').show();
			 //$('#op1').show();
			//$('#op2').show();
			 $('#op1chek').show();
	 			$('#op2chek').show();
			document.getElementById("saveandnxt").disabled = true;
			document.getElementById("SubmitQuestionPaper").disabled = true;

		    }

      else if(g==""&&h==""&&j==""&&k==""&&l==""&&selectedValue == "selectcard"&&op1Img==""&&op2Img==""){

	        $('#noofquest').show();
			 $('#maxscore').show();
			 $('#session').show();
			 $('#quesn').show();
			// $('#op1').show();
			//$('#op2').show();
			document.getElementById("saveandnxt").disabled = true;
			document.getElementById("SubmitQuestionPaper").disabled = true;
			 $('#op1chek').show();
	 			$('#op2chek').show();
		    }

      else if(h==""&&j==""&&k==""&&l==""&&selectedValue == "selectcard"&&op1Img==""&&op2Img==""){


			 $('#maxscore').show();
			 $('#session').show();
			 $('#quesn').show();
			 $('#op1').show();
			$('#op2').show();
			document.getElementById("saveandnxt").disabled = true;
			document.getElementById("SubmitQuestionPaper").disabled = true;

		    }


      else if(j==""&&k==""&&l==""&&selectedValue == "selectcard"&&op1Img==""&&op2Img==""){

    	    $('#session').show();
			 $('#quesn').show();
			 //$('#op1').show();
			// $('#op2').show();
			 document.getElementById("saveandnxt").disabled = true;
			 document.getElementById("SubmitQuestionPaper").disabled = true;
			 $('#op1chek').show();
	 			$('#op2chek').show();
		    }
      else if(j==""&&k==""&&l==""&&selectedValue == "selectcard"&&op1Img==""&&op2Img==""){
        
    	  $('#session').show();
	         $('#quesn').show();
			 //$('#op1').show();
			 //$('#op2').show();
			 document.getElementById("saveandnxt").disabled = true;
			 document.getElementById("SubmitQuestionPaper").disabled = true;
	         $('#op1chek').show();
	 			$('#op2chek').show();
		    }
      else if(k==""&&l==""&&selectedValue == "selectcard"&&op1Img==""&&op2Img==""){

    	    $('#session').show();
			 //$('#op1').show();
			 //$('#op2').show();
			 document.getElementById("saveandnxt").disabled = true;
			 document.getElementById("SubmitQuestionPaper").disabled = true;
    	    $('#op1chek').show();
 			$('#op2chek').show();
		    }
      else if(k==""&&l==""&&op1Img==""&&op2Img==""){

	         //$('#op1').show();
			 //$('#op2').show();
			 document.getElementById("saveandnxt").disabled = true;
			 document.getElementById("SubmitQuestionPaper").disabled = true;
    	  $('#op1chek').show();
			$('#op2chek').show();
		    }
      
		  
      else if(k==""&&op1Img==""){

	        // $('#op2').show();
	         document.getElementById("saveandnxt").disabled = true;
	         document.getElementById("SubmitQuestionPaper").disabled = true;
	  $('#op1chek').show();
		    }
    else if(l==""&&op2Img==""){

	        // $('#op2').show();
	         document.getElementById("saveandnxt").disabled = true;
	         document.getElementById("SubmitQuestionPaper").disabled = true;
	  $('#op2chek').show();
		    }
      else{
    	  document.getElementById("saveandnxt").disabled = false;
    	  document.getElementById("SubmitQuestionPaper").disabled = false;
      }
      }
      
      
      
      
      
      
    function opt4Function(){
    	 var a= $("#questionPaperNumber").val();
 		 var b=$("#className").val();
 		 var c=$("#passPercentage").val();
 		 var d=$("#timePerQuestion").val();
 		 var e=$("#scorePerQuestion").val();
 		 var f=$("#totalTimeAllowedForExam").val();
 		var g=$("#noOfQuestionsForEvaluation").val();
 		var h=$("#maximumScore").val();
 		
 		var j=$("#Question").val();
 		var k=$("#option1").val();
 		var l=$("#option2").val();
 		var m=$("#option3").val();
 		var ddl = document.getElementById("section");
		 var selectedValue = ddl.options[ddl.selectedIndex].value;
 		
 		
		  if(a==""&& b=="" && c==""&&d=="" &&e=="" &&f==""&&g==""&&h==""&&j==""&&k==""&&l==""&&selectedValue == "selectcard"&&m==""&&op1Img==""&&op2Img==""&&op3Img==""){

 			 $('#classname').show();
 			 $('#qno').show();
 			 $('#pass').show();
 			 $('#time').show();
 			 $('#scoreqn').show();
 			 $('#tottimeexam').show();
 			 $('#noofquest').show();
 			 $('#maxscore').show();
 			 $('#session').show();
 			 $('#quesn').show();
 			  $('#op1chek').show();
 			  $('#op2chek').show();
 			  $('#op3chek').show();
 			document.getElementById("saveandnxt").disabled = true;
 			document.getElementById("SubmitQuestionPaper").disabled = true;

 		 }
		  else if(b=="" && c==""&&d=="" &&e=="" &&f==""&&g==""&&h==""&&j==""&&k==""&&l==""&&selectedValue == "selectcard"&&m==""&&op1Img==""&&op2Img==""&&op3Img==""){

	 			 $('#classname').show();
	 			 $('#pass').show();
	 			 $('#time').show();
	 			 $('#scoreqn').show();
	 			 $('#tottimeexam').show();
	 			 $('#noofquest').show();
	 			 $('#maxscore').show();
	 			 $('#session').show();
	 			 $('#quesn').show();
	 			 $('#op1chek').show();
	 			  $('#op2chek').show();
	 			  $('#op3chek').show();
	 			 document.getElementById("saveandnxt").disabled = true;
	 			document.getElementById("SubmitQuestionPaper").disabled = true;

	 		 }
	 		 else if( c==""&&d=="" &&e=="" &&f==""&&g==""&&h==""&&j==""&&k==""&&l==""&&selectedValue == "selectcard"&&m==""&&op1Img==""&&op2Img==""&&op3Img==""){


	 			 $('#pass').show();
	 			 $('#time').show();
	 			 $('#scoreqn').show();
	 			 $('#tottimeexam').show();
	 			 $('#noofquest').show();
	 			 $('#maxscore').show();
	 			 $('#session').show();
	 			 $('#quesn').show();
	 			 $('#op1chek').show();
	 			  $('#op2chek').show();
	 			  $('#op3chek').show();
	 			 document.getElementById("saveandnxt").disabled = true;
	 			document.getElementById("SubmitQuestionPaper").disabled = true;

	 		 }

	      else if(d=="" &&e=="" &&f==""&&g==""&&h==""&&j==""&&k==""&&l==""&&selectedValue == "selectcard"&&m==""&&op1Img==""&&op2Img==""&&op3Img==""){

	 			 $('#time').show();
	 			 $('#scoreqn').show();
	 			 $('#tottimeexam').show();
	 			 $('#noofquest').show();
	 			 $('#maxscore').show();
	 			 $('#session').show();
	 			 $('#quesn').show();
	 			 $('#op1chek').show();
	 			  $('#op2chek').show();
	 			  $('#op3chek').show();
	 			 document.getElementById("saveandnxt").disabled = true;
	 			document.getElementById("SubmitQuestionPaper").disabled = true;

	 		    }
	      else if(e=="" &&f==""&&g==""&&h==""&&j==""&&k==""&&l==""&&selectedValue == "selectcard"&&m==""&&op1Img==""&&op2Img==""&&op3Img==""){

	    	     $('#scoreqn').show();
				 $('#tottimeexam').show();
				 $('#noofquest').show();
				 $('#maxscore').show();
				 $('#session').show();
				 $('#quesn').show();
				 $('#op1chek').show();
	 			  $('#op2chek').show();
	 			  $('#op3chek').show();
				 document.getElementById("saveandnxt").disabled = true;
				 document.getElementById("SubmitQuestionPaper").disabled = true;

			    }
	      else if(f==""&&g==""&&h==""&&j==""&&k==""&&l==""&&selectedValue == "selectcard"&&m==""&&op1Img==""&&op2Img==""&&op3Img==""){

	 	         $('#tottimeexam').show();
				 $('#noofquest').show();
				 $('#maxscore').show();
				 $('#session').show();
				 $('#quesn').show();
				 $('#op1chek').show();
	 			  $('#op2chek').show();
	 			  $('#op3chek').show();
				 document.getElementById("saveandnxt").disabled = true;
				 document.getElementById("SubmitQuestionPaper").disabled = true;

			    }

	      else if(g==""&&h==""&&j==""&&k==""&&l==""&&selectedValue == "selectcard"&&m==""&&op1Img==""&&op2Img==""&&op3Img==""){

		        $('#noofquest').show();
				 $('#maxscore').show();
				 $('#session').show();
				 $('#quesn').show();
				 $('#op1chek').show();
	 			  $('#op2chek').show();
	 			  $('#op3chek').show();
				 document.getElementById("saveandnxt").disabled = true;
				 document.getElementById("SubmitQuestionPaper").disabled = true;

			    }

	      else if(h==""&&j==""&&k==""&&l==""&&selectedValue == "selectcard"&&m==""&&op1Img==""&&op2Img==""&&op3Img==""){


				 $('#maxscore').show();
				 $('#session').show();
				 $('#quesn').show();
				 $('#op1chek').show();
	 			  $('#op2chek').show();
	 			  $('#op3chek').show();
				 document.getElementById("saveandnxt").disabled = true;
				 document.getElementById("SubmitQuestionPaper").disabled = true;

			    }


	      else if(j==""&&k==""&&l==""&&selectedValue == "selectcard"&&m==""&&op1Img==""&&op2Img==""&&op3Img==""){

	    	    $('#session').show();
				 $('#quesn').show();
				 $('#op1chek').show();
	 			  $('#op2chek').show();
	 			  $('#op3chek').show();
				 document.getElementById("saveandnxt").disabled = true;
				 document.getElementById("SubmitQuestionPaper").disabled = true;

			    }
	      else if(j==""&&k==""&&l==""&&selectedValue == "selectcard"&&m==""&&op1Img==""&&op2Img==""&&op3Img==""){
	        
	    	  $('#session').show();
		         $('#quesn').show();
		         $('#op1chek').show();
	 			  $('#op2chek').show();
	 			  $('#op3chek').show();
				 document.getElementById("saveandnxt").disabled = true;
				 document.getElementById("SubmitQuestionPaper").disabled = true;

			    }
	      else if(k==""&&l==""&&selectedValue == "selectcard"&&m==""&&op1Img==""&&op2Img==""&&op3Img==""){

	    	    $('#session').show();
	    	    $('#op1chek').show();
	 			  $('#op2chek').show();
	 			  $('#op3chek').show();
				 document.getElementById("saveandnxt").disabled = true;
				 document.getElementById("SubmitQuestionPaper").disabled = true;

			    }
	      else if(k==""&&l==""&&m==""&&op1Img==""&&op2Img==""&&op3Img==""){

	    	  $('#op1chek').show();
 			  $('#op2chek').show();
 			  $('#op3chek').show();
				 document.getElementById("saveandnxt").disabled = true;
				 document.getElementById("SubmitQuestionPaper").disabled = true;
			    }
	      else if(l==""&&m==""&&op2Img==""&&op3Img==""){

	    	  $('#op2chek').show();
 			  $('#op3chek').show();
		         document.getElementById("saveandnxt").disabled = true;
		         
		         document.getElementById("SubmitQuestionPaper").disabled = true;
			    }
	      else if(k==""&&op1Img==""){

		        // $('#op2').show();
		         document.getElementById("saveandnxt").disabled = true;
		         document.getElementById("SubmitQuestionPaper").disabled = true;
	  	  $('#op1chek').show();
			    }
	      else if(l==""&&op2Img==""){

		        // $('#op2').show();
		         document.getElementById("saveandnxt").disabled = true;
		         document.getElementById("SubmitQuestionPaper").disabled = true;
	  	  $('#op2chek').show();
			    }
	 else if(m=="" &&op3Img==""){
	    	  $('#op3chek').show();
		         document.getElementById("saveandnxt").disabled = true;
		         document.getElementById("SubmitQuestionPaper").disabled = true;
	      }
	      
	      else{
	    	  document.getElementById("saveandnxt").disabled = false;
	    	  document.getElementById("SubmitQuestionPaper").disabled = false;
	      }

		  
		  
    }

      
      
      
      
      function Hidedop2(){
    	  //$('#op2').hide();
    	  $('#op2chek').hide();
    	 
      }
      function Hidedop3(){
    	 // $('#op3').hide(); 
    	  $('#op3chek').hide();
      }
      
      function checkop1null(){
    	  var op1 = $("#option1").val();
    	 
    	 
    	  if(op1==""||op1Img==null){
    		  $('#op1chek').show();
    		  document.getElementById("saveandnxt").disabled = true;
		     document.getElementById("SubmitQuestionPaper").disabled = true;  
    	  }
    	  else{
    		  document.getElementById("saveandnxt").disabled = false;
 		     document.getElementById("SubmitQuestionPaper").disabled = false;   
    	  }
      }
      
     function checkop2null(){
    	  var op2 = $("#option2").val();
    	 
    	  if(op2==""||op2Img==null){
    		  $('#op2chek').show();
    		  document.getElementById("saveandnxt").disabled = true;
		     document.getElementById("SubmitQuestionPaper").disabled = true;  
    	  }
    	  else{
    		  document.getElementById("saveandnxt").disabled = false;
 		     document.getElementById("SubmitQuestionPaper").disabled = false;   
    	  }
      }
   function checkop3null(){
    	  var op3 = $("#option3").val();
    	
    	  if(op3==""||op3Img==null){
    		  $('#op3chek').show();
    		  document.getElementById("saveandnxt").disabled = true;
		     document.getElementById("SubmitQuestionPaper").disabled = true;  
    	  }
    	  else{
    		  document.getElementById("saveandnxt").disabled = false;
 		     document.getElementById("SubmitQuestionPaper").disabled = false;   
    	  }
      }
      function checkop4null(){
    	  var op4 = $("#option4").val();
    	  var op3 = $("#option3").val();
    	/*  if(op3==""||op3Img==null){
    		  $('#op3chek').show();
    		  document.getElementById("saveandnxt").disabled = true;
 		     document.getElementById("SubmitQuestionPaper").disabled = true;  
    	  }
    	  else{
    		  document.getElementById("saveandnxt").disabled = false;
 		     document.getElementById("SubmitQuestionPaper").disabled = false;   
    	  }*/
      }
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
       function Fnsection1(){
    	  var a= $("#questionPaperNumber").val();
 		 var b=$("#className").val();
 		 var c=$("#passPercentage").val();
 		 var d=$("#timePerQuestion").val();
 		 var e=$("#scorePerQuestion").val();
 		 var section1=$("#section1").val();
 		
 		   if(a==""&& b=="" && c==""&&d=="" &&e==""&&section1=="Default" ){

 			 $('#classname').show();
 			 $('#qno').show();
 			 $('#pass').show();
 			 $('#time').show();
 			 $('#scoreqn').show();
 			$('#sect1').show();
 		  }
 		   else if(b=="" && c==""&&d=="" &&e==""&&section1=="Default" ){

  			 $('#classname').show();
  			   $('#pass').show();
  			 $('#time').show();
  			 $('#scoreqn').show();
  			$('#sect1').show();
  		  }
 		  else if(c==""&&d=="" &&e==""&&section1=="" ){
             $('#pass').show();
   			 $('#time').show();
   			 $('#scoreqn').show();
   			$('#sect1').show();
   		  }
 		 else if(d=="" &&e==""&&section1=="" ){
            
   			 $('#time').show();
   			 $('#scoreqn').show();
   			$('#sect1').show();
   		  }
 		 else if(e==""&&section1=="" ){
             
   			
   			 $('#scoreqn').show();
   			$('#sect1').show();
   		  }
 		 else if(section1=="" ){
             
    		$('#sect1').show();
   		  }
 		 
 		 
       }
      
       function Fnsection2(){
     	  var a= $("#questionPaperNumber").val();
  		 var b=$("#className").val();
  		 var c=$("#passPercentage").val();
  		 var d=$("#timePerQuestion").val();
  		 var e=$("#scorePerQuestion").val();
  		 var section1=$("#section1").val();
  		 var section2=$("#section2").val();
  		   if(a==""&& b=="" && c==""&&d=="" &&e==""&&section1=="Default"&&section2=="Default" ){

  			 $('#classname').show();
  			 $('#qno').show();
  			 $('#pass').show();
  			 $('#time').show();
  			 $('#scoreqn').show();
  			$('#sect1').show();
  			$('#sect2').show();
  			
  		  }
  		   else if(b=="" && c==""&&d=="" &&e==""&&section1=="Default"&&section2=="Default" ){

   			 $('#classname').show();
   			   $('#pass').show();
   			 $('#time').show();
   			 $('#scoreqn').show();
   			$('#sect1').show();
   			$('#sect2').show();
   		  }
  		  else if(c==""&&d=="" &&e==""&&section1==""&&section2=="" ){
              $('#pass').show();
    			 $('#time').show();
    			 $('#scoreqn').show();
    			$('#sect1').show();
    			$('#sect2').show();
    		  }
  		 else if(d=="" &&e==""&&section1==""&&section2==""  ){
             
    			 $('#time').show();
    			 $('#scoreqn').show();
    			$('#sect1').show();
    			$('#sect2').show();
    		  }
  		 else if(e==""&&section1==""&&section2==""  ){
              
    			
    			 $('#scoreqn').show();
    			$('#sect1').show();
    			$('#sect2').show();
    		  }
  		 else if(section1==""&&section2==""  ){
              
     		$('#sect1').show();
     		$('#sect2').show();
    		  }
  		else if(section2==""  ){
            
     		
     		$('#sect2').show();
    		  }
  		 
  		 
        }
       
       
       
       
       
       function hidesec1(){
    	   $('#sect1').hide(); 
       }
      
      
       function hidesec2(){
    	   $('#sect2').hide(); 
       }
       function hidesec3(){
    	   $('#sect3').hide(); 
       }
      
      
      
      
      
      
      
      
      
      
      
      
      
      
 
       var op1Img="";
     function op1img(){                   //onchange of op1image
    	op1Img= $("#option1Img").val();
    	 $('#op1chek').hide();
    	 document.getElementById("saveandnxt").disabled = false;
    	 document.getElementById("SubmitQuestionPaper").disabled = false;
   	
             } 
     
     
     var op2Img="";
     function op2img(){ 
    	 //onchange of op2image
    	 $('#op2chek').hide();
    	 document.getElementById("saveandnxt").disabled = false;
    	 document.getElementById("SubmitQuestionPaper").disabled = false;
     op2Img= $("#option2Img").val();
     var op1 = $("#option1").val();
 	if(op1==""&&op1Img==""){
 		
 		 $('#op1chek').show();
 		document.getElementById("saveandnxt").disabled = true;
 		document.getElementById("SubmitQuestionPaper").disabled = true;
 	}
 	else{
 		document.getElementById("saveandnxt").disabled = false;
 		document.getElementById("SubmitQuestionPaper").disabled = false;
 	}
 	
             }
     
   
     var op3Img="";
     function op3img(){ 
    	 $('#op3chek').hide();
    	 document.getElementById("SubmitQuestionPaper").disabled = false;
    		document.getElementById("saveandnxt").disabled = false;	//onchange of op3image
     op3Img= $("#option3Img").val();
     var op1 = $("#option1").val();
     var op2 = $("#option2").val();
  	if(op2==""&&op2Img==""&&op1==""&&op1Img==""){
  		 $('#op1chek').show();
  		 $('#op2chek').show();
  		document.getElementById("saveandnxt").disabled = true;
  		document.getElementById("SubmitQuestionPaper").disabled = true;
  	}
  	else if(op2==""&&op2Img==""){
  		 $('#op2chek').show();
   		document.getElementById("saveandnxt").disabled = true;
   	 document.getElementById("SubmitQuestionPaper").disabled = true;
  	}
  	else{
  		document.getElementById("saveandnxt").disabled = false;	
  		 document.getElementById("SubmitQuestionPaper").disabled = false;
  	}
   	
             }
    	 
     var op4Img="";
     function op4img(){                  //onchange of op24image
     op4Img= $("#option4Img").val();
     var op1 = $("#option1").val();
     var op2 = $("#option2").val();
     var op3 = $("#option3").val();
  	if(op2==""&&op2Img==""&&op1==""&&op1Img==""&&op3==""&&op3Img==""){
  		 $('#op1chek').show();
  		 $('#op2chek').show();
  		 $('#op3chek').show();
  		document.getElementById("saveandnxt").disabled = true;
  		 document.getElementById("SubmitQuestionPaper").disabled = true;
  	}
 	else if(op2==""&&op2Img==""&&op3==""&&op3Img==""){
  		 $('#op2chek').show();
  		$('#op3chek').show();
   		document.getElementById("saveandnxt").disabled = true;
   	 document.getElementById("SubmitQuestionPaper").disabled = true;
  	}
 	else if(op3==""&&op3Img==""){
 		$('#op3chek').show();
   		document.getElementById("saveandnxt").disabled = true;
   	 document.getElementById("SubmitQuestionPaper").disabled = true;
   	 
 	}
  
  	else{
  		document.getElementById("saveandnxt").disabled = false;	
  		 document.getElementById("SubmitQuestionPaper").disabled = false;
  	}
   	
             }
     
     

function generateAnswerList(){

//$("#Answer").change(function (){

   var op1 = $("#option1").val();
    var op2 = $("#option2").val();
    var op3 = $("#option3").val();
    var op4 = $("#option4").val();
    var op5 = $("#option5").val();
  
   
   
    
    if(op1 != "" || op2 != "" || op3 != "" || op4 != "" || op5 != ""|| op1Img !=""||op2Img !=""||op3Img !=""||op4Img !=""){

		        if(op1 != ""||op1Img !=""){
		            $("#answer1").prop("disabled", false);
		        }
		        
		        else{
		            $("#answer1").prop("disabled", true);
		        }
        
        
        
        
        if(op2 != ""||op2Img !=""){
             $("#answer2").prop("disabled", false);
        }
         else{
             $("#answer2").prop("disabled", true);
        }
        
        
        
        if(op3 != ""||op3Img !=""){
             $("#answer3").prop("disabled", false);
        }
        else{
             $("#answer3").prop("disabled", true);
        }
        if(op4 != ""||op4Img !=""){
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
  

















    

