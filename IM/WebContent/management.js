num=1;
$(function() {
	$('#pagingnum').blur(function() {
		num = document.getElementById("paging").innerHTML;
		 pagingnum = document.getElementById("pagingnum").value;
		if(pagingnum != null && pagingnum != "" && pagingnum<=num){
			$.ajax({
				url : "Management",// 跳转
				type : "Post",
				data : {
					act:"getforwardpagings",
					paging:pagingnum
				},
				cache : false,
				dataType : 'json',
				success : function(data) {
					var userDiv = document.getElementById("aaa");
					userDiv.innerHTML = "";
					for(var i = 0; i <data.length; i++){
						var div3_1 = document.createElement("div");//添加 div
						div3_1.setAttribute("class", "col-xs-1");//设置 div 属性，如 id
						div3_1.innerHTML =data[i].id ;
						userDiv.appendChild(div3_1);

						var div3_2 = document.createElement("div");//添加 div
						div3_2.setAttribute("class", "col-xs-2");//设置 div 属性，如 id
						div3_2.innerHTML =data[i].userName ;
						userDiv.appendChild(div3_2);

						var div3_3 = document.createElement("div");//添加 div
						div3_3.setAttribute("class", "col-xs-2");//设置 div 属性，如 id
						div3_3.innerHTML =data[i].nickName ;
						userDiv.appendChild(div3_3);

						var div3_5 = document.createElement("div");//添加 div
						div3_5.setAttribute("class", "col-xs-1");//设置 div 属性，如 id
						div3_5.innerHTML =data[i].gender;
						userDiv.appendChild(div3_5);

						var div3_6 = document.createElement("div");//添加 div
						div3_6.setAttribute("class", "col-xs-2");//设置 div 属性，如 id
						div3_6.innerHTML =data[i].telephoneNumber;
						userDiv.appendChild(div3_6);

						var div3_8 = document.createElement("div");//添加 div
						div3_8.setAttribute("class", "col-xs-2");//设置 div 属性，如 id
						div3_8.innerHTML =data[i].birthday;
						userDiv.appendChild(div3_8);

						var div2_1 = document.createElement("div");//添加 div
						div2_1.setAttribute("class", "col-xs-2");//设置 div 属性，如 id
						div2_1.innerHTML ="&nbsp;"
							userDiv.appendChild(div2_1);

						var button = document.createElement("button");//添加 div
						button.setAttribute("class", "btn btn-success btn-xs");
						button.setAttribute("data-toggle", "modal");
						button.setAttribute("data-target", "#reviseUser");
						button.setAttribute("data-param", data[i].id);//设置 div 属性，如 id
						button.setAttribute("data-param2", data[i].userName);
						button.setAttribute("style", "margin-right: 2px"); 
						button.innerHTML ="修改";
						div2_1.appendChild(button);

						var button2 = document.createElement("button");//添加 div
						button2.setAttribute("class", "btn btn-danger btn-xs");
						button2.setAttribute("data-toggle", "modal");
						button2.setAttribute("data-target", "#deleteUser");
						button2.setAttribute("data-param", data[i].userName);//设置 div 属性，如 id
						button2.setAttribute("style", "margin-right: 2px");
						button2.innerHTML ="删除";
						div2_1.appendChild(button2);

						var button3 = document.createElement("button");//添加 div
						button3.setAttribute("class", "btn btn-danger btn-xs");
						button3.setAttribute("data-toggle", "modal");
						button3.setAttribute("data-target", "#Chatlog");
						button3.setAttribute("data-param", data[i].userName);//设置 div 属性，如 id
						button3.innerHTML ="好友";
						div2_1.appendChild(button3);
					}
					
					document.getElementById("pag").innerHTML="当前:"+pagingnum;
				},
				error : function() {
					alert("跳转失败，请重试。")
				},
			});
		}else{
			alert("请正确输入")
		}
	});

})

