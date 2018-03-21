var $j = jQuery.noConflict();
function getAreaSelect(province,upperCode,obj){
	if(obj.options.length >1){
		obj.options.length =1;
	}
	var jsonStr = "";
	if(province != null && province != ""){
		jsonStr = "{'remark':'province'}";
	}else{
		if(upperCode == null || upperCode == ""){
			alert("请选择上级地区");
			return;
		}else{
			jsonStr="remark="+upperCode;
		}
	}
	var actionUrl = "/code/getArea";
	$j.ajax({
		type : "get",
		url : actionUrl,
		contentType: "application/json;chartset=utf-8",
		data : jsonStr,
		dataType : "json",
		success : function(data) {
			var op;
			for ( var i = 0; i < data.length; i++) {
				op = document.createElement("option");
				op.value = data[i].codecode;
				op.text = data[i].codecname;
				obj.appendChild(op);
			}
			layui.form().render();
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
			/* alert(XMLHttpRequest.status);
			alert(XMLHttpRequest.responseText);
			alert(textStatus + ":" + errorThrown);*/ 
			alert("查询有误...");
		}
	});
}