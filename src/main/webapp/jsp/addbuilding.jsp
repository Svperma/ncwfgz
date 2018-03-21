<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/tlds/ggCodeTld" prefix="code" %>
<html>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${basePath}/plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="${basePath}/plugins/font-awesome/css/font-awesome.min.css">
    <script type="text/javascript" src="${basePath}/js/setReadOnly.js"></script>

</head>
<body>
<div>
    <div>
        <div>
            <form class="layui-form layui-form-pane" action="" method="post" id="fm" name="fm" enctype="multipart/form-data">
                <input type="hidden" id="id" name="id">
                <input type="hidden" id="village" name="village">
                <input type="hidden" id="address" name="address">
                <input type="hidden" id="finishstatus" name="finishstatus">
                <input type="hidden" id="inputcode" name="inputcode">
                <input type="hidden" id="inputtime" name="inputtime">
                <table class="layui-table">
                    <tr>
                        <th>户主姓名 * </th>
                        <td>
                            <input type="text" name="householder" id="householder" lay-verify="required" placeholder="请输入户主姓名" autocomplete="off" class="layui-input" maxlength="10">
                        </td>
                        <th>身份证号 * </th>
                        <td><input type="text" name="identityid" id="identityid" lay-verify="required" placeholder="请输入身份证号" autocomplete="off" class="layui-input" maxlength="18"></td>
                    </tr>
                    <tr>
                        <th>人口数 * </th>
                        <td><input type="text" name="peoplenumber" id="peoplenumber" lay-verify="required" placeholder="请输入人口数" autocomplete="off" class="layui-input" maxlength="2"></td>
                        <th>请选择开户行</th>
                        <td>
                            <select name="bank" lay-filter="aihao" id="bank">
                                <option value="000000">其他</option>
                                <code:options codeType="bankType" exclude="其他"/>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th>账号</th>
                        <td><input type="text" name="account" id="account" lay-verify="required" placeholder="请输入账号" autocomplete="off" class="layui-input" maxlength="25"></td>
                        <th>请选择贫困类型 * </th>
                        <td>
                            <select name="type" id="type" lay-filter="aihao">
                                <option value=""></option>
                                <code:options codeType="povertyType"/>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th>请选择危房等级 * </th>
                        <td>
                            <select name="grade" id="grade" lay-filter="grade" onchange="changeAmount(this)">
                                <option value=""></option>
                                <code:options codeType="grade"/>
                            </select>
                        </td>
                        <th>施工进度 * </th>
                        <td>
                            <select name="Progress" lay-verify="" id="progress">
                                <option value=""></option>
                                <code:options codeType="Progress" exclude="已注销"/>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th>请选择纳入改造时间 * </th>
                        <td>
                            <select name="startyear" id="startyear" lay-filter="aihao">
                                <option value=""></option>
                                <code:options codeType="startTime"/>
                            </select>
                        </td>
                        <th>补助金额 * </th>
                        <td><input type="text" name="sunamount" id="sunamount" lay-verify="required" autocomplete="off" class="layui-input" maxlength="10" readonly></td>
                    </tr>
                    <tr>
                        <th>请选择城市 * </th>
                        <td>
                            <select name="city" id="city" <c:if test="${sessionScope.ggUser.comLevel != 3}">lay-filter="city"</c:if>>
                                <c:if test="${sessionScope.ggUser.comLevel <= '2' }">
                                    <c:if test="${sessionScope.ggUser.comLevel == '1' }">
                                        <option value="">请选择城市</option>
                                    </c:if>
                                    <c:forEach items="${sessionScope.cityList }" var="city">
                                        <option value="${city.codecode}">${city.codecname }</option>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${sessionScope.ggUser.comLevel > '2' }">
                                    <c:forEach items="${sessionScope.cityList }" var="city">
                                        <option value="${city.codecode }">${city.codecname }</option>
                                    </c:forEach>
                                </c:if>
                            </select>
                        </td>
                        <th>请选择区县</th>
                        <td>
                            <select name="county" id="county" lay-verify="">
                                <c:if test="${sessionScope.ggUser.comLevel < '3' }">
                                    <option value="">请选择区县</option>
                                </c:if>
                                <c:if test="${sessionScope.ggUser.comLevel >= '3' }">
                                    <c:forEach items="${sessionScope.countyList }" var="county">
                                        <option value="${county.codecode }">${county.codecname }</option>
                                    </c:forEach>
                                </c:if>
                            </select>
                        </td>

                    </tr>
                    <tr>
                        <th>已兑付金额</th>
                        <td><input type="text" name="finishamount" id="finishamount" onkeyup="checkAmount111()" value="0" lay-verify="required" autocomplete="off" class="layui-input" readonly maxlength="5"></td>
                        <th>说明文件</th>
                        <td><input type="file" name="file" id="filePath" lay-verify="required" onchange="checkFileName(this)" autocomplete="off"></td>
                        <script>
                            function checkFileName(ele) {
                                var file = ele.files[0];
                                if(file.name.length > 45){
                                    alert("文件名过长")
                                    ele.value = '';
                                    return false;
                                }
                                if(file.size > 52428800){
                                	alert("上传文件过大,最大支持50M")
                                	ele.value = '';
                                	return false;
                                }
                            }
                        </script>
                        <input type="hidden" name="filePath" id="filePath1" lay-verify="required" autocomplete="off" value="">
                    </tr>
                    <tr>
                        <th>描述</th>
                        <td colspan="3"><textarea cols="1" role="50" name="discription" id="discription" lay-verify="required" autocomplete="off" class="layui-input" maxlength="200"></textarea>
                        </td>
                    </tr>

                </table>
                <div class="site-demo-button" style="margin-bottom: 0;">
                    <a href="javascript:;" onclick="submitFm(this);" class="layui-btn" target="_self">提交</a>
                    <a href="javascript:;" onclick="history.back(-1);" class="layui-btn" >返回</a>
                </div>
            </form>
        </div>
    </div>
