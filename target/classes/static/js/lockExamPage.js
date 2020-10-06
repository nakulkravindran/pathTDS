/*function launchIntoFullscreen(element) {

    alert("maximising....");

  if(element.requestFullscreen) {
    element.requestFullscreen();
  } else if(element.mozRequestFullScreen) {
    element.mozRequestFullScreen();
  } else if(element.webkitRequestFullscreen) {
    element.webkitRequestFullscreen();
  } else if(element.msRequestFullscreen) {
    element.msRequestFullscreen();
  }
}

/*$("#launchIntoFullscreen").click(function(){
    launchIntoFullscreen(document.documentElement);
});*/

// Launch fullscreen for browsers that support it!
$(document).ready(function(){
 
    $("#launchIntoFullscreen").click();
    
   
});