$(function() {
	$('#forward').click(function() {
		$.ajax({
			url : "Management",// 跳转
			type : "Post",
			data : {
				act:"getforwardpaging",
				
			},

			cache : false,
			dataType : 'json',
			success : function(data) {
				var userDiv = document.getElementById("aaa");
				userDiv.innerHTML = "";
				for(var i = 0; i <data.length; i++){
					var div3_1 = document.createElement("div");//添加 div
					div3_1.setAttribute("class", "col-xs-1");//设置 div 属性，如 id
					div3_1.innerHTML =data[i].id ;
					userDiv.appendChild(div3_1);

					var div3_2 = document.createElement("div");//添加 div
					div3_2.setAttribute("class", "col-xs-2");//设置 div 属性，如 id
					div3_2.innerHTML =data[i].userName ;
					userDiv.appendChild(div3_2);

					var div3_3 = document.createElement("div");//添加 div
					div3_3.setAttribute("class", "col-xs-2");//设置 div 属性，如 id
					div3_3.innerHTML =data[i].nickName ;
					userDiv.appendChild(div3_3);

					var div3_5 = document.createElement("div");//添加 div
					div3_5.setAttribute("class", "col-xs-1");//设置 div 属性，如 id
					div3_5.innerHTML =data[i].gender;
					userDiv.appendChild(div3_5);

					var div3_6 = document.createElement("div");//添加 div
					div3_6.setAttribute("class", "col-xs-2");//设置 div 属性，如 id
					div3_6.innerHTML =data[i].telephoneNumber;
					userDiv.appendChild(div3_6);

					var div3_8 = document.createElement("div");//添加 div
					div3_8.setAttribute("class", "col-xs-2");//设置 div 属性，如 id
					div3_8.innerHTML =data[i].birthday;
					userDiv.appendChild(div3_8);

					var div2_1 = document.createElement("div");//添加 div
					div2_1.setAttribute("class", "col-xs-2");//设置 div 属性，如 id
					div2_1.innerHTML ="&nbsp;"
						userDiv.appendChild(div2_1);

					var button = document.createElement("button");//添加 div
					button.setAttribute("class", "btn btn-success btn-xs");
					button.setAttribute("data-toggle", "modal");
					button.setAttribute("data-target", "#reviseUser");
					button.setAttribute("data-param", data[i].id);//设置 div 属性，如 id
					button.setAttribute("data-param2", data[i].userName);
					button.setAttribute("style", "margin-right: 2px"); 
					button.innerHTML ="修改";
					div2_1.appendChild(button);

					var button2 = document.createElement("button");//添加 div
					button2.setAttribute("class", "btn btn-danger btn-xs");
					button2.setAttribute("data-toggle", "modal");
					button2.setAttribute("data-target", "#deleteUser");
					button2.setAttribute("data-param", data[i].userName);//设置 div 属性，如 id
					button2.setAttribute("style", "margin-right: 2px");
					button2.innerHTML ="删除";
					div2_1.appendChild(button2);

					var button3 = document.createElement("button");//添加 div
					button3.setAttribute("class", "btn btn-danger btn-xs");
					button3.setAttribute("data-toggle", "modal");
					button3.setAttribute("data-target", "#Chatlog");
					button3.setAttribute("data-param", data[i].userName);//设置 div 属性，如 id
					button3.innerHTML ="好友";
					div2_1.appendChild(button3);
					
					
				}
				if(num>1){
					--num;
				}
				document.getElementById("pag").innerHTML="当前:"+num;
			},
			error : function() {
				alert("前分页失败，请重试。")
			},
		});
	});

})

