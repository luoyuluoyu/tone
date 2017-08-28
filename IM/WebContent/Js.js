function reloadCode() {
	var time = new Date().getTime();
	document.getElementById("imagecode").src = "ImageServlet?d=" + time;
}

function createXMLHttp() {

	var XMLHttp;
	if (window.ActiveXObject) {
		XMLHttp = new MicrosoftActiveXObject("Microsoft.XMLHTTP");
	} else {
		XMLHttp = new XMLHttpRequest();
	}
	return XMLHttp;
}
function vaild() {
	xmlHttp = createXMLHttp();
	var checkCode = document.getElementById("checkNumber").value;

	xmlHttp.onreadystatechange = getResult;
	xmlHttp.open("GET", "LoginServlet?checkCode=" + checkCode, true);
	xmlHttp.send(null);
}

function getResult() {
	if (xmlHttp && xmlHttp.readyState == 4 && xmlHttp.status == 200) {
		var a = document.getElementById("checkResult");

		var json = JSON.parse(xmlHttp.responseText);
		if (json.name == 1) {
			$(document).ready(function() {
				$("#checkResult").css("color", "green");
			});
			a.innerHTML = "验证通过";
		} else {

			$(document).ready(function() {
				$("#checkResult").css("color", "red");
			});
			a.innerHTML = "验证码不正确";
		}
	}

}

function validate() {
	var a = document.getElementById("show1").innerHTML;
	var b = document.getElementById("show2").innerHTML;
	var c = document.getElementById("show3").innerHTML;
	var d = document.getElementById("show4").innerHTML;
	var e = document.getElementById("checkResult").innerHTML;
	if (a == "ok" && b == "ok" && c == "密码一致" && d == "ok" && e == "验证通过") {
		form1.action = "/IM/qq";
		form1.method = "post";
		form1.submit();
	} else {
		var s = document.getElementById("Verification");
		s.style.color = "#EEAD0E";
		document.getElementById("Verification").innerHTML = "填写正确的必填项"
		var t = setTimeout("timedMsg()", 2000);
		return false;
	}
}
function timedMsg() {
	document.getElementById("Verification").innerHTML = "";
}

function YYYYMMDDstart() {
	MonHead = [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ];

	//先给年下拉框赋内容   
	var y = new Date().getFullYear();
	for (var i = (y - 100); i < y ; i++)
		//以今年为准，前100年，   
		document.reg_testdate.YYYY.options.add(new Option(" " + i + " 年", i));

	//赋月份的下拉框   
	for (var i = 1; i < 13; i++)
		document.reg_testdate.MM.options.add(new Option(" " + i + " 月", i));

	document.reg_testdate.YYYY.value = y;
	document.reg_testdate.MM.value = new Date().getMonth() + 1;
	var n = MonHead[new Date().getMonth()];
	if (new Date().getMonth() == 1 && IsPinYear(YYYYvalue))
		n++;
	writeDay(n); //赋日期下拉框Author:meizz   
	document.reg_testdate.DD.value = new Date().getDate();
}
if (document.attachEvent)
	window.attachEvent("onload", YYYYMMDDstart);
else
	window.addEventListener('load', YYYYMMDDstart, false);
function YYYYDD(str) //年发生变化时日期发生变化(主要是判断闰平年)   
{
	var MMvalue = document.reg_testdate.MM.options[document.reg_testdate.MM.selectedIndex].value;
	if (MMvalue == "") {
		var e = document.reg_testdate.DD;
		optionsClear(e);
		return;
	}
	var n = MonHead[MMvalue - 1];
	if (MMvalue == 2 && IsPinYear(str))
		n++;
	writeDay(n)
}
function MMDD(str) //月发生变化时日期联动   
{
	var YYYYvalue = document.reg_testdate.YYYY.options[document.reg_testdate.YYYY.selectedIndex].value;
	if (YYYYvalue == "") {
		var e = document.reg_testdate.DD;
		optionsClear(e);
		return;
	}
	var n = MonHead[str - 1];
	if (str == 2 && IsPinYear(YYYYvalue))
		n++;
	writeDay(n)
}
function writeDay(n) //据条件写日期的下拉框   
{
	var e = document.reg_testdate.DD;
	optionsClear(e);
	for (var i = 1; i < (n + 1); i++)
		e.options.add(new Option(" " + i + " 日", i));
}
function IsPinYear(year)//判断是否闰平年   
{
	return (0 == year % 4 && (year % 100 != 0 || year % 400 == 0));
}
function optionsClear(e) {
	e.options.length = 1;
}

function onk(name, show) {
	var va = document.getElementById(name).value;
	if (va == null || va == "") {
		var s = document.getElementById(show);
		s.style.color = "red"
		document.getElementById(show).innerHTML = "不能为空";
	} else {
		var s = document.getElementById(show);
		s.style.color = "green"
		document.getElementById(show).innerHTML = "ok";
	}
}

