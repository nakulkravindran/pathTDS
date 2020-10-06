var questionsList = null;
var questionPaperNumber = null;
var totalQuestions = 0;
var questionNumber = 0;
var notVisited = 0;
var examId = null;
var markForReviewList = [];
var answeredList = [];
var visitedList = [];
var unAnsweredQuestionList = [];
var answerMap = new Object();

var totalAnsweredQuestions = 0;

function loadQuestionsFromDb(examinationId, numberOfQuestions) {

	 totalQuestions = numberOfQuestions;
	 notVisited = totalQuestions;

	 if(jQuery.inArray(questionNumber, answeredList) === -1){
	     if(jQuery.inArray(questionNumber, unAnsweredQuestionList) === -1 && jQuery.inArray(questionNumber, markForReviewList) === -1){
	         unAnsweredQuestionList.push(questionNumber);
	     }
	 }

	 $("#unAnsweredQuestions").text(unAnsweredQuestionList.length);
	 examId = examinationId;
	 var url = "/pathTDS/loadQuestions?examId=" + examinationId;

	     $.ajax({
	      type: "POST",
	      url: url,
	      data: examId, // serializes the form's elements.
	      success: function(data) {
	       console.log(data);	      
	       questionsList = data;       
	       questionPaperNumber = $("#qnPaperNumber").val();       
	       console.log(questionsList);
	       buildQuestionList();
	       startExamination();
	      },
	      error: function(data) {
	       console.log("error");
	      }
	     });
	}

function moveToQuestion(questionNo){
    currentQuestionNumber = questionNumber;
    var answer = $("#inputAnswerForm").serializeArray();   
    if(jQuery.isEmptyObject( answer )){  
      	 $("#markForReview").prop('checked', false);
  	        $("#markForReview").prop("disabled", true);

  	        if(jQuery.inArray(questionNumber, markForReviewList) !== -1){
  	           markForReviewList.splice( $.inArray(questionNumber,markForReviewList) ,1 );
  	           $("#reviwedQuestions").text(markForReviewList.length);
  	        }
      	
         if(jQuery.inArray(currentQuestionNumber, markForReviewList) != -1){
            $("#qn" + currentQuestionNumber).removeClass().addClass('table-info');
         }
         else{
            $("#qn" + currentQuestionNumber).removeClass().addClass('table-danger');
         }

         questionNumber = questionNo;
         $("#unAnsweredQuestions").text(unAnsweredQuestionList.length);
         loadQuestionsInUI(questionsList, questionNumber);
    }else{
    	var valStr=answer[0].value;
        if(valStr!=""){
       	 $("#markForReview").prop("disabled", false);
	        if(jQuery.inArray(questionNumber, answeredList) === -1){
	            if(jQuery.inArray(questionNumber, markForReviewList) === -1){
	               answeredList.push(questionNumber);
	               $("#qn" + questionNumber).removeClass().addClass('table-success');
	            }
	        }

	        if(jQuery.inArray(questionNumber, unAnsweredQuestionList) != -1){
	            if(jQuery.inArray(questionNumber, answeredList) != -1 || jQuery.inArray(questionNumber, markForReviewList) != -1){
	               unAnsweredQuestionList.splice( $.inArray(questionNumber, unAnsweredQuestionList), 1 );;
	            }
	        }

	        $("#answeredQuestions").text(answeredList.length);
	        $("#unAnsweredQuestions").text(unAnsweredQuestionList.length);
   	
            submitAnswer(answer);
            answerMap[currentQuestionNumber] = answer[0].value;

            if(jQuery.inArray(currentQuestionNumber, answeredList) === -1){
               if(jQuery.inArray(currentQuestionNumber, markForReviewList) === -1){
                 answeredList.push(currentQuestionNumber);
               }
            }
            console.log("answeredList is : " + JSON.stringify(answeredList));
            totalAnsweredQuestions = answeredList.length;
            if(jQuery.inArray(currentQuestionNumber, markForReviewList) !== -1){
               $("#qn" + currentQuestionNumber).removeClass().addClass('table-info');
             }
             else{
                $("#qn" + currentQuestionNumber).removeClass().addClass('table-success');
             }

             if(notVisited > 0){
               notVisited = notVisited - 1;
              }

             if(jQuery.inArray(currentQuestionNumber, unAnsweredQuestionList) != -1){
               if(jQuery.inArray(currentQuestionNumber, answeredList) != -1 || jQuery.inArray(currentQuestionNumber, markForReviewList) != -1){
                unAnsweredQuestionList.splice( $.inArray(currentQuestionNumber, unAnsweredQuestionList), 1 );;
               }
              }

              questionNumber = questionNo;
              $("#answeredQuestions").text(totalAnsweredQuestions);
              $("#unAnsweredQuestions").text(unAnsweredQuestionList.length);
              $("#notVisited").text(totalQuestions - visitedList.length);
              loadQuestionsInUI(questionsList, questionNumber);
    	}else{
    
         	 $("#markForReview").prop('checked', false);
     	        $("#markForReview").prop("disabled", true);

     	        if(jQuery.inArray(questionNumber, markForReviewList) !== -1){
     	           markForReviewList.splice( $.inArray(questionNumber,markForReviewList) ,1 );
     	           $("#reviwedQuestions").text(markForReviewList.length);
     	        }
         	 
            if(jQuery.inArray(currentQuestionNumber, markForReviewList) != -1){
               $("#qn" + currentQuestionNumber).removeClass().addClass('table-info');
            }
            else{
               $("#qn" + currentQuestionNumber).removeClass().addClass('table-danger');
            }

            questionNumber = questionNo;
            $("#unAnsweredQuestions").text(unAnsweredQuestionList.length);
            loadQuestionsInUI(questionsList, questionNumber);
       }
    }
  
    if(jQuery.inArray(questionNumber, markForReviewList) !== -1){
       $("#qn" + questionNumber).removeClass().addClass('table-info');
    }
    else if(jQuery.inArray(questionNumber, answeredList) !== -1){
       $("#qn" + questionNumber).removeClass().addClass('table-success');
    }
    else{
       $("#qn" + questionNumber).removeClass().addClass('table-danger');
    }
}

