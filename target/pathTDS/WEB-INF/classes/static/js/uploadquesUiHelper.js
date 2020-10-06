var totalQuestions = 0;
var currentQuestionNumber = 1;
var previousQuestionNumber = 0;
var questionPaperNumber = 0;
var questionsList = {};

$(document).ready(function() {
    $("#questionNumber").text(currentQuestionNumber);
    $("#next").hide();
    $("#previous").hide();
    $("#addNewQuestion").hide();
    $("#saveandnxt").show();
});


$("#questionPaperNumber").change(function() {
    questionPaperNumber = $("#questionPaperNumber").val();
    getPreviousQuestionDetails(questionPaperNumber);
    $("#questionNumber").text(currentQuestionNumber);

    if(currentQuestionNumber > 1){
        $("#previous").show();
    }
    else{
        $("#previous").hide();
    }
});

$("#TotalQuestions").change(function(){
    alert("TotalQuestions Changed");
    getPreviousQuestionDetails(questionPaperNumber);
});

$("#addNewQuestion").click(function(e) {

    addNewQuestionButtonClick();
    e.preventDefault();
});

function addNewQuestionButtonClick(){
        currentQuestionNumber = totalQuestions + 1;
        $("#saveandnxt").show();
        $("#addNewQuestion").hide();
        $("#next").hide();

        if(currentQuestionNumber > 1){
           $("#previous").show();
        }

        $("#questionNumber").text(currentQuestionNumber);

        $("#Question").text("");
        $("#option1").text("");
        $("#option2").text("");
        $("#option3").text("");
        $("#option4").text("");
        $("#option5").text("");
        $("#Answer").val("Select Option");

        $("#Question").prop("disabled", false);
        $("#option1").prop("disabled", false);
        $("#option2").prop("disabled", false);
        $("#option3").prop("disabled", false);
        $("#option4").prop("disabled", false);
        $("#option5").prop("disabled", false);
        $("#Answer").prop("disabled", false);
        $("#questionScore").prop("disabled", false);
}

$("#previous").click(function(e) {

    currentQuestionNumber = currentQuestionNumber - 1;

    if(currentQuestionNumber === 0){
        addNewQuestionButtonClick();
    }

    if (currentQuestionNumber <= 1) {
        $("#previous").hide();
        $("#next").show();
        $("#saveandnxt").hide();
        $("#addNewQuestion").show();
    }
    else if(currentQuestionNumber > 1 && currentQuestionNumber <= totalQuestions){
        $("#previous").show();
        $("#next").show();
        $("#saveandnxt").hide();
        $("#addNewQuestion").show();
    }

    $("#questionNumber").text(currentQuestionNumber);

    previousQuestionNumber = currentQuestionNumber - 1;
    $("#Question").text(questionsList[previousQuestionNumber].question);
    $("#option1").text(questionsList[previousQuestionNumber].option1);
    $("#option2").text(questionsList[previousQuestionNumber].option2);
    $("#option3").text(questionsList[previousQuestionNumber].option3);
    $("#option4").text(questionsList[previousQuestionNumber].option4);
    $("#option5").text(questionsList[previousQuestionNumber].option5);
    $("#Answer").val(questionsList[previousQuestionNumber].correctAnswer);
    $("#questionScore").val(questionsList[previousQuestionNumber].score);

    $("#Question").prop("disabled", true);
    $("#option1").prop("disabled", true);
    $("#option2").prop("disabled", true);
    $("#option3").prop("disabled", true);
    $("#option4").prop("disabled", true);
    $("#option5").prop("disabled", true);
    $("#Answer").prop("disabled", true);
    $("#questionScore").prop("disabled", true);
    e.preventDefault();
});


$("#next").click(function(e) {

    currentQuestionNumber = currentQuestionNumber + 1;

    if (currentQuestionNumber > totalQuestions) {
        addNewQuestionButtonClick();
    }
    else if (currentQuestionNumber > 1 && currentQuestionNumber - 1 < totalQuestions) {
        $("#previous").show();
        $("#next").show();
        $("#saveandnxt").hide();
        $("#addNewQuestion").show();

        previousQuestionNumber = currentQuestionNumber - 1;
        $("#Question").text(questionsList[previousQuestionNumber].question);
        $("#option1").text(questionsList[previousQuestionNumber].option1);
        $("#option2").text(questionsList[previousQuestionNumber].option2);
        $("#option3").text(questionsList[previousQuestionNumber].option3);
        $("#option4").text(questionsList[previousQuestionNumber].option4);
        $("#option5").text(questionsList[previousQuestionNumber].option5);
        $("#Answer").val(questionsList[previousQuestionNumber].correctAnswer);
        $("#questionScore").val(questionsList[previousQuestionNumber].score);

        $("#Question").prop("disabled", true);
        $("#option1").prop("disabled", true);
        $("#option2").prop("disabled", true);
        $("#option3").prop("disabled", true);
        $("#option4").prop("disabled", true);
        $("#option5").prop("disabled", true);
        $("#Answer").prop("disabled", true);
        
    }


    $("#questionNumber").text(currentQuestionNumber);

    e.preventDefault();
});
 var temp=0;
