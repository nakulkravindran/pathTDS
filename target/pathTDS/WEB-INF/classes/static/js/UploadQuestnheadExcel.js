


   // Upload question header and Excel
$("#uploadQuestions").click(function(e) {

 
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
           
            var questionPaperNumber = $("#questionPaperNumber").val();

            var section1 = $("#section1").val();
            var section2 = $("#section2").val();
            var section3 = $("#section3").val();

            if($("#section").val() === null || $("#section").val() === ""){
                $("#section").val("Default");
            }

            var formData = $("#uploadQuestionsForm").serializeArray();

        //    alert(passPercentage);
            console.log(formData);

            $.ajax({
                   type: "POST",
                   url: url,
                   data: formData, // serializes the form's elements.
                   success: function(data)
                   {
                       TotalQuestions = TotalQuestions + 1;
                       TotalTime = TotalTime + (timePerQuestion/60);
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

                   },
                   error: function(data){
                    console.log("error");
                   }
                 });


  
    e.preventDefault(); // avoid to execute the actual submit of the form.
});
