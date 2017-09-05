/**
 * 
 */
function changeBackcolor(a,b){
	var friend = document.getElementById(a);
	switch(b){
	case '1':
		friend.style.backgroundColor="#e3e3e3";
		break;
	case '2':
		friend.style.backgroundColor="white";
		break;
	case '3':
		friend.style.backgroundColor="#e3e3e3";
		break;
	}
}
function checkLeave(userName){
	xmlHttp = createXMLHttp();
	xmlHttp.onreadystatechange = getResult;
	xmlHttp.open("get", "loginServlet1?userName="+userName+"", true);
	xmlHttp.send(null);
}

function getMessage(a,b){
	xmlHttp = createXMLHttp();
	var Number = a;
	 
	xmlHttp.onreadystatechange = dealMessage;
	xmlHttp.open("post", "onLoadChat?userName="+Number+"&&act=search"+"&&date="+b+"", true);
	xmlHttp.send(null);
	getLocalTime();
	}


function dealMessage(){
if (xmlHttp && xmlHttp.readyState == 4 && xmlHttp.status == 200) {
		var content = document.getElementById("chatview");
		var json = JSON.parse(xmlHttp.responseText);
		if(json.length > 0){
			for(var i = 0 ; i < json.length;i++){
				var col = document.createElement("div");
				col.style.width="225px";

				var col1 =  document.createElement("div");
				col1.style.cssFloat="left";
				col1.innerHTML='<img src="image/head.jpg" height="25" width="25" class="img-circle"/>';
				col.appendChild(col1);
				
				var col2 = document.createElement("div");
				

				var col3 = document.createElement("span");
				col3.style.fontSize="8px";
				col3.style.fontFamily="微软雅黑";
				col3.appendChild(document.createTextNode(json[i].sender));
				col2.appendChild(col3);
				
				var col3_2 = document.createElement("span");
				col3_2.style.fontSize="8px";
				col3_2.style.fontFamily="微软雅黑";
				col3_2.appendChild(document.createTextNode(json[i].sendTime));
				col2.appendChild(col3_2);

				
				var col4 = document.createElement("br");
				col2.appendChild(col4);
				
				var col5 = document.createElement("span");
				col5.style.background="	#e3e3e3";
				col5.style.fontSize="10px";
				col5.style.fontFamily="微软雅黑";
				col5.style.cssFloat="left";
				col5.style.height="20px";
				col5.style.fontWeight="bold";
				col5.style.lineHeight="20px";

				col5.appendChild(document.createTextNode(json[i].content));
				col2.appendChild(col5);
				col.appendChild(col2);

				content.appendChild(col);
				col.style.clear="left";
				keep();

				}
		}
		}
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

function sendMessage(ownNumber,friendNumber) {
	xmlHttp = createXMLHttp();
	xmlHttp.onreadystatechange = getResult;
	xmlHttp.open("post", "onLoadChat?userName="+ownNumber+"&&friendNumber="+friendNumber+"&&act=onload", true);
	xmlHttp.send(null);
}

function getLocalTime(){
	 var date1 = new Date();  
	    var seperator1 = "-";  
	    var seperator2 = ":";  
	    var month = date1.getMonth() + 1;  
	    var strDate = date1.getDate();  
	    if (month >= 1 && month <= 9) {  
	        month = "0" + month;  
	    }  
	    if (strDate >= 0 && strDate <= 9) {  
	        strDate = "0" + strDate;  
	    }  
	    var hour = date1.getHours() ;  
	    var minites = date1.getMinutes();  
	    var seconds = date1.getSeconds();
	   
	    if (minites >= 0 && minites <= 9) {  
	    	minites = "0" + minites;  
	    } 
	    if (seconds >= 0 && seconds <= 9) {  
	    	seconds = "0" + seconds;  
	    } 
	     LocalTime  = date1.getFullYear() + seperator1 + month + seperator1 + 
	    strDate+" "+hour +seperator2+minites+seperator2
	    +seconds;
	     return LocalTime;
}
function getResult() {
	if ( xmlHttp.readyState == 4 && xmlHttp.status == 200) {
				
		var content = document.getElementById("chatview");
		var json = JSON.parse(xmlHttp.responseText);
		if(json.length > 0){
			for(var i = 0 ; i < json.length;i++){
				var col = document.createElement("div");
				col.style.width="600px";

				var col1 =  document.createElement("div");
				col1.style.cssFloat="left";
				col1.innerHTML='<img src="image/head.jpg" height="25" width="25" class="img-circle"/>';
				col.appendChild(col1);
				
				var col2 = document.createElement("div");
				

				var col3 = document.createElement("span");
				col3.style.fontSize="14px";
				col3.style.fontFamily="微软雅黑";
				col3.appendChild(document.createTextNode(json[i].sender));
				col2.appendChild(col3);
				
				var col3_2 = document.createElement("span");
				col3_2.style.fontSize="8px";
				col3_2.style.fontFamily="微软雅黑";
				col3_2.appendChild(document.createTextNode(json[i].sendTime));
				col2.appendChild(col3_2);
				
				var col4 = document.createElement("br");
				col2.appendChild(col4);
				
				
				var col5 = document.createElement("span");
				col5.style.background="	#e3e3e3";
				col5.style.fontSize="12px";
				col5.style.fontFamily="微软雅黑";
				col5.style.cssFloat="left";
				col5.style.height="20px";
				col5.style.fontWeight="bold";
				col5.style.lineHeight="20px";

				col5.appendChild(document.createTextNode(json[i].content));
				col2.appendChild(col5);
				col.appendChild(col2);

				content.appendChild(col);
				col.style.clear="left";
				keep();

			}
		}
		
		//用于查询是否有新消息，获取接受者账号
		var a = document.getElementById("head_right1").value;
		getLocalTime();
		setInterval(function(){getMessage(a,LocalTime)},5000);

		
	}
}

//用于获取编辑文本框中内容并设置为空，也就是清空文本框
function cancel(){
	 CKEDITOR.instances.TextArea1.setData("");
}

function switchchat(a,b){
	
	document.getElementById("chatFriend").innerHTML=b;
	var c = document.getElementById("head_right1").value;
	document.getElementById("chatview").innerHTML="";
	document.getElementById("friendQq").value=a;
	sendMessage(c,a);

}


function send(a,b){
	var sendMessage =CKEDITOR.instances.TextArea1.document.getBody().getText();
	if(sendMessage == ""){
		alert("发送内容不能为空！");
	}else{
		var chatView = document.getElementById("chatview");
		var date1 = new Date();  
	    var seperator1 = "-";  
	    var seperator2 = ":";  
	    var month = date1.getMonth() + 1;  
	    var strDate = date1.getDate();  
	    if (month >= 1 && month <= 9) {  
	        month = "0" + month;  
	    }  
	    if (strDate >= 0 && strDate <= 9) {  
	        strDate = "0" + strDate;  
	    }  
	    var hour = date1.getHours() ;  
	    var minites = date1.getMinutes();  
	    var seconds = date1.getSeconds();
	   
	    if (minites >= 0 && minites <= 9) {  
	    	minites = "0" + minites;  
	    } 
	    if (seconds >= 0 && seconds <= 9) {  
	    	seconds = "0" + seconds;  
	    } 
	    var date = date1.getFullYear() + seperator1 + month + seperator1 + 
	    strDate+" "+hour +seperator2+minites+seperator2
	    +seconds;
		var friendNumber = document.getElementById("friendQq").value;
		cancel();
		
		
		var col = document.createElement("div");
		col.style.width="600px";

		var col1 =  document.createElement("div");
		col1.style.cssFloat="left";
		col1.innerHTML='<img src="image/head.jpg" height="25" width="25" class="img-circle"/>';
		col.appendChild(col1);
		
		var col2 = document.createElement("div");
		

		var col3 = document.createElement("span");
		col3.style.fontSize="14px";
		col3.style.fontFamily="微软雅黑";
		col3.appendChild(document.createTextNode(a));
		col2.appendChild(col3);						
		
		var col3_2 = document.createElement("span");
		col3_2.style.fontSize="8px";
		col3_2.style.fontFamily="微软雅黑";
		col3_2.appendChild(document.createTextNode(hour +":"+ minites+ ":"+ seconds));
		col2.appendChild(col3_2);
		
		var col4 = document.createElement("br");
		col2.appendChild(col4);
		
		var col5 = document.createElement("span");
		col5.style.background="	#e3e3e3";
		col5.style.fontSize="12px";
		col5.style.fontFamily="微软雅黑";
		col5.style.cssFloat="left";
		col5.style.height="20px";
		col5.style.fontWeight="bold";
		col5.style.lineHeight="20px";

		col5.appendChild(document.createTextNode(sendMessage));
		col2.appendChild(col5);
		col.appendChild(col2);

		chatView.appendChild(col);
		col.style.clear="left";
		
		keep();
		
		
		xmlHttp = createXMLHttp();
		xmlHttp.open("post", "onLoadChat?ownNumber="+b+"&&friendNumber="+friendNumber+"&&act=save"+"", true);
		var param ="date="+date+"&content="+sendMessage;
		 xmlHttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlHttp.send(param);
	}
}

function keep(){
	var div = document.getElementById('chatview');
	div.scrollTop = div.scrollHeight;
}
function deletefriend(number,nickName){
	var message = "删除"+ nickName +"同时会删除对方的临时会话信息，以后不再接收此联系人！";
	var isDel = window.confirm(message);
	if(isDel == true){
	 $.ajax({
	     type: "get",
	     url: "DeleteFriends?accountnumber="+number+"&nickName="+nickName+"",
	    cache:false,
	    dataType:'json',
	     success: function(data){
	    var userDiv = document.getElementById("panel-987843");
	    $("#panel-987843").empty();
	    for(var i =0; i<data.length;i++){
	    	var div1 =document.createElement("div");
	    	div1.setAttribute("id",data[i].userName);
	    	div1.setAttribute("onDblclick","switchchat('"+data[i].userName+"','"+data[i].nickName+"')");
	    	div1.setAttribute("onmousedown","changeBackcolor('"+data[i].userName+"','1')");
	    	div1.setAttribute("onMouseOut","changeBackcolor('"+data[i].userName+"','2')");
	    	div1.setAttribute("onmouseover","changeBackcolor('"+data[i].userName+"','3')");
	    	userDiv.appendChild(div1);
	    	
	    	var img =document.createElement("img");
	    	img.setAttribute("src","image/head1.jpg");
	    	img.setAttribute("class","img-circle");
	    	div1.appendChild(img);
	    	
	    	var span =document.createElement("span");
	    	span.innerHTML=data[i].nickName;
	    	div1.appendChild(span);
	    	
	    	var span2 =document.createElement("span");
	    	span2.innerHTML="(在线)";
	    	div1.appendChild(span2);
	    	
	    	var p =document.createElement("p");
	    	p.setAttribute("id","isDelete");
	    	div1.appendChild(p);
	    	
		    	var a =document.createElement("a");
		    	a.setAttribute("onclick","deletefriend("+data[i].userName+","+data[i].nickName+")");
		    	p.appendChild(a);
	    			
			    	var span3 =document.createElement("span");
			    	span3.setAttribute("class","glyphicon glyphicon-trash");
			    	a.appendChild(span3);
	    }
	},
	error: function(){
	      alert("怎么出错了呢");
	     }
});
}
}
function add(username){
	var accountnumber = window.prompt("请输入你要查找的账号","");
	var xmlhttp;
	if(accountnumber != null && accountnumber != ""){
		if (window.ActiveXObject) {
			xmlhttp = new MicrosoftActiveXObject("Microsoft.XMLHTTP");
		} else {
			xmlhttp = new XMLHttpRequest();
		}
		xmlhttp.open("get", "friendManage?act=select&accountnumber="+accountnumber+"&username="+username+"",true);
		xmlhttp.send(null);
		xmlhttp.onreadystatechange=function(){
			if (xmlhttp.readyState==4 && xmlhttp.status==200){
				var usermessage = xmlhttp.responseText;
				
				if(usermessage.length >= 28 || usermessage.length == 10){
					alert(usermessage);
				}
				else{
					
				var isAdd = confirm(usermessage);
				if(isAdd == true){
						 $.ajax({
						     type: "get",
						     url: "friendManage?act=selects&accountnumber="+accountnumber+"&username="+username+"",
						    cache:false,
						    dataType:'json',
						     success: function(data){
						    var userDiv = document.getElementById("panel-987843");
						    $("#panel-987843").empty();
						    for(var i =0; i<data.length;i++){
						    	var div1 =document.createElement("div");
						    	div1.setAttribute("id",data[i].userName);
						    	div1.setAttribute("onDblclick","switchchat('"+data[i].userName+"','"+data[i].nickName+"')");
						    	div1.setAttribute("onmousedown","changeBackcolor('"+data[i].userName+"','1')");
						    	div1.setAttribute("onMouseOut","changeBackcolor('"+data[i].userName+"','2')");
						    	div1.setAttribute("onmouseover","changeBackcolor('"+data[i].userName+"','3')");
						    	userDiv.appendChild(div1);
						    	
						    	var img =document.createElement("img");
						    	img.setAttribute("src","image/head1.jpg");
						    	img.setAttribute("class","img-circle");
						    	div1.appendChild(img);
						    	
						    	var span =document.createElement("span");
						    	span.innerHTML=data[i].nickName;
						    	div1.appendChild(span);
						    	
						    	var span2 =document.createElement("span");
						    	span2.innerHTML="(在线)";
						    	div1.appendChild(span2);
						    	
						    	var p =document.createElement("p");
						    	p.setAttribute("id","isDelete");
						    	div1.appendChild(p);
						    	
							    	var a =document.createElement("a");
							    	a.setAttribute("onclick","deletefriend("+data[i].userName+","+data[i].nickName+")");
							    	p.appendChild(a);
						    			
								    	var span3 =document.createElement("span");
								    	span3.setAttribute("class","glyphicon glyphicon-trash");
								    	a.appendChild(span3);
						    }
						},
						error: function(){
						      alert("怎么出错了呢");
						     }
					});
				}
						     
			};  
					        
					};
				};
		
	};
};
function cleanHistory(){
	var sender = document.getElementById("head_right1").value;
	var getter = document.getElementById("friendQq").value;
	var xmlhttp;	
	//var getterName = document.getElementById("chatFriend").value;
	var isClean = confirm("您确认要删除聊天记录吗？删除后不可恢复！");
	if(isClean == true){
		if (window.ActiveXObject) {
			xmlhttp = new MicrosoftActiveXObject("Microsoft.XMLHTTP");
		} else {
			xmlhttp = new XMLHttpRequest();
		}
		xmlhttp.open("get","CleanHistory?sender="+sender+"&getter="+getter+"",true);
		xmlhttp.send(null);
		xmlhttp.onreadystatechange=function(){
			if (xmlHttp && xmlHttp.readyState == 4 && xmlHttp.status == 200) {
				
				var content = document.getElementById("chatview");
				document.getElementById("chatview").innerHTML="";
				var json = JSON.parse(xmlHttp.responseText);
				if(json.length > 0){
					for(var i = 0 ; i < json.length;i++){
						var col = document.createElement("div");
						col.style.width="600px";

						var col1 =  document.createElement("div");
						col1.style.cssFloat="left";
						col1.innerHTML='<img src="image/head.jpg" height="25" width="25" class="img-circle"/>';
						col.appendChild(col1);
						
						var col2 = document.createElement("div");
						

						var col3 = document.createElement("span");
						col3.style.fontSize="14px";
						col3.style.fontFamily="微软雅黑";
						col3.appendChild(document.createTextNode(json[i].sender));
						col2.appendChild(col3);
						var col4 = document.createElement("br");
						col2.appendChild(col4);
						
						var col5 = document.createElement("span");
						col5.style.background="	#e3e3e3";
						col5.style.fontSize="12px";
						col5.style.fontFamily="微软雅黑";
						col5.style.cssFloat="left";
						col5.style.height="20px";
						col5.style.fontWeight="bold";
						col5.style.lineHeight="20px";

						col5.appendChild(document.createTextNode(json[i].content));
						col2.appendChild(col5);
						col.appendChild(col2);

						content.appendChild(col);  
						col.style.clear="left";
						keep();

					}
				}
			}
			
		}
	}
}
//修改清除聊天历史按钮得到失去焦点变换颜色
$(document).ready(function(){
$("#cleanhistory").mouseenter(function(){
	$(this).css("background-color","#C0C0C0");
});
});
$(document).ready(function(){
	$("#cleanhistory").mouseleave(function(){
		$(this).css("background-color","#F0F0F0");
	});
	});