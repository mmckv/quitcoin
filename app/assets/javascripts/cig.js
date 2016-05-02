$(".right").on("click", function(event) {
  event.preventDefault();
  event.stopPropagation();
  var bankDisplay = $(".bank").first().find('h4');

  $.ajax({
    type: "POST",
    url: "/cigs/positive",
    dataType: "json",
    success: function(response) {
      bankDisplay.text(response.total);
      requestHash();
    }
  });
});

$(".left").on("click", function(event) {
  event.preventDefault();
  event.stopPropagation();
  var bankDisplay = $(".bank").first().find('h4');

  $.ajax({
    type: "POST",
    url: "/cigs/negative",
    dataType: "json",
    success: function(response) {
      bankDisplay.text(response.total);
      requestHash();
    }
  });
});

function parseHash(hash) {
  Object.keys(hash).forEach(function(key){
    if (key=="quote") {
      $("#"+ key).find(".trans-bgrd").text(hash[key]);
    }  else {
      $("#" + key).text(hash[key]);
    }
  });
}

function requestHash() {
  $.ajax({
    type: "POST",
    url: "/banks/updatevalues",
    dataType: "json",
    success: function(response) {
      parseHash(response);
    }
  });
}

var auto_refresh = setInterval(
   function (){
     $("#time").load("/banks #time").fadeIn("slow");
   }, 60000
 );
