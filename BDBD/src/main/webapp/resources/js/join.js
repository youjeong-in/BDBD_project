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