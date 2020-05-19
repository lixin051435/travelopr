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
 <%
 String id = request.getParameter("id"); 
 String itype = request.getParameter("itype"); 
 
 HashMap<String,String> mmm = new HashMap();
 String typename = "";
 String dname = "";
 
 mmm = new CommDAO().getmap(id,"pros");  
 dname = mmm.get("sname");
 
 
  %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<meta name="description" content="Magz is a HTML5 & CSS3 magazine template is based on Bootstrap 3.">
		
		
		<title>旅游信息系统 - Responsive HTML5 and CSS3</title>
		<script language=javascript src='/travelopr/js/My97DatePicker/WdatePicker.js'></script>
	</head>

	<body class="skin-orange">
 
		<jsp:include page="top.jsp"></jsp:include>
		 
		

		<section class="category">
		  <div class="container">
		    <div class="row">
		      <div class="">
		        <div class="row">
		          <div class="col-md-12">         
		            <h2 class="page-title" style="font-size: 17px;margin-top: 20px">当前位置: 举报反馈</h1> 
		          </div>
		        </div>
		      <div class="line2"></div>




<form  action="/travelopr/travelopr?ac=compl&tglparentid="  method="post" name="f1"  onsubmit="return checkform();">
 
<table width="100%" border="0" cellspacing="0" cellpadding="0">

  <tr align="center" valign="top">
    <td width="300%" colspan="3">
      <table width="100%"  border="0" cellpadding="0" cellspacing="0" id="standard_2">
    
        <tr style="display: none">
          <td width="25%" height="32" align="center" valign="middle" class="ddd"><span class="left_txt2">被举报人：</span></td>
          <td width="75%" align="left" valign="middle" class="ddd"><span class="left_txt2"><input type=text  onblur='checkform()' class='' id='touname' name='touname' size=35 /><label style='display:inline' id='clabeltouname' />&nbsp; </span></td>
          </tr>
          
          <tr style="display: none">
          <td width="25%" height="32" align="center" valign="middle" class="ddd"><span class="left_txt2">项目名称：</span></td>
          <td width="75%" align="left" valign="middle" class="ddd"><span class="left_txt2"><input type=text  onblur='checkform()' class='' id='sname' name='sname' size=35 /></td>
          </tr>
          
<tr style="display: none">
          <td width="25%" height="32" align="center" valign="middle" class="ddd"><span class="left_txt2">帖子内容：</span></td>
          <td width="75%" align="left" valign="middle" class="ddd"><span class="left_txt2"><input type=text  onblur='checkform()' class='' id='pcontent' name='pcontent' size=35 /><label style='display:inline' id='clabelpcontent' />&nbsp; </span></td>
          </tr>
<tr>
          <td width="25%" height="32" align="center" valign="middle" class="ddd"><span class="left_txt2">举报类别：</span></td>
          <td width="75%" align="left" valign="middle" class="ddd"><span class="left_txt2"><span id="ctypedanx">
<label  style='display:inline' ><input type=radio checked=checked name='ctype' id='ctype' value='服务态度' />&nbsp;服务态度 </label>&nbsp;
<label  style='display:inline' ><input type=radio  name='ctype' id='ctype' value='服务质量' />&nbsp;服务质量 </label>&nbsp;
<label  style='display:inline' ><input type=radio  name='ctype' id='ctype' value='价格不实' />&nbsp;价格不实 </label>&nbsp;
<label  style='display:inline' ><input type=radio  name='ctype' id='ctype' value='虚假广告' />&nbsp;虚假广告 </label>&nbsp;
<label  style='display:inline' ><input type=radio  name='ctype' id='ctype' value='其他' />&nbsp;其他 </label>&nbsp;
</span>&nbsp; </span></td>
          </tr>
<tr>
          <td width="25%" height="32" align="center" valign="middle" class="ddd"><span class="left_txt2">举报信息：</span></td>
          <td width="75%" align="left" valign="middle" class="ddd"><span class="left_txt2"><input type=text  onblur='checkform()' class='' id='message' name='message' size=60 /><label style='display:inline' id='clabelmessage' />&nbsp; </span></td>
          </tr>
<tr style="display: none">
          <td width="25%" height="32" align="center" valign="middle" class="dd"><span class="left_txt2">：</span></td>
          <td width="75%" align="left" valign="middle" class="dd"><span class="left_txt2"><input type=text  onblur='checkform()' class='' id='bid' name='bid' size=35 /><label style='display:inline' id='clabelbid' />&nbsp; </span></td>
          </tr>

      </table></td>
  </tr>
  <tr align="center" valign="middle">
    <td height="39" colspan="3" id="page">
		
        
         <input type="submit" value="提交" name="B1" />         
              
                &nbsp;&nbsp;&nbsp;
        
        
		  <input class="p_input" type="button" name="s" value="重置"  	onclick="topage(getElementById('pagenum').value);"/>
		</div>	</td>
  </tr>
</table>
<% 
HashMap<String,String> rmap = new HashMap(); 
rmap.put("uname","touname");  
rmap.put("id","bid"); 
rmap.put("sname","sname"); 
out.print(new CommDAO().applyInsert(request.getParameter("applyid"),"pros",rmap)); 
 %> 
</form>
    
		    </div>
		  </div>
		</section>
 
    <jsp:include page="foot.jsp"></jsp:include>
	</body>
</html>


