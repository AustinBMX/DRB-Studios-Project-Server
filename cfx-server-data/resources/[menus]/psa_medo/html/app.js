
addEventListener("message", function(event) {

    if(event.data.meta == "me") {
		document.getElementById("me").innerHTML = event.data.html;
	} else if (event.data.meta == "do") {
		document.getElementById("do").innerHTML = event.data.html;
	}
	
});