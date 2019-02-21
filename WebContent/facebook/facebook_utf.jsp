<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>


<script src="//connect.facebook.net/en_US/all.js"></script>

<script type="text/javascript">
  window.fbAsyncInit = function() {
    FB.init({
      appId      : '980040968789403', // App ID
      channelUrl : 'http://hayageek.com/examples/oauth/facebook/oauth-javascript/channel.html', // Channel File
      status     : true, // check login status
      cookie     : true, // enable cookies to allow the server to access the session
      xfbml      : true  // parse XFBML
    });
    
    
	FB.Event.subscribe('auth.authResponseChange', function(response) 
	{
 	 if (response.status === 'connected') 
  	{
  		document.getElementById("message").innerHTML +=  "<br>Connected to Facebook";
  		//SUCCESS
  		
  	}	 
	else if (response.status === 'not_authorized') 
    {
    	document.getElementById("message").innerHTML +=  "<br>Failed to Connect";

		//FAILED
    } else 
    {
    	document.getElementById("message").innerHTML +=  "<br>Logged Out";

    	//UNKNOWN ERROR
    }
	});	
	
    };
    
   	function facebooklogin()
	{
		FB.login(function(response) {
		   if (response.authResponse) 
		   {
		    	getUserInfo();
  			} else 
  			{
  	    	 console.log('User cancelled login or did not fully authorize.');
   			}
		 },{scope: 'email,user_photos,user_videos'});
	
	
	}

  function getUserInfo() {
	    FB.api('/me', {fields: 'name,link,email,gender'}, function(response) {
	    	
		var str = "<form name=\"facebookLoginform\" role=\"form\" method=\"post\" action=\"\">";
		str += "<input type=\"hidden\" name=\"act\" value=\"facebookLogin\">";
		
		str += "<input type=\"hidden\" name=\"facebookEmail\" value="+response.email+">";

		str += "<input type=\"hidden\" name=\"facebookName\" value="+response.name+">";
		str += "<input type=\"hidden\" name=\"facebookId\" value="+response.id+">";
		str += "<input type=\"hidden\" name=\"facebookGender\" value="+response.gender+">";
		str += "</form>";
		document.getElementById("fbInfo").innerHTML = str;
	  	
	  	document.facebookLoginform.action = "<%=request.getContextPath()%>/user";
	  	document.facebookLoginform.submit();
	  	
    });
    }
	function getPhoto()
	{
	  FB.api('/me/picture?type=normal', function(response) {

		  var str="<br/><b>Pic</b> : <img src='"+response.data.url+"'/>";
	  	  document.getElementById("status").innerHTML+=str;
	  	  	    
    });
	
	}
	function facebooklogout()
	{
		FB.logout(function(){});
	}

  // Load the SDK asynchronously
  (function(d){
     var js, id = 'facebook-jssdk', ref = d.getElementsByTagName('script')[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement('script'); js.id = id; js.async = true;
     js.src = "//connect.facebook.net/en_US/all.js";
     ref.parentNode.insertBefore(js, ref);
   }(document));

</script>

<div id="fbInfo"></div>

