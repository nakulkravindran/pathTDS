var section1 = "Default";
var section2 = "Default";
var section3 = "Default";

$("#section1").val(section1);
$("#section2").val(section2);
$("#section3").val(section3);
$("#section1String").text(section1);
$("#section2String").text(section2);
$("#section3String").text(section3);

$("#questionPaperNumber").change(function() {

    var questionPaperNumber = $("#questionPaperNumber").val();
    checkForDuplicateQuestionPaper(questionPaperNumber);

});

$("#timePerQuestion").change(function() {
    $("#timeAlowed").val($("#timePerQuestion").val());
});

$("#scorePerQuestion").change(function() {
    $("#questionScore").val($("#scorePerQuestion").val());
});

$(".section").change(function() {

    section1 = $("#section1").val();
    section2 = $("#section2").val();
    section3 = $("#section3").val();

    $("#section1String").val(section1);
    $("#section1String").text(section1);

    $("#section2String").val(section2);
    $("#section2String").text(section2);

    $("#section3String").val(section3);
    $("#section3String").text(section3);
});

var op1Img = "";

function op1img() { //onchange of op1image
    op1Img = $("#option1Img").val();
 
}

var op2Img = "";

function op2img() { //onchange of op2image
	 
    op2Img = $("#option2Img").val();
   
  /*  if(op1Img==""&&op1==""){
    	$('#op1').show();
    	document.getElementById("saveandnxt").disabled = true;
    	
    }
    else{
    	document.getElementById("saveandnxt").disabled = false;
    }*/

}

var op3Img = "";

function op3img() { //onchange of op3image
    op3Img = $("#option3Img").val();
    
   
}

var op4Img = "";

function op4img() { //onchange of op24image
    op4Img = $("#option4Img").val();

}



// this is the id of the form
/*$("#saveandnxt").click(function(e) {

    var op1 = $("#option1").val();
    var op2 = $("#option2").val();
    var op3 = $("#option3").val();
    var op4 = $("#option4").val();
    var op5 = $("#option5").val();

    if (($("#Question").val() != null) && ($("#Answer").val() != null) && (op1 != "" || op2 != "" || op3 != "" || op4 != "" || op5 != "" || op1Img != "" || op2Img != "" || op3Img != "" || op4Img != "")) {

        uploadQuestionAjaxCall("");

    } else {
        alert("Please fill all the fields");
    }
    e.preventDefault(); // avoid to execute the actual submit of the form.
});*/
var questionScore=0;
var timequestion=0;