function getPreviousQuestionDetails(questionPaperNumber) {

    var data = {};
    data["questionPaperNumber"] = questionPaperNumber;

    $.ajax({
        type: "POST",
        url: "/pathTDS/questionPaperDuplicateCheck",
        data: data,
        async: false,
        success: function(data) {
            if (data.questionsList != null && data.questionHeader != null) {

                console.log("questionList : " + JSON.stringify(data.questionsList));
                questionsList = data.questionsList;
                var sections = [];
                var totalTime = 0;
                var totalScore = 0;
                totalQuestions = 0;
                $.each(data.questionsList, function(question) {
                    totalTime = totalTime + parseInt(data.questionsList[question].allottedTime);
                    totalScore = totalScore + parseInt(data.questionsList[question].score);
                    totalQuestions = totalQuestions + 1;
                    sections.push(data.questionsList[question].section);
                });
                currentQuestionNumber = totalQuestions + 1;
                temp=(totalTime/60).toFixed(2);
            }
        },
        error: function(data) {
            console.log("error");
        }
    });
    

}


function loadQuestionHeader(questionType) {

    if (questionType === "previousQuestion") {
        $("#TotalQuestions").val(totalQuestions);
        $("#className").val(data.questionHeader.className);
        $("#scorePerQuestion").val(data.questionsList[0].score);
        $("#TotalTime").val(totalTime);
        
        $("#option5").val(data.questionsList[0].option5);
        $("#timePerQuestion").val(data.questionsList[0].allottedTime);
        $("#TotalScore").val(totalScore);
        $("#questionPaperNumber").val(data.questionsList[0].questionPaperNumber);
        $("#timeAlowed").val($("#timePerQuestion").val());
        $("#questionScore").val($("#scorePerQuestion").val());
        $("#passPercentage").val(data.questionHeader.passPercentage);
        $("#totalTimeAllowedForExam").val(data.questionHeader.totalTimeAllowedForExam);
        $("#noOfQuestionsForEvaluation").val(data.questionHeader.noOfQuestionsForEvaluation);
        $("#maximumScore").val(data.questionHeader.maximumScore);

        if (data.questionHeader.section1 != null) {
            $("#section1").val(data.questionHeader.section1);
            $("#section1String").text(data.questionHeader.section1);
        }
        if (data.questionHeader.section2 != null) {
            $("#section2").val(data.questionHeader.section2);
            $("#section2String").text(data.questionHeader.section2);
        }
        if (data.questionHeader.section3 != null) {
            $("#section3").val(data.questionHeader.section3);
            $("#section3String").text(data.questionHeader.section3);
        }

        $("#className").prop("disabled", true);
        $("#scorePerQuestion").prop("disabled", true);
        $("#timePerQuestion").prop("disabled", true);
        // $("#questionPaperNumber").prop("disabled", true);
        $("#passPercentage").prop("disabled", true);
        $("#totalTimeAllowedForExam").prop("disabled", true);
        $("#noOfQuestionsForEvaluation").prop("disabled", true);
        $("#maximumScore").prop("disabled", true);
        $("#section1").prop("disabled", true);
        $("#section2").prop("disabled", true);
        $("#section3").prop("disabled", true);


    } else {
        $("#className").prop("disabled", false);
        $("#scorePerQuestion").prop("disabled", false);
        $("#timePerQuestion").prop("disabled", false);
        $("#passPercentage").prop("disabled", false);
        $("#totalTimeAllowedForExam").prop("disabled", false);
        $("#noOfQuestionsForEvaluation").prop("disabled", false);
        $("#maximumScore").prop("disabled", false);
        $("#section1").prop("disabled", false);
        $("#section2").prop("disabled", false);
        $("#section3").prop("disabled", false);

        if (document.getElementById("uploadQuestionsForm") != null) {
            document.getElementById("uploadQuestionsForm").reset();
        }
        if (document.getElementById("uploadExcel") != null) {
            document.getElementById("uploadExcel").reset();
        }

        $("#questionPaperNumber").val(questionPaperNumber);
    }
}


function getUrlParameter(sParam) {
    var sPageURL = decodeURIComponent(window.location.search.substring(1)),
        sURLVariables = sPageURL.split('&'),
        sParameterName,
        i;

    for (i = 0; i < sURLVariables.length; i++) {
        sParameterName = sURLVariables[i].split('=');

        if (sParameterName[0] === sParam) {
            return sParameterName[1] === undefined ? true : sParameterName[1];
        }
    }
}