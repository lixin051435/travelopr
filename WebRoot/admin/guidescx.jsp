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

	<body class="skin-orange">
 
		<jsp:include page="../top.jsp"></jsp:include>

<section>
<div class="">
 
<form name="f1" autocomplete="off"  action="guidescx.jsp"  method="post" style="display: inline;font-size: 14px">
<center>

<div align="left" style="height: 40px;vertical-align: middle;padding-top: 8px;font-weight: 700;font-size: 15px">
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    当前位置 : 导游管理
</div>

<table align="center" width=97%  class="table5">
   
 
  <tr ng-repeat="x in names">
    <td colspan=6 height=45>  &nbsp;
<% 
String pgno = request.getParameter("gno")==null?"":request.getParameter("gno"); 
String pgname = request.getParameter("gname")==null?"":request.getParameter("gname"); 
   %>

<%
 HashMap mmm = new HashMap();%> 

&nbsp;
员工号 
: 
<input type=text class=''  size=15 name='gno' />
&nbsp;

&nbsp;
姓名 
: 
<input type=text class=''  size=15 name='gname' />
&nbsp;

<input type=submit class='' value='查询信息' />
 &nbsp;
<!--   <jsp:include page='/travelopr/guidescx.do'>
<jsp:param name="gno" value="<%=pgno %>" /> 
<jsp:param name="gname" value="<%=pgname %>" /> 
</jsp:include>   -->
  
<input type=button   class='' value='添加信息' onclick="window.location.replace('guidestj.jsp')" /> 
&nbsp;</td> 
  </tr> 

   <tr ng-repeat="x in names">
    <td align="center" height=33>员工号  </td>
<td align="center" height=33>姓名  </td>
<td align="center" height=33>性别  </td>
<td align="center" height=33>联系电话  </td>

<td align="center" height=33>操作  </td> 
  </tr> 

  <% 
new CommDAO().delete(request,"guides"); 
if(request.getParameter("gnoid1")!=null){ 
 new CommDAO().commOper("update guides set gno ='' where id="+request.getParameter("gnoid1"));  
} 
if(request.getParameter("gnoid2")!=null){ 
 new CommDAO().commOper("update guides set gno ='' where id="+request.getParameter("gnoid2"));  
} 
String sql = "select * from guides where 1=1 " ;
 if(!pgno.equals("")){ 
 sql+= " and gno like'%"+pgno+"%' " ;
 }  
 if(!pgname.equals("")){ 
 sql+= " and gname like'%"+pgname+"%' " ;
 }  
  sql +=" order by id desc ";
String url = "guidescx.jsp?1=1&gno="+pgno+"&gname="+pgname+""; 
ArrayList<HashMap> list = PageManager.getPages(url,5, sql, request ); 
//ArrayList<HashMap> list = (ArrayList<HashMap>)PageManager.getPages(request); 
for(HashMap map:list){ %>
<tr ng-repeat="x in names">

    <td align="center" height=33><%=map.get("gno")%></td>
    <td align="center" height=33><%=map.get("gname")%></td>
    <td align="center" height=33><%=map.get("sex")%></td>
    <td align="center" height=33><%=map.get("tel")%></td>
    
    <td align="center" height=33>
<a href="guidesxg.jsp?id=<%=map.get("id")%>">修改</a>
&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;

<a onclick="return confirm('确定要删除这条记录吗?')" href="guidescx.jsp?scid=<%=map.get("id")%>">删除</a>
</td>
</tr>
<%}%> 

<tr>
<td colspan=6 height="35" align="center">${page.info}</td>
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
mmm.put("gno",pgno); 
mmm.put("gname",pgname); 
%>
<%=Info.tform(mmm)%> 
<script language=javascript >  
 
</script>  
<%=Info.tform(mmm)%> 
<script language=javascript src='/travelopr/js/My97DatePicker/WdatePicker.js'></script>
<script language=javascript src='/travelopr/js/popup.js'></script>
<script language=javascript> 
function update(no){ 
pop('guidesxg.jsp?id='+no,'信息修改',550,'100%') 
}
</script> 
<script language=javascript> 
function add(){ 
pop('guidestj.jsp','信息添加',550,'100%') 
}
</script> 
<%@page import="util.Info"%> 
<%@page import="java.util.ArrayList"%> 
<%@page import="java.util.HashMap"%> 
<%@page import="util.PageManager"%> 
<%@page import="dao.CommDAO"%> 
