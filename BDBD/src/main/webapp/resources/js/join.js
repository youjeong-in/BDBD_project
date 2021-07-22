/*
$(document).ready(function() {
*/

function joinInfo(){
	let id = document.getElementsByName("userId")[0];
	let pass = document.getElementsByName("userPass")[0];
	let phone = document.getElementsByName("userPhone")[0];
	let name = document.getElementsByName("userName")[0];
	let mail = document.getElementsByName("userMail")[0];
	let mail2 = document.getElementsByName("mailAdd")[0];
	let sex = document.getElementsByName("sex")[0];
	let adress1 = document.getElementsByName("adress")[0];
	let adress2 = document.getElementsByName("adress2")[0];
	let adress3 = document.getElementsByName("adress3")[0];
	let birth = document.getElementsByName("birthDay")[0];
	
	let form = document.createElement("form");
	
	alert(birth.value);
	
	form.setAttribute("action","Join");
	form.setAttribute("method","post");
	
	form.appendChild(id);
	form.appendChild(pass);
	form.appendChild(phone);
	form.appendChild(name);
	form.appendChild(mail);
	form.appendChild(mail2);
	form.appendChild(sex);
	form.appendChild(adress1);
	form.appendChild(adress2);
	form.appendChild(adress3);
	form.appendChild(birth);
	
	document.body.appendChild(form);
	
	form.submit();
}

function isDupCheck(){
	
	const userId = document.getElementsByName("userId")[0];
	
	getajax("isDup", "userId="+userId.value , "afterDup");//true, false 
	
}

function afterDup(data){
	const userId = document.getElementsByName("userId")[0];
	const dupId = document.getElementById("dupId");
		
	if(data==true){ //중복된거 있음
		userId.style.border = "1px solid red";
		dupId.style.color = "red";
		dupId.innerText = "중복된 아이디가 있습니다.";
	}else{ //사용가능
		userId.style.border = "1px solid green";
		dupId.style.color = "green";
		dupId.innerText = "사용가능한 아이디입니다.";
	}
	
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