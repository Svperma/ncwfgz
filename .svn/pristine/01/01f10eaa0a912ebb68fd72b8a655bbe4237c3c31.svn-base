/**********		身份证校验开始		**************************/
var vcity={ 11:"北京",12:"天津",13:"河北",14:"山西",15:"内蒙古",  
            21:"辽宁",22:"吉林",23:"黑龙江",31:"上海",32:"江苏",  
            33:"浙江",34:"安徽",35:"福建",36:"江西",37:"山东",41:"河南",  
            42:"湖北",43:"湖南",44:"广东",45:"广西",46:"海南",50:"重庆",  
            51:"四川",52:"贵州",53:"云南",54:"西藏",61:"陕西",62:"甘肃",  
            63:"青海",64:"宁夏",65:"新疆",71:"台湾",81:"香港",82:"澳门",91:"国外"  
           };  
/**
 * 入参，身份证号
 * @author HSLT
 */
checkCardByIdno = function(o,idName)
{  
    var card = o;
    //是否为空  
    if(card === '')  
    {  
        alert('身份证号不能为空');
        document.getElementById(idName).focus;
        return false;  
    }  
    //校验长度，类型  
    if(isCardNo(card) === false)  
    {  
        alert('身份证号码不正确，请重新输入');  
        document.getElementById(idName).focus;
        return false;  
    }  
    //检查省份  
    if(checkProvince(card) === false)  
    {  
        alert('身份证号码不正确,请重新输入');  
        document.getElementById(idName).focus;
        return false;  
    }  
    //校验生日  
    if(checkBirthday(card) === false)  
    {  
        alert('身份证号码生日不正确,请重新输入');  
        document.getElementById(idName).focus();
        return false;  
    }  
    //检验位的检测  
    if(checkParity(card) === false)  
    {  
        alert('身份证校验位不正确,请重新输入');  
        document.getElementById(idName).focus();
        return false;  
    }  
    return true;  
};  
  
  
//检查号码是否符合规范，包括长度，类型  
isCardNo = function(card)  
{  
    //身份证号码为15位或者18位，15位时全为数字，18位前17位为数字，最后一位是校验位，可能为数字或字符X  
    var reg = /(^\d{15}$)|(^\d{17}(\d|X|x)$)/;
    if(reg.test(card) === false)  
    {  
        return false;  
    }  
  
    return true;  
};  
  
//取身份证前两位,校验省份  
checkProvince = function(card)  
{  
    var province = card.substr(0,2);  
    if(vcity[province] == undefined)  
    {  
        return false;  
    }  
    return true;  
};  
  
//检查生日是否正确  
checkBirthday = function(card)  
{  
    var len = card.length;  
    //身份证15位时，次序为省（3位）市（3位）年（2位）月（2位）日（2位）校验位（3位），皆为数字  
    if(len == '15')  
    {  
        var re_fifteen = /^(\d{6})(\d{2})(\d{2})(\d{2})(\d{3})$/;   
        var arr_data = card.match(re_fifteen);  
        var year = arr_data[2];  
        var month = arr_data[3];  
        var day = arr_data[4];  
        var birthday = new Date('19'+year+'/'+month+'/'+day);  
        return verifyBirthday('19'+year,month,day,birthday);  
    }  
    //身份证18位时，次序为省（3位）市（3位）年（4位）月（2位）日（2位）校验位（4位），校验位末尾可能为X  
    if(len == '18')  
    {  
        // var re_eighteen = /^(\d{6})(\d{4})(\d{2})(\d{2})(\d{3})([0-9]|X|x)$/;
        var year = card.substr(6,4);
        var month = card.substr(10,2);
        var day = card.substr(12,2);
        var birthday = new Date(year+'/'+month+'/'+day);
        console.log(year + ":" + month + ":" + day + "----> " + birthday)
        return verifyBirthday(year,month,day,birthday);  
    }  
    return false;  
};  
  
//校验日期  
verifyBirthday = function(year,month,day,birthday)  
{  
    var now = new Date();  
    var now_year = now.getFullYear();  
    //年月日是否合理  
    if(birthday.getFullYear() == year && (birthday.getMonth() + 1) == month && birthday.getDate() == day)  
    {  
        //判断年份的范围（3岁到100岁之间)  
        var time = now_year - year;  
        if(time >= 3 && time <= 100)  
        {  
            return true;  
        }  
        return false;  
    }  
    return false;  
};  
  
//校验位的检测  
checkParity = function(card)  
{  
    //15位转18位  
    card = changeFivteenToEighteen(card);  
    var len = card.length;  
    if(len == '18')  
    {  
        var arrInt = new Array(7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2);   
        var arrCh = new Array('1', '0', 'X', '9', '8', '7', '6', '5', '4', '3', '2');
        var cardTemp = 0, i, valnum;   
        for(i = 0; i < 17; i ++)   
        {   
            cardTemp += card.substr(i, 1) * arrInt[i];   
        }   
        valnum = arrCh[cardTemp % 11];   
        if (valnum == card.substr(17, 1).toUpperCase())
        {  
            return true;  
        }  
        return false;  
    }  
    return false;  
};  
  
//15位转18位身份证号  
changeFivteenToEighteen = function(card)  
{  
    if(card.length == '15')  
    {  
        var arrInt = new Array(7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2);   
        var arrCh = new Array('1', '0', 'X', '9', '8', '7', '6', '5', '4', '3', '2');   
        var cardTemp = 0, i;     
        card = card.substr(0, 6) + '19' + card.substr(6, card.length - 6);  
        for(i = 0; i < 17; i ++)   
        {   
            cardTemp += card.substr(i, 1) * arrInt[i];   
        }   
        card += arrCh[cardTemp % 11];   
        return card;  
    }  
    return card;  
}; 

