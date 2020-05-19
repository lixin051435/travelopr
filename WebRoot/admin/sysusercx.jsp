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
 
<form name="f1" autocomplete="off"  action="sysusercx.jsp"  method="post" style="display: inline;font-size: 14px">
<center>

<div align="left" style="height: 40px;vertical-align: middle;padding-top: 8px;font-weight: 700;font-size: 15px">
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    当前位置 : 管理员信息维护
</div>

<table align="center" width=97%  class="table5">
   
 
  <tr ng-repeat="x in names">
    <td colspan=11 height=45>  &nbsp;
<% 
String puname = request.getParameter("uname")==null?"":request.getParameter("uname"); 
String ptname = request.getParameter("tname")==null?"":request.getParameter("tname"); 
   %>

<%
 HashMap mmm = new HashMap();%> 

&nbsp;
用户名 
: 
<input type=text class=''  size=20 name='uname' />
&nbsp;

&nbsp;
姓名 
: 
<input type=text class=''  size=20 name='tname' />
&nbsp;

<input type=submit class='' value='查询信息' />
 &nbsp;
<!--   <jsp:include page='/travelopr/sysusercx.do'>
<jsp:param name="uname" value="<%=puname %>" /> 
<jsp:param name="tname" value="<%=ptname %>" /> 
</jsp:include>   -->
  
<input type=button   class='' value='添加信息' onclick="window.location.replace('sysusertj.jsp')" /> 
&nbsp;</td> 
  </tr> 

   <tr ng-repeat="x in names">
    <td align="center" height=33>用户名  </td>
<td align="center" height=33>姓名  </td>
<td align="center" height=33>证件号  </td>
<td align="center" height=33>性别  </td>
<td align="center" height=33>生日  </td>
<td align="center" height=33>电话  </td>
<td align="center" height=33>邮箱  </td>
<td align="center" height=33>状态  </td>
<td align="center" height=33>注册时间  </td>
<td align="center" height=33>操作  </td> 
  </tr> 

  <% 
new CommDAO().delete(request,"sysuser"); 
if(request.getParameter("statusid1")!=null){ 
 new CommDAO().commOper("update sysuser set status ='锁定' where id="+request.getParameter("statusid1"));  
} 
if(request.getParameter("statusid2")!=null){ 
 new CommDAO().commOper("update sysuser set status ='正常' where id="+request.getParameter("statusid2"));  
} 
HashMap<String,String> selectmap = new HashMap();
HashMap<String,String> selectymap = new HashMap();
HashMap<String,String> selectbmap = new HashMap();
 selectmap.put("uname","");  
 selectmap.put("tname","");  
 selectymap.put("utype","管理员");  
String sql = Info.selectBuild3("sysuser",selectmap,selectymap,selectbmap,request) ;
String url = "sysusercx.jsp?1=1&uname="+puname+"&tname="+ptname+""; 
ArrayList<HashMap> list = PageManager.getPages(url,5, sql, request ); 
//ArrayList<HashMap> list = (ArrayList<HashMap>)PageManager.getPages(request); 
for(HashMap map:list){ %>
<tr ng-repeat="x in names">

    <td align="center" height=33><%=map.get("uname")%></td>
    <td align="center" height=33><%=map.get("tname")%></td>
    <td align="center" height=33><%=map.get("sfid")%></td>
    <td align="center" height=33><%=map.get("sex")%></td>
    <td align="center" height=33><%=map.get("birth")%></td>
    <td align="center" height=33><%=map.get("tel")%></td>
    <td align="center" height=33><%=map.get("email")%></td>
    <td align="center" height=33><%=map.get("status")%></td>
    <td align="center" height=33><%=map.get("savetime")%></td>
    <td align="center" height=33>
<a href="sysusercx.jsp?value=锁定&statusid1=<%=map.get("id")%>">锁定</a>
&nbsp;&nbsp;|&nbsp;&nbsp;
<a href="sysusercx.jsp?value=正常&statusid2=<%=map.get("id")%>">解锁</a>
&nbsp;&nbsp;|&nbsp;&nbsp;

<a href="sysuserxg.jsp?id=<%=map.get("id")%>">修改</a>
&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;

<a onclick="return confirm('确定要删除这条记录吗?')" href="sysusercx.jsp?scid=<%=map.get("id")%>">删除</a>
</td>
</tr>
<%}%> 

<tr>
<td colspan=11 height="35" align="center">${page.info}</td>
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
            <script language=javascript src='/travelopr/js/ajax.js'></script>
<% 
mmm.put("uname",puname); 
mmm.put("tname",ptname); 
%>
<%=Info.tform(mmm)%> 
<script language=javascript >  
 
</script>  
<%=Info.tform(mmm)%> 
<script language=javascript src='/travelopr/js/My97DatePicker/WdatePicker.js'></script>
<script language=javascript src='/travelopr/js/popup.js'></script>
<script language=javascript> 
function update(no){ 
pop('sysuserxg.jsp?id='+no,'信息修改',550,'100%') 
}
</script> 
<script language=javascript> 
function add(){ 
pop('sysusertj.jsp','信息添加',550,'100%') 
}
</script> 
<%@page import="util.Info"%> 
<%@page import="java.util.ArrayList"%> 
<%@page import="java.util.HashMap"%> 
<%@page import="util.PageManager"%> 
<%@page import="dao.CommDAO"%> 
