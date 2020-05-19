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
 
		<jsp:include page="top.jsp"></jsp:include>

<section>
<div class="">
 
 <table><tr><td height=40></td></tr></table>
        
        <center>
          <form action="/travelopr/travelopr/login.do?a=a" method="post" style="display: inline">
            <table width="100%"  border="0"  align="center" style="border: 0px" cellpadding="0" cellspacing="0">
                
                 <thead>
                  <tr> 
                    <td  height="60" align="center" colspan="3" style="border: 0px"  valign="middle"> 
                    <font style="font-size: 26px">用户登录</font>                     </td> 
                  </tr>
                  </thead>
                
                  <tr>
                    
                    <td width="406" height="45" style="border: 0px"  align="center">&nbsp;</td>
                    <td width="135" style="border: 0px"  align="center">用户名</td>
                    <td width="690"  style="border: 0px" height="35">&nbsp;
                    <input   name=uname id="upass"   type=text  size="20"  >
                   
                    
                    </td>
                  </tr>
                  <tr>
                    <td height="45" style="border: 0px" align="center">&nbsp;</td>
                    <td align="center" style="border: 0px">密&nbsp;码</td>
                    <td height="45" style="border: 0px">&nbsp;
                    <input type=password  name="upass" id="upass"  size="20"   /></td>
                  </tr>
                  <tr>
                    <td height="45" align="center" style="border: 0px">&nbsp;</td>
                    <td align="center" style="border: 0px">类&nbsp;别</td>
                    <td height="45" style="border: 0px">
                    <label>
                    <input name="utype"    type="radio" value="用户"  checked="checked"  /> 用户 </label>
                    &nbsp; &nbsp;   
                    <label> 
                    <input name="utype"    type="radio" value="管理员"   /> 管理员</label>   
                                     </td>
                  </tr>
                  <tr>
                    <td height="45" align="center" style="border: 0px">&nbsp;</td>
                    <td align="center"  style="border: 0px">验证码</td>
                    <td height="45"  style="border: 0px">
                    &nbsp;
                    <input  name=pagerandom id="pagerandom" type=text value="" maxLength=4 size=10>
                     
                              
                              <img src="/travelopr/admin/ma.jsp" style="vertical-align:-28%;" id="yzm" ></img> &nbsp; <span onClick="ma();" style="cursor: hand"  class="login_txt">换一张</span>
                              <script type="text/javascript">
                              function ma()
                              {
                              var a = document.getElementById("yzm");
                              var myDate=new Date()
                              a.src="/travelopr/admin/ma.jsp?d="+myDate;
                              }
                              
                              
                              </script>                    </td>
                  </tr>
                   
                  <tr>
                    <td height="55" colspan="3" style="border: 0px" align="center">
                    
                    <label>
                      <input type="submit" name="button" onMouseDown="check();" id="button" value="提交信息"> 
                      
                      <script type="text/javascript">
                      function check()
                      {
                      var uname = document.getElementById("uname");
                      var upass = document.getElementById("upass");
                      var pagerandom = document.getElementById("pagerandom");
                      if(uname.value=="")
                      {
                      alert("请输入用户名");
                      uname.focus();
                      return;
                      }
                      if(upass.value=="")
                      {
                      alert("请输入密码");
                      upass.focus();
                      return;
                      }
                      if(pagerandom.value=="")
                      {
                      alert("请输入验证码");
                      pagerandom.focus();
                      return;
                      }
                      }
                      
                      </script>
                      
                      &nbsp;&nbsp;&nbsp;&nbsp;
                      <input type="button" name="button2" id="button2" value="重新填写">
                    </label>                    </td>
                    </tr>
                   
                   
                   
                </table>
          </form>
          </center>
         
        <table><tr><td height=12></td></tr></table>
        
 </div>
	</section>
	

    <jsp:include page="foot.jsp"></jsp:include>
	</body>
</html>

 
<script type="text/javascript">
<!--
<%
if(request.getAttribute("error")!=null){
%>
alert("用户名或密码错误");
<%}%>

<%
if(request.getAttribute("random")!=null){
%>
alert("验证码错误");
<%}%>

document.getElementById("uname").focus();

//-->
</script> 
            