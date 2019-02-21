var dr_order = 0;
var map;
var marker;
var markers = [];
var addresses= [];
var poly;
var path;
var defaultLat = 36.661662;
var defaultLng = 127.883371;
var defaultLevel = 7;
var place;	      
var path;
var root;
var p_id;
var bounds;
var newIndex;
var oldIndex;

//  [
//	  {area : ...., lat : ...., lng : ....} , 
//	  {area : ...., lat : ...., lng : ....},  
//	  {area : ...., lat : ...., lng : ....}, 
//	  {area : ...., lat : ...., lng : ....}
//  ]



function deletePlanner(){
	
	document.getElementById("memo").value = "";
	document.getElementById("house").value = "";
	document.getElementById("transport").value="";
	$("#addLocation").empty();
	for (var i = 0; i < markers.length; i++) {
  	    markers[i].setMap(null);
	}
    markers = [];
    addresses = [];
    path = poly.getPath();
    path.clear();
	
	
	
}

	          
function initMap() {
    	  
   bounds = new google.maps.LatLngBounds();	
   var korea = {lat: defaultLat, lng: defaultLng};

   map = new google.maps.Map(document.getElementById('map'), {
   zoom: defaultLevel,
   center: korea,
  
});




var lineSymbol = {
		path : google.maps.SymbolPath.FORWARD_CLOSED_ARROW
		
};


poly = new google.maps.Polyline({
    strokeColor: '#ff0000',
    strokeOpacity: 1.0,
    icons: [{
      icon: lineSymbol,
      offset: '100%',
   	  repeat: '20%'
    }],
    strokeWeight: 1.5
    
});

poly.setMap(map);


geocoder = new google.maps.Geocoder();

var autocomplete = new google.maps.places.Autocomplete(
		
		
		document.getElementById("address"), {
		types: ['establishment'] 
		
});
 google.maps.event.addListener(autocomplete, 'place_changed', function() {
        place = autocomplete.getPlace();
        if (place.geometry) {
        	map.panTo(place.geometry.location);
        	map.setZoom(15);
       	}
     });
       
  }  //initmap();
  
  
  
  function geocodeAddress(geocoder, resultMap){
	  
	  var address = document.getElementById("address").value;
	  geocoder.geocode({'address' : address}, function(results, status){
	  
		  if (status === google.maps.GeocoderStatus.OK){
			  
			  addMarker(results[0].geometry.location);
			  addRouteDiv(address);
			  bounds.extend(results[0].geometry.location);
			  map.fitBounds(bounds);
			  //addLine(results[0].geometry.location);
			  
		  }else{
			  
			  alert('Geocode was not successful for the following reason: ' + status);
	
		  }
			  
	  });
	  
  }
  
  function addLine(){
	  
	  path = poly.getPath();
	  path.clear();
	  for(var i = 0 ; i <markers.length; i ++){
		  path.push(markers[i].getPosition());
	  }
  }

  function addMarker(location) {
      marker = new google.maps.Marker({
      position: location,
      map: map
    });
    markers.push(marker);
    path = poly.getPath();
    path.push(location);
    
  }
  
  function addRouteDiv(address){
	  
	  var route = document.getElementById("addLocation");
	  //var address = document.getElementById("address").value;
	  var div = document.createElement("div");
	  div.setAttribute("id", dr_order);
	  div.setAttribute("class", "form-control");
	  div.setAttribute("style", "text-align: center; overflow: auto; height: 50px; padding-top: 12px; margin-bottom: 7px;");
	  var textRoute = document.createTextNode(address);
	  div.appendChild(textRoute);
	  
	  var a = document.createElement("a");
	  a.setAttribute("class", "closebtn pull-right");
	  a.setAttribute("onclick", "removeRoute('"+dr_order+"')");
	  dr_order++;
	  var span = document.createElement("span");
	  span.setAttribute("class", "glyphicon glyphicon-remove");
	  
	  a.appendChild(span);
	  div.appendChild(a);
	  route.appendChild(div);
  }

  
  function deleteMarkers() {
	  
	  $("#addLocation").empty();
	  for (var i = 0; i < markers.length; i++) {
    	    markers[i].setMap(null);
	  }
	  markers = [];
	  path = poly.getPath();
	  path.clear();
	  
  }
  
  $(function(){
		
		
		
	    $("#addLocation").sortable({
	    	
	    	start: function(event, div) { 
	    		
	    		oldIndex = div.item.index();
	    		console.log("oldIndex : " + oldIndex +"\n");
	        },
	        update: function(event, div) {
	        	newIndex = div.item.index();
	        	var markerTemp = markers[oldIndex];
	    		var addrTemp = addresses[oldIndex];
	    		
	    		if(oldIndex > newIndex){
	    			
	    			//+1하고
	    			for(var i=oldIndex; i>newIndex;i--){
	    				
	    				markers[i] = markers[i-1];
	    				addresses[i] = addresses[i-1];
	    				
	    			}
	    			markers[newIndex] = markerTemp;
	    			addresses[newIndex] = addrTemp;
	    			
	    		}else{ //oldIndex < newIndex
	    			
	    			// -1 하고
	    			for(var i = oldIndex; i<newIndex; i++){
	    				
	    				markers[i] = markers[i+1];
	    				addresses[i] = addresses[i+1];
	    				
	    			}
	    			markers[newIndex] = markerTemp;
	    			addresses[newIndex] = addrTemp;
	    		}
	    		addLine();

	        },
	    	stop:function(event, ui){
	    		
	    		$("#addLocation>div").each(function(index){
	    			
	    			$(this).attr("id", index);
	    			$(this).children().attr("onclick", "removeRoute('"+index+"')");
	    		});
	    		
	    		
	    		
	    	}
	    });
	    
	    $("#address").keypress(function(key){
	    	
	    	if(key.keyCode == 13){//키가 13이면 실행 (엔터는 13)
	    		var address = $("#address").val()
		    	addresses.push(address);
			   	geocodeAddress(geocoder, map);
			   	$("#address").val("");
			   	
	        }
		});
	    
	    $("#submit").click(function(){
	    	
	    	var address = $("#address").val()
	    	addresses.push(address);
		   	geocodeAddress(geocoder, map);
	   	
	 	});
	    
	    
	})

	function removeRoute(delete_order){
	  
	  var div = document.getElementById("addLocation");
	  var route = document.getElementById(delete_order);
	  div.removeChild(route);
	  $("#addLocation>div").each(function(index){
			
			$(this).attr("id", index);
			$(this).children().attr("onclick", "removeRoute('"+index+"')");
	  });
	  markers[delete_order].setMap(null);
	  markers.splice(delete_order,1);
	  addresses.splice(delete_order,1);
	  dr_order--;
	  addLine();
		  
	  var len = markers.length;
	     bounds = new google.maps.LatLngBounds(null);
	     for(var i = 0; i < len;i++){
	        bounds.extend(markers[i].getPosition());
	        map.fitBounds(bounds);
	     }
	}
  
  