/** area.js By Beginner Emain:zheng_jinfan@126.com HomePage:http://www.zhengjinfan.cn */
var $j;
layui.define(['jquery'], function(exports) {
	"use strict";
	var $ = layui.jquery;
	$j = $;
	//设置ajax可跨域
	$.support.cors = true;
	var Area = function() {
		this.config = {
			url: undefined, //远程数据的url
			type: 'json', //数据类型 json or jsonp
			provinceFilter: 'province', //省的过滤器名称
			cityFilter: 'city', //市的过滤器名称
			districtFilter: 'district', // 区域的过滤器名称
			provinceName: 'province', //省名称
			cityName: 'city', //市名称
			districtName: 'district', //区域名称	
		};
		this.v = '1.0';
	};
	Area.prototype.set = function(options) {
		var that = this;
		$.extend(true, that.config, options);
		return that;
	};
	Area.prototype.init = function(options) {
		var that = this;
		
		
		
		return that;		
	};

	var area = new Area();

	exports('area', function(options) {
		return area.set(options);
	});
});



function getAreaSelect(upperCode,obj){
	if(obj.options.length >1){
		obj.options.length =1;
	}
	var jsonStr = "";
	if(upperCode == null || upperCode == ""){
		alert("请选择上级地区");
		return;
	}else{
		jsonStr="remark="+upperCode;
	}
	var actionUrl = "/code/getArea";
	$j.ajax({
		type : "post",
		url : actionUrl,
		//contentType: "application/json;chartset=utf-8",
		data : {"remark":upperCode},
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