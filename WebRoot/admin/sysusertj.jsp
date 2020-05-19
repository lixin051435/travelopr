<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%> 
<%@page import="java.io.InputStream"%> 
<%@page import="java.io.IOException"%> 
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
   <%
HashMap user = Info.getUser(request);
String uname = user.get("uname").toString();
String utype = user.get("utype").toString();
String userid = user.get("id").toString();
 %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<meta name="description" content="Magz is a HTML5 & CSS3 magazine template is based on Bootstrap 3.">
		
		
		<title>Magzz - Responsive HTML5 and CSS3</title>
		
	</head>

	<% 
HashMap ext = new HashMap(); 
String tglparentid=request.getParameter("tglparentid")==null?"":request.getParameter("tglparentid"); 
ext.put("tglparentid",tglparentid); 
ext.put("utype","管理员"); 
ext.put("status","正常"); 
new CommDAO().insert(request,response,"sysuser",ext,true,false); 
%>
<body class="skin-orange">
 
		<jsp:include page="../top.jsp"></jsp:include>

<section>
<div class="">
 
<!-- servletformstart 
<form  action="/travelopr/travelopr?ac=sysusertj&tglparentid=<%=tglparentid%>"   autocomplete="off"  style="display: inline;font-size: 15px" name="f1" method="post"  onsubmit="return checkform()" >
  servletformend -->
  <!-- s2formstart -->
<form name="f1" method="post" onsubmit="return checkform()" action="/travelopr/travelopr/sysusertj.do?tglparentid=<%=tglparentid%>" > 
  <!-- s2formend -->
<center>

<div align="left" style="height: 40px;vertical-align: middle;padding-top: 8px;font-weight: 700;font-size: 15px">
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    当前位置 : 信息添加
</div>

<table  align="center" width=97%  class="table5">
 

<tr ng-repeat="x in names">
<td width="21%" height="32" align="center">用户名</td>
<td width="79%" align="left"  style="padding-left: 5px"><input type=text  onblur='checkform()' class='' id='uname' name='uname' size=35 /><label style='display:inline' id='clabeluname' /></td>
</tr>
<tr ng-repeat="x in names">
<td width="21%" height="32" align="center">密码</td>
<td width="79%" align="left"  style="padding-left: 5px"><input type=text  onblur='checkform()' class='' id='upass' name='upass' size=35 /><label style='display:inline' id='clabelupass' /></td>
</tr>
<tr ng-repeat="x in names">
<td width="21%" height="32" align="center">姓名</td>
<td width="79%" align="left"  style="padding-left: 5px"><input type=text  onblur='checkform()' class='' id='tname' name='tname' size=35 /><label style='display:inline' id='clabeltname' /></td>
</tr>
<tr ng-repeat="x in names">
<td width="21%" height="32" align="center">身份证</td>
<td width="79%" align="left"  style="padding-left: 5px"><input type=text  onblur='checkform()' class='' id='sfid' name='sfid' size=35 /><label style='display:inline' id='clabelsfid' /></td>
</tr>
<tr ng-repeat="x in names">
<td width="21%" height="32" align="center">性别</td>
<td width="79%" align="left"  style="padding-left: 5px"><span id="sexdanx"><label  style='display:inline' ><input type=radio checked=checked name='sex' id='sex' value='男' />&nbsp;男 </label>&nbsp;
<label  style='display:inline' ><input type=radio  name='sex' id='sex' value='女' />&nbsp;女 </label>&nbsp;
</span></td>
</tr>
<tr ng-repeat="x in names">
<td width="21%" height="32" align="center">生日</td>
<td width="79%" align="left"  style="padding-left: 5px"><input type=text  onblur='checkform()'  size='12' class=''   name='birth'  id='birth' onclick='WdatePicker();'  /><label id='clabelbirth' /></td>
</tr>
<tr ng-repeat="x in names">
<td width="21%" height="32" align="center">电话</td>
<td width="79%" align="left"  style="padding-left: 5px"><input type=text  onblur='checkform()' class='' id='tel' name='tel' size=35 /><label style='display:inline' id='clabeltel' /></td>
</tr>
<tr ng-repeat="x in names">
<td width="21%" height="32" align="center">地址</td>
<td width="79%" align="left"  style="padding-left: 5px"><input type=text  onblur='checkform()' class='' id='addrs' name='addrs' size=35 /><label style='display:inline' id='clabeladdrs' /></td>
</tr>
<tr ng-repeat="x in names">
<td width="21%" height="32" align="center">邮箱</td>
<td width="79%" align="left"  style="padding-left: 5px"><input type=text  onblur='checkform()' class='' id='email' name='email' size=35 /><label style='display:inline' id='clabelemail' /></td>
</tr>
<tr ng-repeat="x in names">
<td width="21%" height="32" align="center">相片</td>
<td width="79%" align="left"  style="padding-left: 5px"><%=Info.getImgUpInfo(65)%></td>
</tr>


