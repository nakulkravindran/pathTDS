
$(document).ready(function() {	
	
	$(".clNprev").hide();
	$(".clprevQn").hide();
	$(".btnGenerateQn").hide();	
    $(".clcriteria").hide();
	$(".clpreviousqn").change(function(e){
		var val=$(this).val();
		if(val=="yes"){
			$(".clcriteria").show();
			$(".clprevQn").show();
			$(".clNprev").hide();
			$(".btnGenerateQn").show();			
		}
		else{
			$(".clcriteria").show();
			$(".clNprev").show();
			$(".clprevQn").hide();	
			$(".btnGenerateQn").show();
		}
		
	});
	
	$('input:text').change(function(e){	
				var s1=isNaN(parseInt($("#scorePerQn1").val()))?0:parseInt($("#scorePerQn1").val());
				var s2=isNaN(parseInt($("#scorePerQn2").val()))?0:parseInt($("#scorePerQn2").val());
				var s3=isNaN(parseInt($("#scorePerQn3").val()))?0:parseInt($("#scorePerQn3").val());
				var s4=isNaN(parseInt($("#scorePerQn4").val()))?0:parseInt($("#scorePerQn4").val());
				var e1=isNaN(parseInt($("#easy1").val()))?0:parseInt($("#easy1").val());
				var e2=isNaN(parseInt($("#easy2").val()))?0:parseInt($("#easy2").val());
				var e3=isNaN(parseInt($("#easy3").val()))?0:parseInt($("#easy3").val());
				var e4=isNaN(parseInt($("#easy4").val()))?0:parseInt($("#easy4").val());
				var a1=isNaN(parseInt($("#average1").val()))?0:parseInt($("#average1").val());
				var a2=isNaN(parseInt($("#average2").val()))?0:parseInt($("#average2").val());
				var a3=isNaN(parseInt($("#average3").val()))?0:parseInt($("#average3").val());
				var a4=isNaN(parseInt($("#average4").val()))?0:parseInt($("#average4").val());
				var d1=isNaN(parseInt($("#difficult1").val()))?0:parseInt($("#difficult1").val());
				var d2=isNaN(parseInt($("#difficult2").val()))?0:parseInt($("#difficult2").val());
				var d3=isNaN(parseInt($("#difficult3").val()))?0:parseInt($("#difficult3").val());
				var d4=isNaN(parseInt($("#difficult4").val()))?0:parseInt($("#difficult4").val());					
				$("#TotalScore").val((s1*e1)+(s1*a1)+(s1*d1)+(s2*e2)+(s2*a2)+(s2*d2)+(s3*e3)+(s3*a3)+(s3*d3)+(s4*e4)+(s4*a4)+(s4*d4));
				
				$("#totalead1").html(e1+a1+d1);
				$("#totalead2").html(e2+a2+d2);
				$("#totalead3").html(e3+a3+d3);
				$("#totalead4").html(e4+a4+d4);
				$("#totaleasy").html(e1+e2+e3+e4);
				$("#totalAverage").html(a1+a2+a3+a4);
				$("#totalDifficult").html(d1+d2+d3+d4);				
				$("#totaltot").html(e1+a1+d1+e2+a2+d2+e3+a3+d3+e4+a4+d4);
				if($("#questionPaperNumber").val()!=""){$("#questionPaperNumber").val(isNaN(parseInt($("#questionPaperNumber").val()))?0:$("#questionPaperNumber").val());}
				if($("#noOfQuestionsForEvaluation").val()!=""){$("#noOfQuestionsForEvaluation").val(isNaN(parseInt($("#noOfQuestionsForEvaluation").val()))?0:$("#noOfQuestionsForEvaluation").val());}
				if($("#maximumScore").val()!=""){$("#maximumScore").val(isNaN(parseInt($("#maximumScore").val()))?0:$("#maximumScore").val());}
				if($("#passPercentage").val()!=""){	$("#passPercentage").val(isNaN(parseInt($("#passPercentage").val()))?0:$("#passPercentage").val());}
			    if($("#scorePerQn1").val()!=""){$("#scorePerQn1").val(isNaN(parseInt($("#scorePerQn1").val()))?0:$("#scorePerQn1").val());}
				if($("#scorePerQn2").val()!=""){$("#scorePerQn2").val(isNaN(parseInt($("#scorePerQn2").val()))?0:$("#scorePerQn2").val());}
				if($("#scorePerQn3").val()!=""){$("#scorePerQn3").val(isNaN(parseInt($("#scorePerQn3").val()))?0:$("#scorePerQn3").val());}
				if($("#scorePerQn4").val()!=""){$("#scorePerQn4").val(isNaN(parseInt($("#scorePerQn4").val()))?0:parseInt($("#scorePerQn4").val()));}
				if($("#easy1").val()!=""){$("#easy1").val(isNaN(parseInt($("#easy1").val()))?0:$("#easy1").val());}
				if($("#easy2").val()!=""){$("#easy2").val(isNaN(parseInt($("#easy2").val()))?0:$("#easy2").val());}
				if($("#easy3").val()!=""){$("#easy3").val(isNaN(parseInt($("#easy3").val()))?0:$("#easy3").val());}
				if($("#easy4").val()!=""){$("#easy4").val(isNaN(parseInt($("#easy4").val()))?0:$("#easy4").val());}
				if($("#average1").val()!=""){$("#average1").val(isNaN(parseInt($("#average1").val()))?0:$("#average1").val());}
				if($("#average2").val()!=""){$("#average2").val(isNaN(parseInt($("#average2").val()))?0:$("#average2").val());}
				if($("#average3").val()!=""){$("#average3").val(isNaN(parseInt($("#average3").val()))?0:$("#average3").val());}
				if($("#average4").val()!=""){$("#average4").val(isNaN(parseInt($("#average4").val()))?0:$("#average4").val());}
				if($("#difficult1").val()!=""){$("#difficult1").val(isNaN(parseInt($("#difficult1").val()))?0:$("#difficult1").val());}
				if($("#difficult2").val()!=""){$("#difficult2").val(isNaN(parseInt($("#difficult2").val()))?0:$("#difficult2").val());}
				if($("#difficult3").val()!=""){$("#difficult3").val(isNaN(parseInt($("#difficult3").val()))?0:$("#difficult3").val());}
				if($("#difficult4").val()!=""){$("#difficult4").val(isNaN(parseInt($("#difficult4").val()))?0:$("#difficult4").val());	}						
			
				
	});  
	

	$('.selector').change(function () {		
	  var changedItem = $(this);	  
	  var otherSelectors = $(".selector").not(changedItem);	  
	  var matchingItemPresent = [];
	  $.each(otherSelectors, function (count, item) {
	   if( $(item).val().trim()== changedItem.val().trim()){
	    matchingItemPresent.push($(item));	    
	    }
	  });	  
	  //matchingItemPresent.length > 0 ? alert("Duplicate entry..same value exists in another section") : $.noop();
	  if(matchingItemPresent.length > 0)
	  { alert("Duplicate entry..same value exists in another section") ;
	      $(this).val('');
	  }
	  
	  matchingItemPresent[0].focus();	  
	  console.log(matchingItemPresent[0]);
	});
	
	
	$("#btnGenerateQn").click(function(e){
		e.preventDefault();
		   
		   var questionPaperNumber1=$("#questionPaperNumber").val();
		   var classname1=$("#className").val();
		   var totalTimeAllowedForExam1=$("#totalTimeAllowedForExam").val();
		   var noOfQuestionsForEvaluation1=$("#totaltot").html();
		   var maximumScore1=$("#maximumScore").val();
		   var passPercentage1=$("#passPercentage").val();
		   var TotalScore1=$("#TotalScore").val();		   
		   var section1=$("#section1").val();
		   var answerTy1=$("#answerTy1").val();
		   var scorePerQn1=$("#scorePerQn1").val();
		   var easy1=$("#easy1").val();
		   var average1=$("#average1").val();
		   var difficult1=$("#difficult1").val();		   
		   var section2=$("#section2").val();
		   var answerTy2=$("#answerTy2").val();
		   var scorePerQn2=$("#scorePerQn2").val();
		   var easy2=$("#easy2").val();
		   var average2=$("#average2").val();
		   var difficult2=$("#difficult2").val();		   
		   var section3=$("#section3").val();
		   var answerTy3=$("#answerTy3").val();
		   var scorePerQn3=$("#scorePerQn3").val();
		   var easy3=$("#easy3").val();
		   var average3=$("#average3").val();
		   var difficult3=$("#difficult3").val();		   
		   var section4=$("#section4").val();
		   var answerTy4=$("#answerTy4").val();
		   var scorePerQn4=$("#scorePerQn4").val();
		   var easy4=$("#easy4").val();
		   var average4=$("#average4").val();
		   var difficult4=$("#difficult4").val();
		   
		   var url = "/pathTDS/generateQuestionPaper";
		   
	    var rdStr=$("input[name=previousqn]:checked").val();
	    var TotalScore11=TotalScore1;
		var maximumScore11=maximumScore1;
	    
		if((classname1!="" && totalTimeAllowedForExam1!="" && maximumScore1!="" && passPercentage1!="" && rdStr=="no" && (parseInt(maximumScore11,10)<=parseInt(TotalScore11,10)))|| (rdStr=="yes" && questionPaperNumber1!="")){  
			
			$.ajax({
            type: "POST",
            url: url,
            async: true,
          
            data:{questionPaperNumber1:questionPaperNumber1,
          	  classname1:classname1,
          	  totalTimeAllowedForExam1:totalTimeAllowedForExam1, 
          	  noOfQuestionsForEvaluation1:noOfQuestionsForEvaluation1,	            	  
          	  maximumScore1:maximumScore1,
          	  passPercentage1:passPercentage1,
          	  TotalScore1:TotalScore1,
          	  section1:section1,answerTy1:answerTy1,scorePerQn1:scorePerQn1,
          	  easy1:easy1,average1:average1,difficult1:difficult1,	            	  
          	  section2:section2,answerTy2:answerTy2,scorePerQn2:scorePerQn2,
          	  easy2:easy2,average2:average2,difficult2:difficult2,	            	  
          	  section3:section3,answerTy3:answerTy3,scorePerQn3:scorePerQn3,
          	  easy3:easy3,average3:average3,difficult3:difficult3,
          	  section4:section4,answerTy4:answerTy4,scorePerQn4:scorePerQn4,
          	  easy4:easy4,average4:average4,difficult4:difficult4            	  
            
            },
            //data: formData, // serializes the form's elements.
            success: function(data)
            {           	  	            	 
          	  window.location.href = "/pathTDS/QuestionPaperView?questionPaperNumber="+data;
          	 	                 
            },
            error: function(data){
          	 
               console.log(JSON.stringify(data));
            }              
          }); 

		}
		else{
			if(rdStr=="no"){
				alert("Please fill in the fields and make sure the total score is less than maximum score.");
			}else if (rdStr=="yes"){
				alert("Please fill in the previous question paper.");
			}
		}
		  
		   
	 });
   
});

