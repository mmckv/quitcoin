$(".pos").on("submit", function(event) {
  event.preventDefault();

var bankDisplay = $(".bank")[0];

  $.ajax({
    type: "POST",
    url: "/cigs/positive",
    dataType: "json",
    success: function(response) {
      bankDisplay.textContent = response.total;
      requestHash();
    }
  });
});

$(".neg").on("submit", function(event) {
  event.preventDefault();

var bankDisplay = $(".bank")[0];

  $.ajax({
    type: "POST",
    url: "/cigs/negative",
    dataType: "json",
    success: function(response) {
      bankDisplay.textContent = response.total;
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