function buildQuestionList(){

    var qn = 0;
    var tableData = "";
    while(qn < totalQuestions){

        if((qn%8) != 0){
            tableData = tableData + "<td onClick='moveToQuestion("+qn+")' id=\"qn" + qn + "\" class=\"table-dark\">" + (qn+1) + "</td>";
        }
        else{

            tableData = tableData + "<tr>";
            tableData = tableData + "<td onClick='moveToQuestion("+qn+")' id=\"qn" + qn + "\" class=\"table-dark\">" + (qn+1) + "</td>";

        }
        qn = qn + 1;
    }
    $("#questionList table tbody").append(tableData);

}

function startExamination() {

     if (questionNumber < totalQuestions) {

        loadQuestionsInUI(questionsList, questionNumber);
     }
     else if(questionNumber > (totalQuestions-1)){
          var retVal = alert("Click on the 'End and Submit Exam' button to finish exam.");
         
          questionNumber = questionNumber - 1;
                      loadQuestionsInUI(questionsList, questionNumber);
     }
     else{
        $("#saveAndNext").prop("disabled", true);
     }

}

function loadQuestionsInUI(questionsList, questionNumber) {		 
     document.getElementById("inputAnswerForm").reset();
     $("#question").text(questionsList[questionNumber].question);
     var typ=questionsList[questionNumber].qn_type;
     if( typ=="multiple") {  
    	 var htmlStr="<ol> <li id='optionItem1'><div class='row'> <div class='col-md-1' style= 'max-width: 2.333333%;'>  <input name='answer' value='1' type='radio' class='optionClicked filled-in' id='checkbox1' onClick='onInput(event)'> <label for='checkbox1' class='label-table'></label>  </div>  <div class='col-md-11'>  <p id='option1'  style='white-space:pre-wrap;word-wrap:break-word;-ms-word-wrap:break-word;overflow-wrap:break-word;color:#000;font-weight:400;font-size:17px;'></p>   <img id='option1Img' src='#' />   </div>   </div> </li> ";
    	 htmlStr+=" <li id='optionItem2'><div class='row'> <div class='col-md-1' style= 'max-width: 2.333333%; '>  <input name='answer' value='2' type='radio' class='optionClicked filled-in' id='checkbox2' onClick='onInput(event)'> <label for='checkbox2' class='label-table'></label>  </div>  <div class='col-md-11'> <p id='option2' style='white-space:pre-wrap;word-wrap:break-word;-ms-word-wrap:break-word;overflow-wrap:break-word;color:#000;font-weight:400;font-size:17px;'></p> <img  id='option2Img' src='#'  />  </div> </div></li> ";
    	 htmlStr+=" <li id='optionItem3'><div class='row'>  <div class='col-md-1' style= 'max-width: 2.333333%; '>  <input name='answer' value='3' type='radio' class='optionClicked filled-in' id='checkbox3' onClick='onInput(event)'>  <label for='checkbox3' class='label-table'></label>   </div> <div class='col-md-11'> <p id='option3'  style='white-space:pre-wrap;word-wrap:break-word;-ms-word-wrap:break-word;overflow-wrap:break-word;color:#000;font-weight:400;font-size:17px;'></p><img  id='option3Img' src='#'  /></div> </div></li> ";
    	 htmlStr+=" <li id='optionItem4'><div class='row'> <div class='col-md-1' style= 'max-width: 2.333333%; '>   <input name='answer' value='4' type='radio' class='optionClicked filled-in' id='checkbox4' onClick='onInput(event)'> <label for='checkbox4' class='label-table'></label>  </div> <div class='col-md-11'>  <p id='option4'  style='white-space:pre-wrap;word-wrap:break-word;-ms-word-wrap:break-word;overflow-wrap:break-word;color:#000;font-weight:400;font-size:17px;'></p><img  id='option4Img' src='#'  />  </div>  </div></li> ";
    	 htmlStr+=" <li id='optionItem5'><div class='row'>  <div class='col-md-1' style= 'max-width: 2.333333%; '>   <input name='answer' value='5' type='radio' class='optionClicked filled-in' id='checkbox5' onClick='onInput(event)'>   <label for='checkbox5' class='label-table'></label>   </div>    <div class='col-md-11'>  <p id='option5'  style='white-space:pre-wrap;word-wrap:break-word;-ms-word-wrap:break-word;overflow-wrap:break-word;color:#000;font-weight:400;font-size:17px;'></p>   </div> </div></li>  </ol> ";
     
             $("#inputAnswerForm").html(htmlStr);
     if((questionsList[questionNumber].op1 != null && questionsList[questionNumber].op1 != "") || (questionsList[questionNumber].optionImg1 != null)){
         $("#optionItem1").show();
         $("#option1").text(questionsList[questionNumber].op1);
      }
      else{
         $("#optionItem1").hide();
      }

      if((questionsList[questionNumber].op2 != null && questionsList[questionNumber].op2 != "") || (questionsList[questionNumber].optionImg2 != null)){
          $("#optionItem2").show();
          $("#option2").text(questionsList[questionNumber].op2);
      }
      else{
         $("#optionItem2").hide();
      }

      if((questionsList[questionNumber].op3 != null && questionsList[questionNumber].op3 != "") || (questionsList[questionNumber].optionImg3 != null)){
          $("#optionItem3").show();
          $("#option3").text(questionsList[questionNumber].op3);
      }
      else{
         $("#optionItem3").hide();
      }

      if((questionsList[questionNumber].op4 != null && questionsList[questionNumber].op4 != "") || (questionsList[questionNumber].optionImg4 != null)){
          $("#optionItem4").show();
          $("#option4").text(questionsList[questionNumber].op4);
      }
      else{
         $("#optionItem4").hide();
      }

      if(questionsList[questionNumber].op5 != null && questionsList[questionNumber].op5 != ""){
          $("#optionItem5").show();
          $("#option5").text(questionsList[questionNumber].op5);
      }
      else{
         $("#optionItem5").hide();
      }


      if(questionsList[questionNumber].questionImg != null){

         $("#questionImg").show();
         $("#questionImg").attr("src",questionsList[questionNumber].questionImg);
      }
      else{
         $("#questionImg").hide();
      }

      if(questionsList[questionNumber].optionImg1 != null){
         $("#option1Img").show();
         $("#option1Img").attr("src",questionsList[questionNumber].optionImg1);
      }
      else{
         $("#option1Img").hide();
      }

      if(questionsList[questionNumber].optionImg2 != null){
         $("#option2Img").show();
         $("#option2Img").attr("src",questionsList[questionNumber].optionImg2);
      }
      else{
         $("#option2Img").hide();
      }

      if(questionsList[questionNumber].optionImg3 != null){
         $("#option3Img").show();
         $("#option3Img").attr("src",questionsList[questionNumber].optionImg3);
      }
      else{
         $("#option3Img").hide();
      }

      if(questionsList[questionNumber].optionImg4 != null){
         $("#option4Img").show();
         $("#option4Img").attr("src",questionsList[questionNumber].optionImg4);
      }
      else{
         $("#option4Img").hide();
      }
     }else {
    	   	 /*$("#inputAnswerForm").html("<div class='row'> <div class='col-md-12 form-group' > <input name='answer'  type='text' rows='10' multiple='multiple' class='form-control' onkeyup='myFunction()' id='checkbox0' > </div>  </div>"); */
    	 $("#inputAnswerForm").html("<div class='row'> <div class='col-md-12 form-group' > <textarea id='checkbox0' name='answer' rows='12' cols='50' class='form-control optionClicked filled-in' placeholder='Answer' value='' onchange='onInput(event)'></textarea> </div> </div>"); 
    	   	 
    	  
      }

     $("#questionNumber").text(questionNumber + 1);

     $("#markForReview").prop("disabled", true);
     if(jQuery.inArray(questionNumber, markForReviewList) != -1){
        $("#markForReview").prop('checked', true);
        $("#markForReview").prop('disabled', false);
     }
     else{
        $("#markForReview").prop('checked', false);
        $("#markForReview").prop('disabled', true);
     }

     if(questionNumber <= 0){
          $("#previous").hide();
     }
     else{
          $("#previous").show();
     }

     if(questionNumber >= (totalQuestions-1)){
        $("#saveAndNext").hide();
     }
     else{
        $("#saveAndNext").show();
     }

     
     if(answerMap[questionNumber] != null){
    	 if( typ=="multiple") { 
    		 $("#checkbox" + answerMap[questionNumber]).prop('checked', true);    		
    	 }else{
    		 $("#checkbox0").text(answerMap[questionNumber]);
    	 }
     }

      console.log("visitedListBeforeUnique : " + JSON.stringify(visitedList));
      if(jQuery.inArray(questionNumber, visitedList) === -1){
            visitedList.push(questionNumber);
      }
      console.log("visitedList : " + JSON.stringify(visitedList));

      if(((questionNumber) <= totalQuestions) && (jQuery.inArray(questionNumber, answeredList) === -1)){
          if(jQuery.inArray(questionNumber, unAnsweredQuestionList) === -1 && jQuery.inArray(questionNumber, markForReviewList) === -1){
              unAnsweredQuestionList.push(questionNumber);
          }
      }
      $("#unAnsweredQuestions").text(unAnsweredQuestionList.length);
      $("#notVisited").text(totalQuestions - visitedList.length);

}