<tr ng-repeat="x in names">
<td height="35" align="center" colspan="2">

<label>
<input  type="button"  onclick="if(checkform()){f1.submit();}"   name="button" id="button" value="提交信息" />
</label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                      
<input type=button value='返回上页' onclick='window.location.replace("sysusercx.jsp")' />                               
</td> 
</tr>

 
</table>
</center>
</form>
 
 </div>
	</section>
	

    <jsp:include page="../foot.jsp"></jsp:include>
	</body>
</html>

 
<script type="text/javascript">
<%
if(session.getAttribute("suc")!=null)
{
session.removeAttribute("suc");
%>
alert("操作成功"); 
<%}
%>
</script>
            <script language=javascript src='/travelopr/js/My97DatePicker/WdatePicker.js'></script>
<script language=javascript src='/travelopr/js/popup.js'></script>
<script language=javascript src='/travelopr/js/ajax.js'></script>
<%@page import="util.Info"%>
<%@page import="util.Info"%> 
<%@page import="java.util.ArrayList"%> 
<%@page import="java.util.HashMap"%> 
<%@page import="util.PageManager"%> 
<%@page import="dao.CommDAO"%> 
<script language=javascript >  
 
 function checkform(){  
var unameobj = document.getElementById("uname");  
if(unameobj.value==""){  
document.getElementById("clabeluname").innerHTML="&nbsp;&nbsp;<font color=red>请输入用户名</font>";  
return false;  
}else{
document.getElementById("clabeluname").innerHTML="  ";  
}  
  
var unameobj = document.getElementById("uname");  
if(unameobj.value!=""){  
var ajax = new AJAX();
ajax.post(encodeURI("/travelopr/factory/checkno.jsp?table=sysuser&col=uname&value="+unameobj.value+"&checktype=insert&ttime=<%=Info.getDateStr()%>")) 
//ajax.post("/travelopr/factory/checkno.jsp?table=sysuser&col=uname&value="+unameobj.value+"&checktype=insert&ttime=<%=Info.getDateStr()%>") 
var msg = ajax.getValue();
if(msg.indexOf('Y')>-1){
document.getElementById("clabeluname").innerHTML="&nbsp;&nbsp;<font color=red>用户名已存在</font>";  
return false;
}else{document.getElementById("clabeluname").innerHTML="  ";  
}  
}  
var upassobj = document.getElementById("upass");  
if(upassobj.value==""){  
document.getElementById("clabelupass").innerHTML="&nbsp;&nbsp;<font color=red>请输入密码</font>";  
return false;  
}else{
document.getElementById("clabelupass").innerHTML="  ";  
}  
  
var tnameobj = document.getElementById("tname");  
if(tnameobj.value==""){  
document.getElementById("clabeltname").innerHTML="&nbsp;&nbsp;<font color=red>请输入姓名</font>";  
return false;  
}else{
document.getElementById("clabeltname").innerHTML="  ";  
}  
  
var telobj = document.getElementById("tel");  
if(telobj.value==""){  
document.getElementById("clabeltel").innerHTML="&nbsp;&nbsp;<font color=red>请输入电话</font>";  
return false;  
}else{
document.getElementById("clabeltel").innerHTML="  ";  
}  
  
var telobj = document.getElementById("tel");  
if(telobj.value!=""){  
if(telobj.value.length>11||telobj.value.length<8||isNaN(telobj.value)){ 
document.getElementById("clabeltel").innerHTML="&nbsp;&nbsp;<font color=red>电话必须为8-11位数字</font>";  
return false;
}else{  
document.getElementById("clabeltel").innerHTML="";  
}  
}  
return true;   
}   
</script>  