$(function() {
	$('#next').click(function() {
		$.ajax({
			url : "Management",// 跳转
			type : "Post",
			data : {
				act:"getpaging",
				
			},

			cache : false,
			dataType : 'json',
			success : function(data) {
				var userDiv = document.getElementById("aaa");
				userDiv.innerHTML = "";
				for(var i = 0; i <data.length; i++){
					var div3_1 = document.createElement("div");//添加 div
					div3_1.setAttribute("class", "col-xs-1");//设置 div 属性，如 id
					div3_1.innerHTML =data[i].id ;
					userDiv.appendChild(div3_1);

					var div3_2 = document.createElement("div");//添加 div
					div3_2.setAttribute("class", "col-xs-2");//设置 div 属性，如 id
					div3_2.innerHTML =data[i].userName ;
					userDiv.appendChild(div3_2);

					var div3_3 = document.createElement("div");//添加 div
					div3_3.setAttribute("class", "col-xs-2");//设置 div 属性，如 id
					div3_3.innerHTML =data[i].nickName ;
					userDiv.appendChild(div3_3);

					var div3_5 = document.createElement("div");//添加 div
					div3_5.setAttribute("class", "col-xs-1");//设置 div 属性，如 id
					div3_5.innerHTML =data[i].gender;
					userDiv.appendChild(div3_5);

					var div3_6 = document.createElement("div");//添加 div
					div3_6.setAttribute("class", "col-xs-2");//设置 div 属性，如 id
					div3_6.innerHTML =data[i].telephoneNumber;
					userDiv.appendChild(div3_6);

					var div3_8 = document.createElement("div");//添加 div
					div3_8.setAttribute("class", "col-xs-2");//设置 div 属性，如 id
					div3_8.innerHTML =data[i].birthday;
					userDiv.appendChild(div3_8);

					var div2_1 = document.createElement("div");//添加 div
					div2_1.setAttribute("class", "col-xs-2");//设置 div 属性，如 id
					div2_1.innerHTML ="&nbsp;"
						userDiv.appendChild(div2_1);

					var button = document.createElement("button");//添加 div
					button.setAttribute("class", "btn btn-success btn-xs");
					button.setAttribute("data-toggle", "modal");
					button.setAttribute("data-target", "#reviseUser");
					button.setAttribute("data-param", data[i].id);//设置 div 属性，如 id
					button.setAttribute("data-param2", data[i].userName);
					button.setAttribute("style", "margin-right: 2px"); 
					button.innerHTML ="修改";
					div2_1.appendChild(button);

					var button2 = document.createElement("button");//添加 div
					button2.setAttribute("class", "btn btn-danger btn-xs");
					button2.setAttribute("data-toggle", "modal");
					button2.setAttribute("data-target", "#deleteUser");
					button2.setAttribute("data-param", data[i].userName);//设置 div 属性，如 id
					button2.setAttribute("style", "margin-right: 2px");
					button2.innerHTML ="删除";
					div2_1.appendChild(button2);

					var button3 = document.createElement("button");//添加 div
					button3.setAttribute("class", "btn btn-danger btn-xs");
					button3.setAttribute("data-toggle", "modal");
					button3.setAttribute("data-target", "#Chatlog");
					button3.setAttribute("data-param", data[i].userName);//设置 div 属性，如 id
					button3.innerHTML ="好友";
					div2_1.appendChild(button3);
					
					
				}
				numq=document.getElementById("paging").innerHTML;
				if(num<numq){
					++num;
				}
				document.getElementById("pag").innerHTML="当前:"+num;
			},
			error : function() {
				alert("分页失败，请重试。")
			},
		});
	});

})

