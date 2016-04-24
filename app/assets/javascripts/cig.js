$(".pos").on("submit", function(event) {
  event.preventDefault();

var bankDisplay = $(".bank")[0];

  $.ajax({
    type: "POST",
    url: "/cigs/positive",
    dataType: "json",
    success: function(response) {
      bankDisplay.textContent = response;
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
      bankDisplay.textContent = response;
      requestHash();
    }
  });
});

function parseHash(hash) {
  Object.keys(hash).forEach(function(key){
    $("#" + key).text(hash[key]);
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
