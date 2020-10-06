

$("#questionPaperNumber").change(function(){

        var questionPaperNumber = {"questionPaperNumber":$("#questionPaperNumber").val()};

        console.log(questionPaperNumber);


        $.ajax({
            type: "POST",
            url: "/pathTDS/searchQuestions",
            data: questionPaperNumber, // serializes the form's elements.
            success: function(responseData)
            {
            	console.log("Success");
                 console.log(responseData);
                 
               /*  $.each(responseData, function(data){
                    var markup = "<tr><td>" + responseData[data].examCategory + "</td>" +
                                                  "<tr><td>" + "Option 11 " + "</td>" +
                                                  "<tr><td>" + responseData[data].allottedTime + "</td>" +
                                                  "<tr><td>" + responseData[data].difficultyLevel + "</td>" +
                                                  "<tr><td>" + responseData[data].question + "</td>" +
                                                  "<tr><td>" + responseData[data].option1 + "</td>" +
                                                  "<tr><td>" + responseData[data].option2 + "</td>" +
                                                  "<tr><td>" + responseData[data].option3 + "</td>" +
                                                  "<tr><td>" + responseData[data].option4 + "</td>" +
                                                  "<tr><td>" + responseData[data].correctAnswer + "</td>" +
                                                  "<tr><td>" + "<button class='btn btn-primary' >edit</button>" + "</td></tr>";

                    $("table tbody").append(markup);

                 });*/
                 
                 
              
                	 responseData[2]
                		 
                		 
                	 
                 })

            },
            error: function(data){
              console.log("error uiu");
            }
        });
        
        
        

});