$(function() {
	$('#reviseUser').on('show.bs.modal', function() {
		param = $(event.target).data('param');
		param2 = $(event.target).data('param2');
		document.getElementById("usernameshow").innerHTML=param2;
	});
	$('#updataook').click(function() {

		var sName = param2;
		var sLink = document.getElementById("sLink").value;
		var gender = $("input[type='radio']:checked").val();
		var sKnot = document.getElementById("sKnot").value;
		var sbnot = document.getElementById("sbnot").value;
		var sqnot = document.getElementById("sqnot").value;

		$.ajax({
			url : "Management",// 跳转
			type : "Post",
			data : {
				act:"update",
				id:param,
				num:sName,
				sLink:sLink,
				gender:gender,
				sKnot:sKnot,
				sbnot:sbnot,
				sqnot:sqnot
			},

			cache : false,
			dataType : 'json',
			success : function(data) {
				var userDiv = document.getElementById("aaa");
				userDiv.innerHTML = "";
				for(var i = 0; i <data.length; i++){
					var div3_1 = document.createElement("div");//添加 div
					div3_1.setAttribute("class", "col-xs-1");//设置 div 属性，如 id
					div3_1.innerHTML =data[i].id ;
					userDiv.appendChild(div3_1);

					var div3_2 = document.createElement("div");//添加 div
					div3_2.setAttribute("class", "col-xs-2");//设置 div 属性，如 id
					div3_2.innerHTML =data[i].userName ;
					userDiv.appendChild(div3_2);

					var div3_3 = document.createElement("div");//添加 div
					div3_3.setAttribute("class", "col-xs-2");//设置 div 属性，如 id
					div3_3.innerHTML =data[i].nickName ;
					userDiv.appendChild(div3_3);

					var div3_5 = document.createElement("div");//添加 div
					div3_5.setAttribute("class", "col-xs-1");//设置 div 属性，如 id
					div3_5.innerHTML =data[i].gender;
					userDiv.appendChild(div3_5);

					var div3_6 = document.createElement("div");//添加 div
					div3_6.setAttribute("class", "col-xs-2");//设置 div 属性，如 id
					div3_6.innerHTML =data[i].telephoneNumber;
					userDiv.appendChild(div3_6);

					var div3_8 = document.createElement("div");//添加 div
					div3_8.setAttribute("class", "col-xs-2");//设置 div 属性，如 id
					div3_8.innerHTML =data[i].birthday;
					userDiv.appendChild(div3_8);

					var div2_1 = document.createElement("div");//添加 div
					div2_1.setAttribute("class", "col-xs-2");//设置 div 属性，如 id
					div2_1.innerHTML ="&nbsp;"
						userDiv.appendChild(div2_1);

					var button = document.createElement("button");//添加 div
					button.setAttribute("class", "btn btn-success btn-xs");
					button.setAttribute("data-toggle", "modal");
					button.setAttribute("data-target", "#reviseUser");
					button.setAttribute("data-param", data[i].id);//设置 div 属性，如 id
					button.setAttribute("style", "margin-right: 2px"); 
					button.innerHTML ="修改";
					div2_1.appendChild(button);

					var button2 = document.createElement("button");//添加 div
					button2.setAttribute("class", "btn btn-danger btn-xs");
					button2.setAttribute("data-toggle", "modal");
					button2.setAttribute("data-target", "#deleteUser");
					button2.setAttribute("data-param", data[i].userName);//设置 div 属性，如 id
					button.setAttribute("data-param2", data[i].userName);
					button2.setAttribute("style", "margin-right: 2px");
					button2.innerHTML ="删除";
					div2_1.appendChild(button2);

					var button3 = document.createElement("button");//添加 div
					button3.setAttribute("class", "btn btn-danger btn-xs");
					button3.setAttribute("data-toggle", "modal");
					button3.setAttribute("data-target", "#Chatlog");
					button3.setAttribute("data-param", data[i].userName);//设置 div 属性，如 id
					button3.innerHTML ="好友";
					div2_1.appendChild(button3);

				}
			},
			error : function() {
				alert("修改失败，请重试。")
			},
		});
	});

})

