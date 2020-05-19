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
new CommDAO().insert(request,response,"pros",ext,true,false); 
%>
<body class="skin-orange">
 
		<jsp:include page="../top.jsp"></jsp:include>

<section>
<div class="">
 
<!-- servletformstart 
<form  action="/travelopr/travelopr?ac=prostj&tglparentid=<%=tglparentid%>"   autocomplete="off"  style="display: inline;font-size: 15px" name="f1" method="post"  onsubmit="return checkform()" >
  servletformend -->
  <!-- s2formstart -->
<form name="f1" method="post" onsubmit="return checkform()" action="/travelopr/travelopr/prostj.do?tglparentid=<%=tglparentid%>" > 
  <!-- s2formend -->
<center>

<div align="left" style="height: 40px;vertical-align: middle;padding-top: 8px;font-weight: 700;font-size: 15px">
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    当前位置 : 信息添加
</div>

<table  align="center" width=97%  class="table5">
 

<tr ng-repeat="x in names">
<td width="21%" height="32" align="center">名称</td>
<td width="79%" align="left"  style="padding-left: 5px"><input type=text  onblur='checkform()' class='' id='sname' name='sname' size=35 /><label style='display:inline' id='clabelsname' /></td>
</tr>
<tr ng-repeat="x in names">
<td width="21%" height="32" align="center">城市</td>
<td width="79%" align="left"  style="padding-left: 5px"><input type=text  onblur='checkform()' class='' id='city' name='city' size=35 /><label style='display:inline' id='clabelcity' /></td>
</tr>
<tr ng-repeat="x in names">
<td width="21%" height="32" align="center">地址</td>
<td width="79%" align="left"  style="padding-left: 5px"><input type=text  onblur='checkform()' class='' id='addrs' name='addrs' size=60 /><label style='display:inline' id='clabeladdrs' /></td>
</tr>
<tr ng-repeat="x in names">
<td width="21%" height="32" align="center">基础费用</td>
<td width="79%" align="left"  style="padding-left: 5px"><input type=text   size='8' class=''  id='tprice'  name='tprice'  onkeyup='clearNoNum(this);' onblur='clearNoNum(this);checkform();' onmouseup='clearNoNum(this);'    /><label id='clabeltprice' /></td>
</tr>
<tr ng-repeat="x in names">
<td width="21%" height="32" align="center">火车费用</td>
<td width="79%" align="left"  style="padding-left: 5px"><input type=text   size='8' class=''  id='hprice'  name='hprice'  onkeyup='clearNoNum(this);' onblur='clearNoNum(this);checkform();' onmouseup='clearNoNum(this);'    /><label id='clabelhprice' /></td>
</tr>
<tr ng-repeat="x in names">
<td width="21%" height="32" align="center">飞机费用</td>
<td width="79%" align="left"  style="padding-left: 5px"><input type=text   size='8' class=''  id='fprice'  name='fprice'  onkeyup='clearNoNum(this);' onblur='clearNoNum(this);checkform();' onmouseup='clearNoNum(this);'    /><label id='clabelfprice' /></td>
</tr>
<tr ng-repeat="x in names">
<td width="21%" height="32" align="center">经济酒店费用</td>
<td width="79%" align="left"  style="padding-left: 5px"><input type=text   size='8' class=''  id='jprice'  name='jprice'  onkeyup='clearNoNum(this);' onblur='clearNoNum(this);checkform();' onmouseup='clearNoNum(this);'    /><label id='clabeljprice' /></td>
</tr>
<tr ng-repeat="x in names">
<td width="21%" height="32" align="center">星级酒店费用</td>
<td width="79%" align="left"  style="padding-left: 5px"><input type=text   size='8' class=''  id='wprice'  name='wprice'  onkeyup='clearNoNum(this);' onblur='clearNoNum(this);checkform();' onmouseup='clearNoNum(this);'    /><label id='clabelwprice' /></td>
</tr>
<tr ng-repeat="x in names">
<td width="21%" height="32" align="center">简介</td>
<td width="79%" align="left"  style="padding-left: 5px"><textarea  cols='45' rows='3'  style='margin-top: 1px;margin-bottom: 1px'  class=''  name='remo'  ></textarea></td>
</tr>
<tr ng-repeat="x in names">
<td width="21%" height="32" align="center">导游</td>
<td width="79%" align="left"  style="padding-left: 5px"><span id="guidedanx"><%=Info.getradio("guide","guides","gno~hnoname"," 1=1 ")%></span></td>
</tr>
<tr ng-repeat="x in names">
<td width="21%" height="32" align="center">图片</td>
<td width="79%" align="left"  style="padding-left: 5px"><%=Info.getImgUpInfo(65)%></td>
</tr>


<tr ng-repeat="x in names">
<td height="35" align="center" colspan="2">

<label>
<input  type="button"  onclick="if(checkform()){f1.submit();}"   name="button" id="button" value="提交信息" />
</label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                      
<input type=button value='返回上页' onclick='window.location.replace("proscx.jsp")' />                               
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
var snameobj = document.getElementById("sname");  
if(snameobj.value==""){  
document.getElementById("clabelsname").innerHTML="&nbsp;&nbsp;<font color=red>请输入名称</font>";  
return false;  
}else{
document.getElementById("clabelsname").innerHTML="  ";  
}  
  
var cityobj = document.getElementById("city");  
if(cityobj.value==""){  
document.getElementById("clabelcity").innerHTML="&nbsp;&nbsp;<font color=red>请输入城市</font>";  
return false;  
}else{
document.getElementById("clabelcity").innerHTML="  ";  
}  
  
var addrsobj = document.getElementById("addrs");  
if(addrsobj.value==""){  
document.getElementById("clabeladdrs").innerHTML="&nbsp;&nbsp;<font color=red>请输入地址</font>";  
return false;  
}else{
document.getElementById("clabeladdrs").innerHTML="  ";  
}  
  
var tpriceobj = document.getElementById("tprice");  
if(tpriceobj.value==""){  
document.getElementById("clabeltprice").innerHTML="&nbsp;&nbsp;<font color=red>请输入基础费用</font>";  
return false;  
}else{
document.getElementById("clabeltprice").innerHTML="  ";  
}  
  
var hpriceobj = document.getElementById("hprice");  
if(hpriceobj.value==""){  
document.getElementById("clabelhprice").innerHTML="&nbsp;&nbsp;<font color=red>请输入火车费用</font>";  
return false;  
}else{
document.getElementById("clabelhprice").innerHTML="  ";  
}  
  
var fpriceobj = document.getElementById("fprice");  
if(fpriceobj.value==""){  
document.getElementById("clabelfprice").innerHTML="&nbsp;&nbsp;<font color=red>请输入飞机费用</font>";  
return false;  
}else{
document.getElementById("clabelfprice").innerHTML="  ";  
}  
  
var jpriceobj = document.getElementById("jprice");  
if(jpriceobj.value==""){  
document.getElementById("clabeljprice").innerHTML="&nbsp;&nbsp;<font color=red>请输入经济酒店费用</font>";  
return false;  
}else{
document.getElementById("clabeljprice").innerHTML="  ";  
}  
  
var wpriceobj = document.getElementById("wprice");  
if(wpriceobj.value==""){  
document.getElementById("clabelwprice").innerHTML="&nbsp;&nbsp;<font color=red>请输入星级酒店费用</font>";  
return false;  
}else{
document.getElementById("clabelwprice").innerHTML="  ";  
}  
  
return true;   
}   
</script>  