function endExambtn(){
	var answer = $("#inputAnswerForm").serializeArray();
	
	 if(jQuery.isEmptyObject( answer )){
	        //alert("Exam completed.");
	    }
	    else
	    {
	        submitAnswer(answer);
	        //alert("Exam completed.");
	    }	 
	 window.location.href = "/pathTDS/computeResult";
	 
}

function onInput(event){
	if(event.target.value!=""){
		$("#markForReview").prop("disabled", false);

        if(jQuery.inArray(questionNumber, answeredList) === -1){
            if(jQuery.inArray(questionNumber, markForReviewList) === -1){
               answeredList.push(questionNumber);
               $("#qn" + questionNumber).removeClass().addClass('table-success');
            }
        }

        if(jQuery.inArray(questionNumber, unAnsweredQuestionList) != -1){
            if(jQuery.inArray(questionNumber, answeredList) != -1 || jQuery.inArray(questionNumber, markForReviewList) != -1){
               unAnsweredQuestionList.splice( $.inArray(questionNumber, unAnsweredQuestionList), 1 );;
            }
        }

        $("#answeredQuestions").text(answeredList.length);
        $("#unAnsweredQuestions").text(unAnsweredQuestionList.length);
	}else{
		$("#markForReview").prop('checked', false);
        $("#markForReview").prop("disabled", true);

        if(jQuery.inArray(questionNumber, markForReviewList) !== -1){
           markForReviewList.splice( $.inArray(questionNumber,markForReviewList) ,1 );
           $("#reviwedQuestions").text(markForReviewList.length);
        }
	}
}

