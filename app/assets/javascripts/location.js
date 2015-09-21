$(document).ready(function() {


    $('.glyphicon-map-marker').click(


          function() {
            var mapOptions = {
            center: new google.maps.LatLng(-34.397, 150.644),
            zoom: 8
          };
          
          $("div#map-base").addClass("map");
          var map = new google.maps.Map(document.getElementById("map-base"), mapOptions);
        

})

})