/**************		身份证校验结束		**********************/


/**************		上传文件格式校验开始		**********************/
/***
 * 说明：
 * 文件格式校验，需要两个参数
 * 1，参数名称，2，传入需要验证的参数格式（“image”、“exl”、“word”、“pdf”、“ppt”等）
 * 根据传入的参数，取出参数的后缀，和需要验证的参数格式相比对
 * @returns 返回true或false
 * @author HSLT
 */
//校验图片、excel表格、Word文件、PDF格式
function checkFileAll(filename,geshi){
	//（字符）检查文件上传表单控件，如果不在下列数组中的格式中，则返回false
		var flag = false; //状态
		//1、图片格式           
		var image = ["jpg","png","gif","jpeg","bmp","tiff","pcx","tga","exif","fpx","svg","psd","cdr","pcd","dxf","ufo","eps","ai","raw","WMF"];
		//2、Excel表格格式
		var exl = ["xls","xlsx","xlsm","xltx","xltm","xlsb","xlam"];
		//3、Word文件格式
		var word = ["doc","docx","dot","dotx","docm","dotm","xml"];
		//4、PDF文件格式
		var pdf = ["pdf"];
		//5、PPT文件格式
		var ppt = ["pptx","pptm","ppsx","ppsx","potx","potm","ppam"];
		if (geshi == "image") { geshi = image; }
		if (geshi == "exl") { geshi = exl; }
		if (geshi == "word") { geshi = word; }
		if (geshi == "pdf") { geshi = pdf; }
		if (geshi == "ppt") { geshi = ppt; }
		//取出上传文件的扩展名
		var index = filename.lastIndexOf(".");
		var ext = filename.substr(index+1);
		//循环比较
		for(var i=0;i<geshi.length;i++) {
			if(ext == geshi[i]) {
				flag = true; //一旦找到合适的，立即退出循环
				break;
			}
		}
		return flag;
		//条件判断
		/* if(!flag) {
//	 		document.write("文件名不合法");
			alert("文件格式不合法");
			return;
		} */
	}
/**************		上传文件格式校验结束		**********************/

/**************		格式类型校验开始		**********************/
/**
 * 传入的数据和校验规则对比，
 * 把对比结果返回（返回的只是true或false）
 * 引用时，需自行在前台根据返回结果，alert相应的提示信息
 * @author HSLT
 */
 
//1、校验英文字母格式
function checkEnglish(parameter){
	var reg = /^[A-Za-z]+$/; //验证规则：26个英文字母（大、小写）
	var flag = reg.test(parameter);
	return flag;
}
//2、校验数字格式
function checkNumber(parameter){
	var reg = /^[0-9]*$/; //验证规则
	var flag = reg.test(parameter);
	return flag;
}
//3、校验只能输入中文格式
function checkChina(parameter){
	var reg = /^[\u4e00-\u9fa5]{0,}$/; //验证规则
	var flag = reg.test(parameter);
	return flag;
}
//4、校验Email地址
function checkEmail(parameter){
	var reg = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/; //验证规则
	var flag = reg.test(parameter);
	return flag;
}
//5、校验电话号码
function checkMobile(parameter){
	var reg = /^(\(\d{3,4}-)|\d{3.4}-)?\d{7,8}$/; //验证规则
	var flag = reg.test(parameter);
	return flag;
}
//6、校验腾讯QQ
function checkQQ(parameter){
	var reg = /[1-9][0-9]{4,}/; //验证规则
	var flag = reg.test(parameter);
	return flag;
}
//7、校验中国邮政编码
function checkPostal(parameter){
	var reg = /[1-9]\d{5}(?!\d)/; //验证规则
	var flag = reg.test(parameter);
	return flag;
}
//8、校验internetURL（格式：http://....或：https://...）
function checkInternetURL(parameter){
	var reg = /[a-zA-z]+:\/[^\s]*$/; //验证规则
	var flag = reg.test(parameter);
	return flag;
}
//9、校验手机号码
function checkPhone(parameter){
	var reg = /^1[3|4|5|7|8][0-9]{9}$/; //手机号码验证规则
	var flag = reg.test(parameter);
	return flag;
}
//10、匹配由26个英文字母和数字组成的字符串
function checkEngAndNo(parameter){
	var reg = /^[A-Za-z0-9]+$/; 
	var flag = reg.test(parameter);
	return flag;
}
//11、匹配由26个英文字母、数字和下划线组成的字符串
function checkEngAndNoXianhuaxian(parameter){
	var reg = /^\w+$/; 
	var flag = reg.test(parameter);
	return flag;
}
//12、格式限定校验 : 以字母或数字开头，长度在6~18之间，只能包含字符、数字和下划线
function checkEndAndNoOrXianhuaxian(parameter){
	var reg = /^[a-zA-Z0-9]\w{5,17}$/;
	var flag = reg.test(parameter);
	return flag;
}
//13、匹配只能输入汉字和英文字母
function checkEndOrChina(parameter){
	var reg = /^[\u4e00-\u9fa5a-zA-Z]+$/;
	var flag = reg.test(parameter);
	return flag;
}
/**************		格式类型校验结束		**********************/
/****
例子：

var userName = $("#userName").val().replace(" ", "");
if (!checkEndOrChina.test(userName)) {
	alert("用户名只能由26个英文字母和中文组成");
	$("#userName").focus();
	return;
}

*/