function pass2() {
	var va = document.getElementById("password1").value;
	var va2 = document.getElementById("password2").value;
	if (va == null || va == "") {
		var s = document.getElementById("show3");
		s.style.color = "green"
		document.getElementById("show3").innerHTML = "输入密码才能验证";
	} else {
		if (va !== va2) {
			var s = document.getElementById("show3");
			s.style.color = "red"
			document.getElementById("show3").innerHTML = "密码不一致";
		} else {
			var s = document.getElementById("show3");
			s.style.color = "green"
			document.getElementById("show3").innerHTML = "密码一致";
		}
	}
}

function pass(pw) {
	var str = document.getElementById(pw).value;
	if (str == null || str == "") {
		var s = document.getElementById("show2");
		s.style.color = "red"
		document.getElementById("show2").innerHTML = "请按正确格式设置密码";
	} else {
		if (str.length >= 6 && str.length <= 15) {
			var reg = new RegExp(/^(?![^a-zA-Z]+$)(?!\D+$)/);
			if (reg.test(str))
				var s = document.getElementById("show2");
			s.style.color = "green";
			document.getElementById("show2").innerHTML = "ok";
		} else {
			var s = document.getElementById("show2");
			s.style.color = "red";
			document.getElementById("show2").innerHTML = "请按正确格式设置密码";
		}
	}
}

function onk2(onk) {
	switch (onk) {
	case "show1":
		var s = document.getElementById("show1");
		s.style.color = "#808080"
		document.getElementById("show1").innerHTML = "请输入昵称";
		break;
	case "show2":
		var s = document.getElementById("show2");
		s.style.color = "#808080"
		document.getElementById("show2").innerHTML = "长度不小于6位包括英语和数字";
		break;
	case "show3":
		var s = document.getElementById("show3");
		s.style.color = "#808080"
		document.getElementById("show3").innerHTML = "请再次输入密码";
		break;
	case "show4":
		var s = document.getElementById("show4");
		s.style.color = "#808080"
		document.getElementById("show4").innerHTML = "请输入电话号码";
		break;
	}
}

function numyz() {
	var str = document.getElementById("num").value;
	if (str == null || str == "") {
		var s = document.getElementById("show4");
		s.style.color = "red"
		document.getElementById("show4").innerHTML = "手机号码不能为空哦";
	} else {
		if (str.length == 11) {
			var reg = new RegExp(/^1[3|4|5|8][0-9]\d{4,8}$/);
			if (reg.test(str)) {
				var s = document.getElementById("show4");
				s.style.color = "green"
				document.getElementById("show4").innerHTML = "ok";
			} else {
				var s = document.getElementById("show4");
				s.style.color = "red"
				document.getElementById("show4").innerHTML = "请正确填写手机号码";
			}

		} else {
			var s = document.getElementById("show4");
			s.style.color = "red"
			document.getElementById("show4").innerHTML = "请正确填写手机号码";
		}
	}
}

function reloadCode() {
	var time = new Date().getTime();
	document.getElementById("imagecode").src = "ImageServlet?d=" + time;
}

function createXMLHttp() {

	var XMLHttp;
	if (window.ActiveXObject) {
		XMLHttp = new MicrosoftActiveXObject("Microsoft.XMLHTTP");
	} else {
		XMLHttp = new XMLHttpRequest();
	}
	return XMLHttp;
}
function vaild() {
	xmlHttp = createXMLHttp();
	var checkCode = document.getElementById("checkNumber").value;

	xmlHttp.onreadystatechange = getResult;
	xmlHttp.open("GET", "LoginServlet?checkCode=" + checkCode, true);
	xmlHttp.send(null);
}

function getResult() {
	if (xmlHttp && xmlHttp.readyState == 4 && xmlHttp.status == 200) {
		var a = document.getElementById("checkResult");

		var json = JSON.parse(xmlHttp.responseText);
		if (json.name == 1) {
			$(document).ready(function() {
				$("#checkResult").css("color", "green");
			});
			a.innerHTML = "验证通过";
		} else {

			$(document).ready(function() {
				$("#checkResult").css("color", "red");
			});
			a.innerHTML = "验证码不正确";
		}
	}

}

function validates(userName ,checkResult,num) {
	var a = document.getElementById(userName).innerHTML;
	var b = document.getElementById(checkResult).innerHTML;
	if ( a == "ok" && b == "验证通过") {
		getAccount.action = "forget?go="+num+"";
		getAccount.method = "post";
		getAccount.submit();
	} else {
		var s = document.getElementById("Verification");
		s.style.color = "#EEAD0E";
		document.getElementById("Verification").innerHTML = "填写正确的必填项"
		var t = setTimeout("timedMsg()", 2000);
		return false;
	}
}


