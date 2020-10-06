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
       questionPaperNumber = questionsList[0].questionPaperNumber;
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
    questionNumber = questionNo;
    loadQuestionsInUI(questionsList, questionNo);
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
          /*if(retVal == true){
            if(notVisited > 0){
               notVisited = notVisited - 1;
            }
            $("#notVisited").text(totalQuestions - visitedList.length);
            window.location.href = "/computeResult";
          }
          else{

            if(notVisited > 0){
              notVisited = notVisited - 1;
            }
            $("#notVisited").text(totalQuestions - visitedList.length);

            questionNumber = questionNumber - 1;
            loadQuestionsInUI(questionsList, questionNumber);
          }*/
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

     if(questionsList[questionNumber].option1 != null && questionsList[questionNumber].option1 != ""){
        $("#optionItem1").show();
        $("#option1").text(questionsList[questionNumber].option1);
     }
     else{
        $("#optionItem1").hide();
     }

     if(questionsList[questionNumber].option2 != null && questionsList[questionNumber].option2 != ""){
         $("#optionItem2").show();
         $("#option2").text(questionsList[questionNumber].option2);
     }
     else{
        $("#optionItem2").hide();
     }

     if(questionsList[questionNumber].option3 != null && questionsList[questionNumber].option3 != ""){
         $("#optionItem3").show();
         $("#option3").text(questionsList[questionNumber].option3);
     }
     else{
        $("#optionItem3").hide();
     }

     if(questionsList[questionNumber].option4 != null && questionsList[questionNumber].option4 != ""){
         $("#optionItem4").show();
         $("#option4").text(questionsList[questionNumber].option4);
     }
     else{
        $("#optionItem4").hide();
     }

     if(questionsList[questionNumber].option5 != null && questionsList[questionNumber].option5 != ""){
         $("#optionItem5").show();
         $("#option5").text(questionsList[questionNumber].option5);
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

     $("#questionNumber").text(questionNumber + 1);

     $("#markForReview").prop("disabled", true);
     if(jQuery.inArray(questionNumber, markForReviewList) !== -1){
        $("#markForReview").prop('checked', true);
     }
     else{
        $("#markForReview").prop('checked', false);
     }

     if(questionNumber <= 0){
//        $("#previous").prop("disabled", true);
          $("#previous").hide();
     }
     else{
//        $("#previous").prop("disabled", false);
          $("#previous").show();
     }

     if(questionNumber > (totalQuestions-1)){
//        $("#saveAndNext").prop("disabled", true);
        $("#saveAndNext").hide();
     }
     else{
//        $("#saveAndNext").prop("disabled", false);
        $("#saveAndNext").show();
     }

     if(answerMap[questionNumber] != null){
        $("#checkbox" + answerMap[questionNumber]).prop('checked', true);
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

$("#endExam").click(function(){
    var answer = $("#inputAnswerForm").serializeArray();
    if(jQuery.isEmptyObject( answer )){
        alert("Exam completed.");
    }
    else
    {
        submitAnswer(answer);
        alert("Exam completed.");
    }
    window.location.href = "/pathTDS/computeResult";
});

$(".optionClicked").click(function(){
    if(($('#checkbox1').is(':checked')) || ($('#checkbox2').is(':checked')) || ($('#checkbox3').is(':checked')) ||
     ($('#checkbox4').is(':checked')) || ($('#checkbox5').is(':checked'))){

        $("#markForReview").prop("disabled", false);
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

});

$("#markForReview").click(function() {

    if($('#markForReview').is(':checked')){
        markForReviewList.push(questionNumber);
        markForReviewList = $.unique(markForReviewList);
        $("#qn" + questionNumber).removeClass().addClass('table-info');
        $("#reviwedQuestions").text(markForReviewList.length);
    }
    else{
        markForReviewList.splice( $.inArray(questionNumber,markForReviewList) ,1 );
        $("#qn" + questionNumber).removeClass().addClass('table-success');
        $("#reviwedQuestions").text(markForReviewList.length);
    }

    console.log("Review List : " + markForReviewList);
});

$("#previous").click(function() {

     var answer = $("#inputAnswerForm").serializeArray();
     console.log(JSON.stringify(answer));

     if(jQuery.isEmptyObject( answer )){

        if(jQuery.inArray(questionNumber, markForReviewList) !== -1){
           $("#qn" + questionNumber).removeClass().addClass('table-info');
        }
        else{
           $("#qn" + questionNumber).removeClass().addClass('table-danger');
        }

        /*if(((questionNumber+1) < totalQuestions) && (jQuery.inArray(questionNumber+1, answeredList) === -1)){
            if(jQuery.inArray(questionNumber+1, unAnsweredQuestionList) === -1 && jQuery.inArray(questionNumber+1, markForReviewList) === -1){
                unAnsweredQuestionList.push(questionNumber+1);
            }
        }*/

        questionNumber = questionNumber - 1;
        $("#unAnsweredQuestions").text(unAnsweredQuestionList.length);
        startExamination();
     }
     else{
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
     }

});


$("#saveAndNext").click(function() {

     var answer = $("#inputAnswerForm").serializeArray();
     console.log(JSON.stringify(answer));
     if(jQuery.isEmptyObject( answer )){
        if(jQuery.inArray(questionNumber, markForReviewList) !== -1){
            $("#qn" + questionNumber).removeClass().addClass('table-info');
        }
        else{
            $("#qn" + questionNumber).removeClass().addClass('table-danger');
        }

        if(notVisited > 0){
            notVisited = notVisited - 1;
        }

        /*if(((questionNumber+1) < totalQuestions) && (jQuery.inArray(questionNumber+1, answeredList) === -1)){
            if(jQuery.inArray(questionNumber+1, unAnsweredQuestionList) === -1 && jQuery.inArray(questionNumber+1, markForReviewList) === -1){
                unAnsweredQuestionList.push(questionNumber+1);
            }
        }*/

        console.log("unAnsweredQuestionList : " + JSON.stringify(unAnsweredQuestionList));

        questionNumber = questionNumber + 1;
        $("#unAnsweredQuestions").text(unAnsweredQuestionList.length);
        $("#notVisited").text(totalQuestions - visitedList.length);
        startExamination();
     }
     else{

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
     }

});

function submitAnswer(answer) {

     var resultData = {};

     resultData["examId"] = examId;
     resultData["section"] = questionsList[questionNumber].section;
     resultData["questionPaperNumber"] = questionsList[questionNumber].questionPaperNumber;
     resultData["questionId"] = questionsList[questionNumber].questionId;
     resultData["score"] = questionsList[questionNumber].score;
     resultData["selectedOption"] = answer[0].value;


     console.log(resultData);

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

function get(k) {
    return answerMap[k];
}