/*$(".optionClicked").click(function(){	
    if(($('#checkbox1').is(':checked')) || ($('#checkbox2').is(':checked')) || ($('#checkbox3').is(':checked')) ||
     ($('#checkbox4').is(':checked')) || ($('#checkbox5').is(':checked'))){

        $("#markForReview").prop("disabled", false);

        if(jQuery.inArray(questionNumber, answeredList) === -1){
            if(jQuery.inArray(questionNumber, markForReviewList) === -1){
               answeredList.push(questionNumber);
               $("#qn" + questionNumber).removeClass().addClass('table-success');
            }
        }

        if(jQuery.inArray(questionNumber, unAnsweredQuestionList) != -1){
            if(jQuery.inArray(questionNumber, answeredList) != -1 || jQuery.inArray(questionNumber, markForReviewList) != -1){
               unAnsweredQuestionList.splice( $.inArray(questionNumber, unAnsweredQuestionList), 1 );;
            }
        }


        $("#answeredQuestions").text(answeredList.length);
        $("#unAnsweredQuestions").text(unAnsweredQuestionList.length);

     }
     else
     {
        $("#markForReview").prop('checked', false);
        $("#markForReview").prop("disabled", true);

        if(jQuery.inArray(questionNumber, markForReviewList) !== -1){
           markForReviewList.splice( $.inArray(questionNumber,markForReviewList) ,1 );
           $("#reviwedQuestions").text(markForReviewList.length);
        }
     }

});*/