$(function() {
	$('#deleteUser').on('show.bs.modal', function() {
		param = $(event.target).data('param');
		$('#delTipContainer').data('deletetip', param);
		$('#delTipContainer').text('确定要删除' + param + '？删除后不可恢复！');
	});
	$('#button_footer').click(function() {
		var num = $('#delTipContainer').data('deletetip');
		$('#delTipContainer').removeData('deletetip');
		$.ajax({
			url : 'Management?act=del&num=' + num + '',// 跳转
			type : 'get',
			cache : false,
			dataType : 'json',
			success : function(data) {
				var userDiv = document.getElementById("aaa");
				userDiv.innerHTML = "";
				for(var i = 0; i <data.length; i++){
					var div3_1 = document.createElement("div");//添加 div
					div3_1.setAttribute("class", "col-xs-1");//设置 div 属性，如 id
					div3_1.innerHTML =data[i].id ;
					userDiv.appendChild(div3_1);

					var div3_2 = document.createElement("div");//添加 div
					div3_2.setAttribute("class", "col-xs-2");//设置 div 属性，如 id
					div3_2.innerHTML =data[i].userName ;
					userDiv.appendChild(div3_2);

					var div3_3 = document.createElement("div");//添加 div
					div3_3.setAttribute("class", "col-xs-2");//设置 div 属性，如 id
					div3_3.innerHTML =data[i].nickName ;
					userDiv.appendChild(div3_3);

					var div3_5 = document.createElement("div");//添加 div
					div3_5.setAttribute("class", "col-xs-1");//设置 div 属性，如 id
					div3_5.innerHTML =data[i].gender;
					userDiv.appendChild(div3_5);

					var div3_6 = document.createElement("div");//添加 div
					div3_6.setAttribute("class", "col-xs-2");//设置 div 属性，如 id
					div3_6.innerHTML =data[i].telephoneNumber;
					userDiv.appendChild(div3_6);

					var div3_8 = document.createElement("div");//添加 div
					div3_8.setAttribute("class", "col-xs-2");//设置 div 属性，如 id
					div3_8.innerHTML =data[i].birthday;
					userDiv.appendChild(div3_8);

					var div2_1 = document.createElement("div");//添加 div
					div2_1.setAttribute("class", "col-xs-2");//设置 div 属性，如 id
					div2_1.innerHTML ="&nbsp;"
						userDiv.appendChild(div2_1);

					var button = document.createElement("button");//添加 div
					button.setAttribute("class", "btn btn-success btn-xs");
					button.setAttribute("data-toggle", "modal");
					button.setAttribute("data-target", "#reviseUser");
					button.setAttribute("data-param", data[i].id);//设置 div 属性，如 id
					button.setAttribute("data-param2", data[i].userName);
					button.setAttribute("style", "margin-right: 2px");
					button.innerHTML ="修改";
					div2_1.appendChild(button);

					var button2 = document.createElement("button");//添加 div
					button2.setAttribute("class", "btn btn-danger btn-xs");
					button2.setAttribute("data-toggle", "modal");
					button2.setAttribute("data-target", "#deleteUser");
					button2.setAttribute("data-param", data[i].userName);//设置 div 属性，如 id
					button2.setAttribute("style", "margin-right: 2px");
					button2.innerHTML ="删除";
					div2_1.appendChild(button2);

					var button3 = document.createElement("button");//添加 div
					button3.setAttribute("class", "btn btn-danger btn-xs");
					button3.setAttribute("data-toggle", "modal");
					button3.setAttribute("data-target", "#Chatlog");
					button3.setAttribute("data-param", data[i].userName);//设置 div 属性，如 id
					button3.innerHTML ="好友";
					div2_1.appendChild(button3);
				}

			},
			error : function() {
				alert("删除失败，请重试。")
			}
		});
	});

})




$(function(){
	$("#Refresh").click(function(){
		window.location.reload();
	});
})

