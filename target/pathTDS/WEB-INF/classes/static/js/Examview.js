
$("#examlistview").change(function(){

       var exmid = $("#examlistview").val();
  
      // alert(exmid);

        window.location.href = "/pathTDS" +
        		"/examsingleview?examid=" + exmid;

 });

$("#examlistedit").change(function(){

    var exmid = $("#examlistedit").val();

   // alert(exmid);

     window.location.href = "/pathTDS" +
     		"/singleexamedit?examid=" + exmid;

});