$("#saveandnxt").click(function(e) {

    var op1 = $("#option1").val();
   
    var op2 = $("#option2").val();
    var op3 = $("#option3").val();
    var op4 = $("#option4").val();
    var op5 = $("#option5").val();
    var data = {};
   // alert($("#Answer").val());
   
//if(($("#Question").val() !="") && ($("#Answer").val() != null) && (op1 != "" || op2 != "" || op3 != "" || op4 != "" || op5 != ""||op1Img !=""||op2Img !=""||op3Img !=""||op4Img !="")){
   if(($("#section").val() !=null) && ($("#Question").val() !="") && ($("#Answer").val() != null)&& (op1 != "" || op2 != "" || op3 != "" || op4 != "" || op5 != "")){

        var url = "/pathTDS/questions"; // the script where you handle the form input.

        var TotalQuestions = parseInt($("#TotalQuestions").val());
        var TotalTime= parseInt($("#TotalTime").val());
        var TotalScore = parseInt($("#TotalScore").val());
        var timePerQuestion = parseInt($("#timeAlowed").val());
        var scorePerQuestion = parseInt($("#scorePerQuestion").val());
       // var scorePerQuestion = parseInt($("#questionScore").val());
        questionScore=parseInt($("#questionScore").val());
       
        var passPercentage = parseInt($("#passPercentage").val());
        var totalTimeAllowedForExam = parseInt($("#totalTimeAllowedForExam").val());
        var noOfQuestionsForEvaluation = parseInt($("#noOfQuestionsForEvaluation").val());
        var maximumScore = parseInt($("#maximumScore").val());

        var className = $("#className").val();
        var option5 = $("#option5").val();
        var questionPaperNumber = $("#questionPaperNumber").val();

        var section1 = $("#section1").val();
        var section2 = $("#section2").val();
        var section3 = $("#section3").val();

        if($("#section").val() === null || $("#section").val() === ""){
            $("#section").val("Default");
        }

        var formData = $("#uploadQuestionsForm").serializeArray();

        $.ajax({
               type: "POST",
               url: url,
               async: false,
               data: formData, // serializes the form's elements.
               success: function(data)
               {
                   getPreviousQuestionDetails(questionPaperNumber);
                   alert("Question saved successfully.");
                   TotalQuestions = TotalQuestions + 1;
                  // var temp=TotalQuestions*timePerQuestion;
                  //TotalTime = timePerQuestion+ (timePerQuestion/60);
                
                   //TotalTime= (TotalTime+ (timePerQuestion/60)).toFixed(2);
                
                   //timequestion=timePerQuestion/60;
                   
                   //TotalTime = (TotalTime + timequestion);
                   
                 // TotalTime = (TotalTime + timequestion).toFixed(2);
               // var totime= (TotalTime/60).toFixed(2);
                // alert(TotalTime);
                // TotalTime= (TotalTime+ (timePerQuestion/60));
                 TotalTime= TotalTime+ timePerQuestion;
                 var totime= (TotalTime/60).toFixed(2);
                // alert(TotalTime);
                 
                 

                   TotalScore = TotalScore + scorePerQuestion;

                   document.getElementById("uploadQuestionsForm").reset();

                   $("#TotalQuestions").val(TotalQuestions);
                   $("#className").val(className);
                   $("#scorePerQuestion").val(scorePerQuestion);
                   $("#TotalTime").val(TotalTime);
                   $("#TotTime").val(totime);
                   $("#option5").val(option5);
                   $("#timePerQuestion").val(timePerQuestion);
                   $("#TotalScore").val(TotalScore);
                   $("#questionPaperNumber").val(questionPaperNumber);
                   $("#timeAlowed").val($("#timePerQuestion").val());
                   $("#questionScore").val(questionScore);
                  // $("#questionScore").val($("#scorePerQuestion").val());
                    $("#passPercentage").val(passPercentage);
                   $("#totalTimeAllowedForExam").val(totalTimeAllowedForExam);
                   $("#noOfQuestionsForEvaluation").val(noOfQuestionsForEvaluation);
                   $("#maximumScore").val(maximumScore);
                   $("#section1").val(section1);
                   $("#section2").val(section2);
                   $("#section3").val(section3);

               },
               error: function(data){
                console.log("error");
               }
             });


}
else{
    alert("Please fill all the fields");
}
e.preventDefault(); // avoid to execute the actual submit of the form.
});


$("#SubmitQuestionPaper").click(function(e) {

    var op1 = $("#option1").val();
   
    var op2 = $("#option2").val();
    var op3 = $("#option3").val();
    var op4 = $("#option4").val();
    var op5 = $("#option5").val();
   // alert($("#Answer").val());
   
//if(($("#Question").val() != null) && ($("#Answer").val() != null) && (op1 != "" || op2 != "" || op3 != "" || op4 != "" || op5 != ""||op1Img !=""||op2Img !=""||op3Img !=""||op4Img !="")){
    if(($("#section").val() !=null) && ($("#Question").val() !="") && ($("#Answer").val() != null)&& (op1 != "" || op2 != "" || op3 != "" || op4 != "" || op5 != "")){

        var url = "/pathTDS/questions"; // the script where you handle the form input.

        var TotalQuestions = parseInt($("#TotalQuestions").val());
       var TotalTime = parseInt($("#TotalTime").val());
        var TotalScore = parseInt($("#TotalScore").val());
        var timePerQuestion = parseInt($("#timeAlowed").val());
        
        var scorePerQuestion = parseInt($("#questionScore").val());
        var passPercentage = parseInt($("#passPercentage").val());
        var totalTimeAllowedForExam = parseInt($("#totalTimeAllowedForExam").val());
        var noOfQuestionsForEvaluation = parseInt($("#noOfQuestionsForEvaluation").val());
        var maximumScore = parseInt($("#maximumScore").val());

        var className = $("#className").val();
        var option5 = $("#option5").val();
        var questionPaperNumber = $("#questionPaperNumber").val();

        var section1 = $("#section1").val();
        var section2 = $("#section2").val();
        var section3 = $("#section3").val();

        if($("#section").val() === null || $("#section").val() === ""){
            $("#section").val("Default");
        }

        var formData = $("#uploadQuestionsForm").serializeArray();

        $.ajax({
               type: "POST",
               url: url,
               async: false,
               data: formData, // serializes the form's elements.
               success: function(data)
               {
                   getPreviousQuestionDetails(questionPaperNumber);
                   alert("Question saved successfully.");
                 //  TotalQuestions = TotalQuestions + 1;
                  // var temp=TotalQuestions*timePerQuestion;
                  //TotalTime = timePerQuestion+ (timePerQuestion/60);
                
                   //TotalTime= (TotalTime+ (timePerQuestion/60)).toFixed(2);
                   //TotalTime = TotalTime + timePerQuestion ;
                 
                   //TotalScore = TotalScore + scorePerQuestion;

                   document.getElementById("uploadQuestionsForm").reset();

                  

               },
               error: function(data){
                console.log("error");
               }
             });


}
else{
    alert("Please fill all the fields");
}
e.preventDefault(); // avoid to execute the actual submit of the form.
});