$(function() {
	$(".meun-item").click(function() {
		$(".meun-item").removeClass("meun-item-active");
		$(this).addClass("meun-item-active");
		var itmeObj = $(".meun-item").find("img");
		itmeObj.each(function() {
			var items = $(this).attr("src");
			items = items.replace("_grey.png", ".png");
			items = items.replace(".png", "_grey.png")
			$(this).attr("src", items);
		});
		var attrObj = $(this).find("img").attr("src");
		;
		attrObj = attrObj.replace("_grey.png", ".png");
		$(this).find("img").attr("src", attrObj);
	});
	$("#topAD").click(function() {
		$("#topA").toggleClass(" glyphicon-triangle-right");
		$("#topA").toggleClass(" glyphicon-triangle-bottom");
	});
	$("#topBD").click(function() {
		$("#topB").toggleClass(" glyphicon-triangle-right");
		$("#topB").toggleClass(" glyphicon-triangle-bottom");
	});
	$("#topCD").click(function() {
		$("#topC").toggleClass(" glyphicon-triangle-right");
		$("#topC").toggleClass(" glyphicon-triangle-bottom");
	});
	$(".toggle-btn").click(function() {
		$("#leftMeun").toggleClass("show");
		$("#rightContent").toggleClass("pd0px");
	})

});



/*function createXmlHttpObject() {
			if (window.ActiveXObject) {
				xmlHttp = new Microsoft.ActiveXObject("Microsoft.XMLHTTP");
			} else {
				xmlHttp = new XMLHttpRequest();
			}

			return xmlHttp;
		}

		function refreshUserTable() {
			xmlHttpRefreshUsers = createXmlHttpObject();
			xmlHttpRefreshUsers.onreadystatechange = onDelUserResponse;
			xmlHttpRefreshUsers
					.open("GET", "userOp?act=getAllUserInJson", true);
			xmlHttpRefreshUsers.send(null);
		}

		function refreshRepsonse() {
			if (xmlhttp && xmlhttp.status == 200 && xmlhttp.readyState == 4) {
				var json = JSON.parse(xmlhttp.responseText);
			}
		}*/

$(function() {
	$('#button_btn').click(function() {
		var name =$('#query').val();
		$.ajax({
			url : "Management",// 跳转
			type : "Post",
			data : {
				act:"query",
				name:name
			},

			cache : false,
			dataType : 'json',
			success : function(data) {
				var userDiv = document.getElementById("aaa");
				userDiv.innerHTML = "";
				for(var i = 0; i <data.length; i++){
					var div3_1 = document.createElement("div");//添加 div
					div3_1.setAttribute("class", "col-xs-1");//设置 div 属性，如 id
					div3_1.innerHTML =data[i].id ;
					userDiv.appendChild(div3_1);

					var div3_2 = document.createElement("div");//添加 div
					div3_2.setAttribute("class", "col-xs-2");//设置 div 属性，如 id
					div3_2.innerHTML =data[i].userName ;
					userDiv.appendChild(div3_2);

					var div3_3 = document.createElement("div");//添加 div
					div3_3.setAttribute("class", "col-xs-2");//设置 div 属性，如 id
					div3_3.innerHTML =data[i].nickName ;
					userDiv.appendChild(div3_3);

					var div3_5 = document.createElement("div");//添加 div
					div3_5.setAttribute("class", "col-xs-1");//设置 div 属性，如 id
					div3_5.innerHTML =data[i].gender;
					userDiv.appendChild(div3_5);

					var div3_6 = document.createElement("div");//添加 div
					div3_6.setAttribute("class", "col-xs-2");//设置 div 属性，如 id
					div3_6.innerHTML =data[i].telephoneNumber;
					userDiv.appendChild(div3_6);

					var div3_8 = document.createElement("div");//添加 div
					div3_8.setAttribute("class", "col-xs-2");//设置 div 属性，如 id
					div3_8.innerHTML =data[i].birthday;
					userDiv.appendChild(div3_8);

					var div2_1 = document.createElement("div");//添加 div
					div2_1.setAttribute("class", "col-xs-2");//设置 div 属性，如 id
					div2_1.innerHTML ="&nbsp;"
						userDiv.appendChild(div2_1);

					var button = document.createElement("button");//添加 div
					button.setAttribute("class", "btn btn-success btn-xs");
					button.setAttribute("data-toggle", "modal");
					button.setAttribute("data-target", "#reviseUser");
					button.setAttribute("data-param", data[i].id);//设置 div 属性，如 id
					button.setAttribute("data-param2", data[i].userName);
					button.setAttribute("style", "margin-right: 2px");
					button.innerHTML ="修改";
					div2_1.appendChild(button);

					var button2 = document.createElement("button");//添加 div
					button2.setAttribute("class", "btn btn-danger btn-xs");
					button2.setAttribute("data-toggle", "modal");
					button2.setAttribute("data-target", "#deleteUser");
					button2.setAttribute("data-param", data[i].userName);//设置 div 属性，如 id
					button2.setAttribute("style", "margin-right: 2px");
					button2.innerHTML ="删除";
					div2_1.appendChild(button2);

					var button3 = document.createElement("button");//添加 div
					button3.setAttribute("class", "btn btn-danger btn-xs");
					button3.setAttribute("data-toggle", "modal");
					button3.setAttribute("data-target", "#Chatlog");
					button3.setAttribute("data-param", data[i].userName);//设置 div 属性，如 id
					button3.innerHTML ="好友";
					div2_1.appendChild(button3);
				}
			},
			error : function() {
				alert("查询失败，请重试。")
			},
		});
	});

})