$("#markForReview").click(function() {

    if($('#markForReview').is(':checked')){
        if(jQuery.inArray(questionNumber, markForReviewList) === -1){
            markForReviewList.push(questionNumber);
        }

        if(jQuery.inArray(questionNumber, answeredList) != -1 && jQuery.inArray(questionNumber, markForReviewList) != -1){
            answeredList.splice( $.inArray(questionNumber, answeredList), 1 );;
        }

        $("#qn" + questionNumber).removeClass().addClass('table-info');
        $("#reviwedQuestions").text(markForReviewList.length);
        $("#answeredQuestions").text(answeredList.length);
    }
    else{
        markForReviewList.splice( $.inArray(questionNumber,markForReviewList) ,1 );

        if(jQuery.inArray(questionNumber, answeredList) === -1 && jQuery.inArray(questionNumber, markForReviewList) === -1){
            answeredList.push(questionNumber);
        }

        $("#qn" + questionNumber).removeClass().addClass('table-success');
        $("#reviwedQuestions").text(markForReviewList.length);
        $("#answeredQuestions").text(answeredList.length);
    }

    console.log("Review List : " + markForReviewList);
});

$("#previous").click(function() {
	
     var answer = $("#inputAnswerForm").serializeArray();
     console.log(JSON.stringify(answer));    
     if(jQuery.isEmptyObject( answer )){        
    	    $("#markForReview").prop('checked', false);
	        $("#markForReview").prop("disabled", true);

	        if(jQuery.inArray(questionNumber, markForReviewList) !== -1){
	           markForReviewList.splice( $.inArray(questionNumber,markForReviewList) ,1 );
	           $("#reviwedQuestions").text(markForReviewList.length);
	        }
    	

        if(jQuery.inArray(questionNumber, markForReviewList) !== -1){
           $("#qn" + questionNumber).removeClass().addClass('table-info');
        }
        else{
           $("#qn" + questionNumber).removeClass().addClass('table-danger');
        }
       
        questionNumber = questionNumber - 1;
        $("#unAnsweredQuestions").text(unAnsweredQuestionList.length);
        startExamination();
     }
     else{
    	 
    	 var valStr=answer[0].value;
    	    if(valStr!=""){	   
	    	 $("#markForReview").prop("disabled", false);
		        if(jQuery.inArray(questionNumber, answeredList) === -1){
		            if(jQuery.inArray(questionNumber, markForReviewList) === -1){
		               answeredList.push(questionNumber);
		               $("#qn" + questionNumber).removeClass().addClass('table-success');
		            }
		        }
		        if(jQuery.inArray(questionNumber, unAnsweredQuestionList) != -1){
		            if(jQuery.inArray(questionNumber, answeredList) != -1 || jQuery.inArray(questionNumber, markForReviewList) != -1){
		               unAnsweredQuestionList.splice( $.inArray(questionNumber, unAnsweredQuestionList), 1 );;
		            }
		        }

		        $("#answeredQuestions").text(answeredList.length);
		        $("#unAnsweredQuestions").text(unAnsweredQuestionList.length);
	    	  	 
    	 
              submitAnswer(answer);
             answerMap[questionNumber] = answer[0].value;             

            if(jQuery.inArray(questionNumber, answeredList) === -1){
             if(jQuery.inArray(questionNumber, markForReviewList) === -1){
               answeredList.push(questionNumber);
             }
           }
           console.log("answeredList is : " + JSON.stringify(answeredList));
           totalAnsweredQuestions = answeredList.length;
           if(jQuery.inArray(questionNumber, markForReviewList) !== -1){
             $("#qn" + questionNumber).removeClass().addClass('table-info');
           }
           else{
             $("#qn" + questionNumber).removeClass().addClass('table-success');
          }

          if(jQuery.inArray(questionNumber, unAnsweredQuestionList) != -1){
             if(jQuery.inArray(questionNumber, answeredList) != -1 || jQuery.inArray(questionNumber, markForReviewList) != -1){
                unAnsweredQuestionList.splice( $.inArray(questionNumber, unAnsweredQuestionList), 1 );;
             }
          }

          questionNumber = questionNumber - 1;
          $("#answeredQuestions").text(answeredList.length);
          $("#unAnsweredQuestions").text(unAnsweredQuestionList.length);
          startExamination();
	   }else{		 
	    	 $("#markForReview").prop('checked', false);
		        $("#markForReview").prop("disabled", true);

		        if(jQuery.inArray(questionNumber, markForReviewList) !== -1){
		           markForReviewList.splice( $.inArray(questionNumber,markForReviewList) ,1 );
		           $("#reviwedQuestions").text(markForReviewList.length);
		        }	    	 

	        if(jQuery.inArray(questionNumber, markForReviewList) !== -1){
	           $("#qn" + questionNumber).removeClass().addClass('table-info');
	        }
	        else{
	           $("#qn" + questionNumber).removeClass().addClass('table-danger');
	        }
	        
	        questionNumber = questionNumber - 1;
	        $("#unAnsweredQuestions").text(unAnsweredQuestionList.length);
	        startExamination();
	    }
     }

});


