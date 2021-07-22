
let publicIp;


function logInInfo(){
	
	//alert(publicIp);
	const browser = navigator.userAgent.toLowerCase();
	let result = "";
	
	if(browser.lastIndexOf('edg')>-1){
		result = 'edge';
	}else if(browser.lastIndexOf('whale')>-1){
		result = 'whale';
	}else if(browser.indexOf('chrome')>-1){
		result = 'chrome';
	}else{
		result = 'any';
	}
	
	 const userId = document.getElementsByName("userId")[0];
	 const userPass = document.getElementsByName("userPass")[0];
	 const pubIp = makeInput("hidden" , "publicIp", publicIp);
	 const privateIp = makeInput("hidden" , "privateIp", location.host);

	 const brow = makeInput("hidden", "browser", result);
	
	

	let f = document.createElement("form");
	f.method = "post";
	f.action = "logIn";
	
	f.appendChild(userId);
	f.appendChild(userPass);
	f.appendChild(pubIp);
	f.appendChild(privateIp);
	f.appendChild(brow);
	
	document.body.appendChild(f);
	
	f.submit();
}


function setPublicIp(data){
	publicIp = data.ip;
 	
}




function makeInput(type, name, val){
	
	let input = document.createElement("input");
	
	input.setAttribute("type", type);
	input.setAttribute("name" , name);
	input.setAttribute("value" , val)
	
	return input;
}

function getAjax(jCode, clientdata, fn){
	//step1
	let ajax = new XMLHttpRequest();
	
	ajax.onreadystatechange = function(){
		if(ajax.status== 200 && ajax.readyState==4){
		//{"true"}
			window[fn](JSON.parse(ajax.responseText)); // 돌아온 결과를 json으로 변환 그거를 브라우저에 찍어준다. 
		}
	};
	
	if(clientdata!=""){
		jCode +="?"+clientdata; 
	}
	
	ajax.open("GET",jCode);
	
	ajax.send();
}