//$(document).ready(function() {
//var form = $('#formone');
//form.bootstrapValidator({
//message : '输入值不合法',
//feedbackIcons : {
//valid : 'glyphicon glyphicon-ok',
//invalid : 'glyphicon glyphicon-remove',
//validating : 'glyphicon glyphicon-refresh'
//},
//fields : {
//sLink : {
//message : '昵称不合法',
//validators : {
//notEmpty : {
//message : '昵称不能为空'
//},
//stringLength : {
//min : 2,
//max : 30,
//message : '请输入2到30个字符'
//},
//regexp : {
//regexp : /^[a-zA-Z0-9_\. \u4e00-\u9fa5 ]+$/,
//message : '用户名只能由字母、数字、点、下划线和汉字组成 '
//}
//}
//},
//sOrd : {
//validators : {
//notEmpty : {
//message : 'The gender is required'
//}
//}
//},
//sKnot : {
//validators : {
//notEmpty : {
//message : '手机号不能为空'
//},
//regexp : {
//regexp : "^([0-9]{11})?$",
//message : '手机号码格式错误'
//}
//}
//},
//sKnot : {
//validators : {
//date : {
//format : 'YYYY/MM/DD',
//message : 'The birthday is not valid'
//}
//}
//}
//}
//});
//});
//$("#updataook")
//.click(
//function() {
////进行表单验证
//var bv = form.data('bootstrapValidator');
//bv.validate();
//if (bv.isValid()) {
//console.log(form.serialize());
////发送ajax请求
//$
//.ajax({
//url : 'Management?act=update',
//async : false,//同步，会阻塞操作
//type : 'GET',//PUT DELETE POST
//data : form.serialize(),
//complete : function(msg) {
//console.log('完成了');
//},
//success : function(result) {
//console.log(result);
//if (result) {
//window.location.reload();
//} else {
//$("#returnMessage")
//.hide()
//.html(
//'<label class="label label-danger">修改失败!</label>')
//.show(300);
//}
//},
//error : function() {
//$("#returnMessage")
//.hide()
//.html(
//'<label class="label label-danger">修改失败!</label>')
//.show(300);
//}
//})
//}
//});
$(function(){
	$('#Chatlog').on('show.bs.modal', function() {
		 var ownNumber = $(event.target).data('param');
		 $.ajax({
			url:"Management",
			type:"post",
			data:{
				act:"friend",
				ownNumber:ownNumber
			},
		cache:false,
		dataType : 'json',
		success : function(data){
			var userDiv = document.getElementById("friendlist");
			var Char = document.getElementById("charbody");
			userDiv.innerHTML = "";
			Char.innerHTML = "";
			var p = document.createElement("p");//添加 div
			p.innerHTML ="好友列表" ;
			userDiv.appendChild(p);
			for(var i=0; i<data.length;i++){
				var div = document.createElement("div");//添加 div
				div.setAttribute("class", "asd");
				div.setAttribute("id",data[i].userName);
				div.setAttribute("onmousedown","changeBackcolor('"+data[i].userName+"','1')");
				div.setAttribute("onMouseOut","changeBackcolor('"+data[i].userName+"','2')");
				div.setAttribute("onmouseover","changeBackcolor('"+data[i].userName+"','3')");
				div.setAttribute("onclick","switchchat('"+data[i].userName+"','"+ownNumber+"')");
				
				userDiv.appendChild(div);
				
					var img = document.createElement("img");//添加 div
					img.setAttribute("src", "images/icon_change_grey.png");
					img.setAttribute("data-toggle", "modal");
					img.setAttribute("data-target", "#xinxi");
					img.setAttribute("id", "Personalinformationdisplay");
					img.setAttribute("data-param", data[i].userName);
					div.appendChild(img);	
					
					var p = document.createElement("span");//添加 div
					p.innerHTML =data[i].nickName;
					div.appendChild(p);
					
					var input = document.createElement("input");//添加 div
					input.setAttribute("type", "hidden");
					input.setAttribute("id", "username");
					input.setAttribute("value", data[i].userName);
					userDiv.appendChild(input);
			}
		},
		error : function() {
			alert("好友获取失败，请重试。")
		},

		})
	});
	
})


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