$("#editQuestionButton").click(function(e) {

    var op1 = $("#option1").val();
    var op2 = $("#option2").val();
    var op3 = $("#option3").val();
    var op4 = $("#option4").val();
    var op5 = $("#option5").val();
   var section= $("#section").val();
    var Question=$("#Question").val();
    var Answer=$("#Answer").val();
    var timeallowed=$("#timeAlowed").val();
    var questionScore =$("#questionScore").val();
   
    
  
    
  if(Question!=""&&section!=""&&timeallowed!=""&&questionScore!=""&&Answer!=""){
    
	  //if(($("#Question").val() != null) && ($("#Answer").val() != null) && (op1 != "" || op2 != "" || op3 != "" || op4 != "" || op5 != ""||op1Img !=""||op2Img !=""||op3Img !=""||op4Img !="")){
        
	 uploadQuestionAjaxCall("editQuestion");

    } else {
        alert("Please fill all the fields");
    }

    e.preventDefault(); // avoid to execute the actual submit of the form.
});


$(document).ready(function() {
    $(".upload-file-input").on("change", uploadFile);
});

function checkForDuplicateQuestionPaper(questionPaperNumber) {


    var data = {};
    data["questionPaperNumber"] = questionPaperNumber;

    $.ajax({
        type: "POST",
        url: "/pathTDS/questionPaperDuplicateCheck",
        data: data,
        success: function(data) {
            if (data.questionsList != null && data.questionHeader != null) {

                console.log("questionList : " + JSON.stringify(data.questionsList));
                var sections = [];
                var totalTime =0 ;
                var totalScore = 0;
                var totalQuestions = 0;
                 var temp=0;
                
                $.each(data.questionsList, function(question) {
                    totalTime = totalTime + parseInt(data.questionsList[question].allottedTime);
                   
                    totalScore = totalScore + parseInt(data.questionsList[question].score);
                    totalQuestions = totalQuestions + 1;
                   
                    sections.push(data.questionsList[question].section);
                    //sections = $.unique(sections);
                });
               //
                temp=(totalTime/60).toFixed(2);
                //document.getElementById("uploadQuestionsForm").reset();

                $("#TotalQuestions").val(totalQuestions);
                $("#className").val(data.questionHeader.className);
                $("#scorePerQuestion").val(data.questionsList[0].score);
                $("#TotalTime").val(totalTime);
                $("#TotTime").val(temp);
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


        },
        error: function(data) {
            console.log("error");
        }
    });

}

function uploadQuestionAjaxCall(editQuestionFlag) {

    var TotalQuestions = parseInt($("#TotalQuestions").val());
    var TotalTime = parseInt($("#TotalTime").val());
    var TotalScore = parseInt($("#TotalScore").val());
    var timePerQuestion = parseInt($("#timeAlowed").val());
    var scorePerQuestion = parseInt($("#questionScore").val());
    var passPercentage = parseInt($("#passPercentage").val());
    var totalTimeAllowedForExam = parseInt($("#totalTimeAllowedForExam").val());
    var noOfQuestionsForEvaluation = parseInt($("#noOfQuestionsForEvaluation").val());
    var maximumScore = parseInt($("#maximumScore").val());
    
    var className = $("#className").val();
    var option5 = $("#option5").val();
    var questionPaperNumber = $("#questionPaperNumber").val();

    var section1 = $("#section1").val();
    var section2 = $("#section2").val();
    var section3 = $("#section3").val();

    if ($("#section").val() === null || $("#section").val() === "") {
        $("#section").val("Default");
    }
    var formData = $("#uploadQuestionsForm").serializeArray();

    if(editQuestionFlag != null || editQuestionFlag === "editQuestion"){
            var url = "/pathTDS/questions?editQuestion=true&questionPaperNumber=" + questionPaperNumber + "&editQuestionId=" + getUrlParameter('questionId'); // the script where you handle the form input.
        }
        else{
            var url = "/pathTDS/questions"; // the script where you handle the form input.
        }

    $.ajax({
        type: "POST",
        url: url,
        data: formData, // serializes the form's elements.
        success: function(data) {

            alert("sucessfully saved");
            
            TotalQuestions = TotalQuestions + 1;
            TotalTime = TotalTime + (timePerQuestion / 60);
            TotalScore = TotalScore + scorePerQuestion;

            document.getElementById("uploadQuestionsForm").reset();

            $("#TotalQuestions").val(TotalQuestions);
            $("#className").val(className);
            $("#scorePerQuestion").val(scorePerQuestion);
            $("#TotalTime").val(TotalTime);
            $("#option5").val(option5);
            $("#timePerQuestion").val(timePerQuestion);
            $("#TotalScore").val(TotalScore);
            $("#questionPaperNumber").val(questionPaperNumber);
            $("#timeAlowed").val($("#timePerQuestion").val());
            $("#questionScore").val($("#scorePerQuestion").val());
            $("#passPercentage").val(passPercentage);
            $("#totalTimeAllowedForExam").val(totalTimeAllowedForExam);
            $("#noOfQuestionsForEvaluation").val(noOfQuestionsForEvaluation);
            $("#maximumScore").val(maximumScore);
            $("#section1").val(section1);
            $("#section2").val(section2);
            $("#section3").val(section3);
            window.location.href = "/pathTDS/editQuestions?questionPaperNumber=" +questionPaperNumber;

        },
        error: function(data) {
            console.log("error");
        }
    });
}

function uploadFile() {

    $.ajax({
        url: "/pathTDS/uploadFile",
        type: "POST",
        data: new FormData($("#uploadQuestionsForm")[0]),
        enctype: 'multipart/form-data',
        processData: false,
        contentType: false,
        cache: false,
        success: function(data) {
            // Handle upload success
            //          $("#upload-file-message").text("File successfully uploaded");
            //alert("File succesfully uploaded - " + data);
            $("#questionImg").val("");
            $("#option1Img").val("");
            $("#option2Img").val("");
            $("#option3Img").val("");
            $("#option4Img").val("");
            $("#upload-file-message-" + data).text("Success");
        },
        error: function(data) {
            // Handle upload error
            console.log("error : " + JSON.stringify(data));
            $("#upload-file-message").text(
                "File not uploaded (perhaps it's too much big)");
        }
       
        
    });
  
} // function uploadFile




$(document).ready(function() {
    $("#uploadButton").on("change", uploadQuestionPaper);
});

function uploadQuestionPaper() {

    alert("uploading");

    var formData = $("#uploadExcel").serializeArray();
    console.log(formData);

    $.ajax({
        type: "POST",
        url: "/pathTDS/uploadQuestionHeaderForExcelUpload",
        data: formData, // serializes the form's elements.
        success: function(data) {
            if (data === "success") {
                uploadExcelFile();
            }

        },
        error: function(data) {
            console.log("error");
        }
    });


}


// function uploadFile
function uploadExcelFile() {

    $.ajax({
        url: "/pathTDS/uploadExcel",
        type: "POST",
        data: new FormData($("#uploadExcel")[0]),
        enctype: 'multipart/form-data',
        processData: false,
        contentType: false,
        cache: false,
        success: function(data) {
            // Handle upload success
            //          $("#upload-file-message").text("File successfully uploaded");
            alert("File succesfully uploaded - " + data);
            window.location.href = "/pathTDS/uploadQuestionsFromExcel";
     		
        },
        error: function(data) {
            // Handle upload error
            console.log("error : " + JSON.stringify(data));
            $("#upload-file-message").text(
                "File not uploaded (perhaps it's too much big)");
        }
    });

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