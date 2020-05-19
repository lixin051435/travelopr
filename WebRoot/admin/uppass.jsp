<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%> 
<%@page import="java.io.InputStream"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.io.IOException"%>
<%@page import="java.util.HashMap"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<meta name="description" content="Magz is a HTML5 & CSS3 magazine template is based on Bootstrap 3.">
		
		
		<title>旅游信息系统 - Responsive HTML5 and CSS3</title>
		
	</head>

 
<body class="skin-orange">
 
		<jsp:include page="../top.jsp"></jsp:include>

<section>
<div class="">



<div align="left" style="height: 40px;vertical-align: middle;padding-top: 8px;font-weight: 700;font-size: 15px">
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    当前位置 : 修改密码
</div>

  
    <form  action="/travelopr/travelopr?ac=uppass" name="f1" method="post" style="display: inline;font-size: 15px">
           
                	<table  align="center" width=97% class="table5">
 
             
                     
                             <tr>
                            <td width="32%" height="45" align="center" bgcolor="#FFFFFF">请输入新密码</td>
                            <td width="68%" height="45" align="left" bgcolor="#FFFFFF">&nbsp;
                            <input type="password" name="upass" id="textfield2" size="30" />                            </td>
                          </tr>
                           <tr>
                            <td height="45" align="center" bgcolor="#FFFFFF">请再次输入新密码</td>
                            <td height="45" align="left" bgcolor="#FFFFFF">&nbsp;
                              <label>
                              
                              <input type="password" name="repass" id="textfield3" size="30" />
                              </label></td>
                          </tr>
                           <tr>
                            <td height="45" colspan="2" align="center" bgcolor="#FFFFFF">
                        <label>
                                <input type="submit" onmousedown="checkk()" name="button" id="button" value="提交信息" />
                              </label>
                                           &nbsp;&nbsp;&nbsp;           <input type="reset" name="button2" id="button2" value="重新填写" /></td>
                          </tr>
                          
                          
					</table>
  
 </form>
        
 </div>
	</section>
	

    <jsp:include page="../foot.jsp"></jsp:include>
	</body>
</html>

<script language=javascript src='/travelopr/js/My97DatePicker/WdatePicker.js'></script> 
<script language=javascript src='/travelopr/js/ajax.js'></script> 
<script language=javascript src='/travelopr/js/popup.js'></script> 
<%@page import="util.Info"%> 
<%@page import="util.Info"%> 
<%@page import="java.util.ArrayList"%> 
<%@page import="java.util.HashMap"%> 
<%@page import="util.PageManager"%> 
<%@page import="dao.CommDAO"%> 


<script language="javascript">
<%
String suc = (String)request.getAttribute("suc");
if(suc!=null)
{
%>
alert("操作成功");
<%}%>
</script>
 <script type="text/javascript">
   function checkk()
   {
  
   if(f1.upass.value=="")
   {
   alert("请输入新密码");
   return;
   }
   if(f1.repass.value!=f1.upass.value)
   {
   alert("两次密码输入不一致");
   return;
   }
   }
   </script>