</div>
</body>


<script type="text/javascript" src="${basePath}/plugins/layui/layui.js"></script>
<script type="text/javascript" src="${basePath}/js/verification.js"></script>
<script type="text/javascript" src="${basePath}/js/area.js"></script>
<script>
    var $j;
    layui.use(['form', 'layedit', 'laydate','jquery'], function() {
        var form = layui.form(),
            layer = layui.layer,
            layedit = layui.layedit,
            laydate = layui.laydate,
            $j = layui.jquery;

        form.on('select(city)',function(data){
            var obj = document.getElementById("county");
            getAreaSelect(data.value,obj);
        });

        form.on('select(grade)', function(data) {
            console.log(data)
            document.getElementById("sunamount").value = data.value;
        });

    });
</script>

<script>

    function submitFm (but) {
        var flag = true;
        var fm = document.getElementById("fm")
        var householder = document.getElementById("householder");
        if(!checkTest1(householder,"用户名")) return false;
        var identityid = document.getElementById("identityid").value;
        if(!checkCardByIdno(identityid,"identityid")){
            document.getElementById("identityid").style.border = 'red solid 1px'
            return false;
        }else{
            document.getElementById("identityid").style.border = '1px solid #e2e2e2'
        }
        var peoplenumber = document.getElementById("peoplenumber");
        if(!checkNumber1(peoplenumber,"人口数")) return false;
        var account = document.getElementById("account");
//        if(!checkkshao(account,"卡号")  lementById("sunamount");
        if(!checkNumber(sunamount.value,"补助金额")) return false;
        var finishamount = document.getElementById("finishamount").value;
        finishamount = finishamount == null || finishamount == '' ? "0" : finishamount
        if(!checkNumber(finishamount,"已兑付金额")) return false;
        var discription = document.getElementById("discription").value;
        debugger;
        if(!checkTest(discription, "描述")) return false;
        var bank = document.getElementById("bank");
        if(!checkTest(bank,"开户行")) return false;
        var startyear = document.getElementById("startyear");
        if(!checkTest(startyear,"纳入时间")) return false;
        var Progress = document.getElementById("Progress");
        if(!checkTest(householder,"工程状态")) return false;
        var city = document.getElementById("city");
        if(!checkTest(householder,"城市")) return false;
        var county = document.getElementById("county");
        if(!checkTest(householder,"区县")) return false;
        var grade = document.getElementById("grade");

        console.log(checkidentityid(identityid))
        if(!checkidentityid(identityid)) return false;
        if(!checkAmount111()) return false;
        but.disabled = true;

        fm.action = '${basePath}/init/createBuilding'
        fm.submit();
    }

    function checkidentityid(identityid){
        var flag = false;
        $j.ajax({
            url:"${basePath}/init/repetition?identityid="+ identityid,
            type:"get",
            async:false,
            dataType:"json",
            success:function(data){
                if(data != 0){
                    fl = false;
                    alert("身份证号已存在!")
                    flag =  false;
                }else{
                    flag =  true;
                }
            }
        })
        return flag;
    }

    function checkTest1(ele, str){
        var value = ele.value
        if(value == null || value == ''){
            alert(str + "不能为空")
            ele.style.border = 'red 1px solid';
            return false;
        }
        ele.style.border = '1px solid #e2e2e2';
        return true;
    }
    function checkTest(value, str){
        if(value == null || value == ''){
            alert(str + "不能为空")
            return false;
        }
        return true;
    }

    function checkkshao(ele, str) {
        var value = ele.value;
        var reg =  /^[0-9]*[1-9][0-9]*$/
        if(value == null || value == ''){
            alert(str + "不能为空")
            ele.style.border = 'red 1px solid';
            return false;
        }
        if(!reg.test(value)){
            alert(str + "只能是整数")
            ele.style.border = 'red 1px solid';
            return false;
        }
        ele.style.border = '1px solid #e2e2e2';
        return true;
    }

    function checkNumber1(ele, str){
        var value = ele.value
        var reg =  /^[1-9]{1,2}$/
        if(!value){
            alert(str + "不能为空")
            ele.style.border = 'red 1px solid';
            return false;
        }
        if(!reg.test(value)){
            alert(str + "只能是整数")
            ele.style.border = 'red 1px solid';
            return false;
        }
        ele.style.border = '1px solid #e2e2e2';
        return true;
    }

    function checkNumber(value, str){
//        var reg =  /^\d+(\.\d+)?$/
        if(!value){
            alert(str + "不能为空")
            return false;
        }
//        if(!reg.test(value)){
//            alert(str + "只能是数字")
//            return false;
//        }
        return true;
    }

    function changeAmount(value){
        alert(value)
        document.getElementById("sunamount").value = value;
    }

    function checkAmount111() {
        var sumAmount = document.getElementById("sunamount").value
        var finishamount = document.getElementById("finishamount");
        if (sumAmount.length != 0) {
            var sav = finishamount.value - sumAmount
            if(sav > 0){
                alert("输入超出限额，补助金额必须小于" + sumAmount + "元")
                return false;
            }
            return true;
        }else {
            alert("请选择危房等级！")
            finishamount.value = "";
            finishamount.focus()
            return false;
        }
    }
</script>
</html>