$("#saveAndNext").click(function() {
	
     var answer = $("#inputAnswerForm").serializeArray();    
     if(jQuery.isEmptyObject( answer )){  
    	    $("#markForReview").prop('checked', false);
	        $("#markForReview").prop("disabled", true);

	        if(jQuery.inArray(questionNumber, markForReviewList) !== -1){
	           markForReviewList.splice( $.inArray(questionNumber,markForReviewList) ,1 );
	           $("#reviwedQuestions").text(markForReviewList.length);
	        }
    	
          if(jQuery.inArray(questionNumber, markForReviewList) !== -1){
             $("#qn" + questionNumber).removeClass().addClass('table-info');
          }
          else{
             $("#qn" + questionNumber).removeClass().addClass('table-danger');
          }

        if(notVisited > 0){
            notVisited = notVisited - 1;
        }

        console.log("unAnsweredQuestionList : " + JSON.stringify(unAnsweredQuestionList));

        questionNumber = questionNumber + 1;
        $("#unAnsweredQuestions").text(unAnsweredQuestionList.length);
        $("#notVisited").text(totalQuestions - visitedList.length);
        startExamination();
     }
     else{
    	  var valStr=answer[0].value;
    	    if(valStr!=""){ 
    	      $("#markForReview").prop("disabled", false);
	          if(jQuery.inArray(questionNumber, answeredList) === -1){
	            if(jQuery.inArray(questionNumber, markForReviewList) === -1){
	               answeredList.push(questionNumber);
	               $("#qn" + questionNumber).removeClass().addClass('table-success');
	            }
	          }

	        if(jQuery.inArray(questionNumber, unAnsweredQuestionList) != -1){
	            if(jQuery.inArray(questionNumber, answeredList) != -1 || jQuery.inArray(questionNumber, markForReviewList) != -1){
	               unAnsweredQuestionList.splice( $.inArray(questionNumber, unAnsweredQuestionList), 1 );;
	            }
	        }

	        $("#answeredQuestions").text(answeredList.length);
	        $("#unAnsweredQuestions").text(unAnsweredQuestionList.length);

    	 
            submitAnswer(answer);
            answerMap[questionNumber] = answer[0].value;

            if(jQuery.inArray(questionNumber, answeredList) === -1){
             if(jQuery.inArray(questionNumber, markForReviewList) === -1){
                answeredList.push(questionNumber);
             }
           }
           console.log("answeredList is : " + JSON.stringify(answeredList));
           totalAnsweredQuestions = answeredList.length;
           if(jQuery.inArray(questionNumber, markForReviewList) !== -1){
              $("#qn" + questionNumber).removeClass().addClass('table-info');
           }
           else{
             $("#qn" + questionNumber).removeClass().addClass('table-success');
           }

           if(notVisited > 0){
             notVisited = notVisited - 1;
           }

           if(jQuery.inArray(questionNumber, unAnsweredQuestionList) != -1){
             if(jQuery.inArray(questionNumber, answeredList) != -1 || jQuery.inArray(questionNumber, markForReviewList) != -1){
                unAnsweredQuestionList.splice( $.inArray(questionNumber, unAnsweredQuestionList), 1 );;
             }
          }

             questionNumber = questionNumber + 1;
             $("#answeredQuestions").text(totalAnsweredQuestions);
             $("#unAnsweredQuestions").text(unAnsweredQuestionList.length);
             $("#notVisited").text(totalQuestions - visitedList.length);
             startExamination();
    	 }else{
    		 
        	 $("#markForReview").prop('checked', false);
    	        $("#markForReview").prop("disabled", true);

    	        if(jQuery.inArray(questionNumber, markForReviewList) !== -1){
    	           markForReviewList.splice( $.inArray(questionNumber,markForReviewList) ,1 );
    	           $("#reviwedQuestions").text(markForReviewList.length);
    	        }
        	  
            if(jQuery.inArray(questionNumber, markForReviewList) !== -1){
                $("#qn" + questionNumber).removeClass().addClass('table-info');
            }
            else{
                $("#qn" + questionNumber).removeClass().addClass('table-danger');
            }

            if(notVisited > 0){
                notVisited = notVisited - 1;
            }

           
            console.log("unAnsweredQuestionList : " + JSON.stringify(unAnsweredQuestionList));

            questionNumber = questionNumber + 1;
            $("#unAnsweredQuestions").text(unAnsweredQuestionList.length);
            $("#notVisited").text(totalQuestions - visitedList.length);
            startExamination();
	    }
     }

});

function submitAnswer(answer) {

    var resultData = {};

    resultData["examId"]=examId;
    resultData["questionpaperId"]=$("#qnPaperNumber").val();
    resultData["questionId"]=questionsList[questionNumber].questionId;
    resultData["section"]=questionsList[questionNumber].section;
    var desc=questionsList[questionNumber].answer_Descriptive;
    if(desc!=""){
       resultData["markedDesc"]=answer[0].value;
       resultData["correctDesc"]=questionsList[questionNumber].answer_Descriptive;
    }else{
    	resultData["markedOption"]=answer[0].value;
        resultData["correctOption"]=questionsList[questionNumber].answer_multiple;
    }
    console.log(resultData);    
    
    var valStr=answer[0].value;
    if(valStr!=""){
    $.ajax({
     type: "POST",
     url: "/pathTDS/submitAnswer",
     data: resultData, // serializes the form's elements.
     success: function(data) {    	
      console.log(data);
      startExamination();
     },
     error: function(data) {
      console.log("error");
     }
    });
    }
}

function get(k) {
    return answerMap[k];
}