function switchchat(friendnum,mynum){
	 $.ajax({
			url:"Management",
			type:"post",
			data:{
				act:"getChatlog",
				ownNumber:mynum,
				friendnum:friendnum
			},
		cache:false,
		dataType : 'json',
		success : function(data){
			var userDiv = document.getElementById("charbody");
			userDiv.innerHTML = "";
			if(data.length==0){
				var p = document.createElement("pre");//添加 div
				p.innerHTML ="无聊天记录！"
				userDiv.appendChild(p);
			}else{
				for(var i=0; i<data.length;i++){ 
					var p = document.createElement("pre");//添加 div
					p.innerHTML =data[i].sender+"   "+data[i].sendTime;
					userDiv.appendChild(p);
					
					var p2 = document.createElement("pre");//添加 div
					p2.innerHTML ="   "+data[i].content;
					userDiv.appendChild(p2);
				}
			}
			
		},
		error : function() {
			alert("好友获取失败，请重试。")
		},

		});
}

$(function(){
	$('#xinxi').on('show.bs.modal', function() {
		 var ownNumber = $(event.target).data('param');
		 $.ajax({
			url:"Management",
			type:"post",
			data:{
				act:"information",
				ownNumber:ownNumber
			},
		cache:false,
		dataType : 'json',
		success : function(data){
			var userDiv = document.getElementById("information");
			userDiv.innerHTML = "";
			
			var div = document.createElement("div");//添加 div
			userDiv.appendChild(div);
				
				var p1 = document.createElement("pre");
				p1.innerHTML="账号：     "+data.userName
				div.appendChild(p1);
				
				var p2 = document.createElement("pre");
				p2.innerHTML="昵称 ：    "+data.nickName
				div.appendChild(p2);
				
				var p3 = document.createElement("pre");
				p3.innerHTML="电话号码 ：   "+data.telephoneNumber
				div.appendChild(p3);
				
				var p4 = document.createElement("pre");
				p4.innerHTML="生日 ：   "+data.birthday
				div.appendChild(p4);
				
				var p5 = document.createElement("pre");
				p5.innerHTML=" 姓名：       "+data.gender
				div.appendChild(p5);
				
				
				
			
		},
		error : function() {
			alert("好友获取失败，请重试。")
		},

		})
	});
	
})