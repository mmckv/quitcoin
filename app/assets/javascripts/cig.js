$(".pos").on("submit", function(event) {
  event.preventDefault();

var bankDisplay = $('.bank')[0];

  var request = $.ajax({
    type: "POST",
    url: '/cigs/positive',
    dataType: "json",
    success: function(response) {
      bankDisplay.textContent = response;
      requestHash();
    }
  });
});

$(".neg").on("submit", function(event) {
  event.preventDefault();

var bankDisplay = $('.bank')[0];

  var request = $.ajax({
    type: "POST",
    url: '/cigs/negative',
    dataType: "json",
    success: function(response) {
      bankDisplay.textContent = response;
      requestHash();
    }
  });
});

function parseHash(hash) {
  Object.keys(hash).forEach(function(key,index){
    $('#' + key).text(hash[key]);
  });
}

function requestHash()
{
  var request = $.ajax
  (
    {
      type: "POST",
      url: '/banks/updatevalues',
      dataType: "json",
      success: function(response) {
        parseHash(response);
      }
    }
  )
}
