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
		
		
		<title>旅游信息系统 - Responsive HTML5 and CSS3</title>
		
	</head>

	<body class="skin-orange">
 
		<jsp:include page="../top.jsp"></jsp:include>

<section>
<div class="">
 
<form name="f1" autocomplete="off"  action="messagescx.jsp"  method="post" style="display: inline;font-size: 14px">
<center>

<div align="left" style="height: 40px;vertical-align: middle;padding-top: 8px;font-weight: 700;font-size: 15px">
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    当前位置 : 留言板
</div>

<table align="center" width=97%  class="table5">
   
 
  <tr ng-repeat="x in names">
    <td colspan=6 height=45>  &nbsp;
<% 
String puname = request.getParameter("uname")==null?"":request.getParameter("uname"); 
String startsavetime = request.getParameter("startsavetime")==null?"":request.getParameter("startsavetime"); 
String endsavetime = request.getParameter("endsavetime")==null?"":request.getParameter("endsavetime"); 
   %>

<%
 HashMap mmm = new HashMap();%> 

&nbsp;
留言人 
: 
<input type=text class=''  size=20 name='uname' />
&nbsp;

&nbsp;
留言时间 :
 
<input type=text class=''  size=10 name='startsavetime' onclick='WdatePicker();' />
&nbsp;至&nbsp;

<input type=text class=''  size=10 name='endsavetime' onclick='WdatePicker();' />
&nbsp;

<input type=submit class='' value='查询信息' />
 &nbsp;
<!--   <jsp:include page='/travelopr/messagescx.do'>
<jsp:param name="uname" value="<%=puname %>" /> 
<jsp:param name="startsavetime" value="<%=startsavetime %>" /> 
<jsp:param name="endsavetime" value="<%=endsavetime %>" /> 
</jsp:include>   -->
   </td> 
  </tr> 

   <tr ng-repeat="x in names">
    <td align="center" height=33>留言人  </td>
<td align="center" height=33>内容  </td>
<td align="center" height=33>回复  </td>
<td align="center" height=33>留言时间  </td>
<td align="center" height=33>操作  </td> 
  </tr> 

  <% 
new CommDAO().delete(request,"messages"); 
if(request.getParameter("unameid1")!=null){ 
 new CommDAO().commOper("update messages set uname ='' where id="+request.getParameter("unameid1"));  
} 
if(request.getParameter("unameid2")!=null){ 
 new CommDAO().commOper("update messages set uname ='' where id="+request.getParameter("unameid2"));  
} 
HashMap<String,String> selectmap = new HashMap();
HashMap<String,String> selectymap = new HashMap();
HashMap<String,String> selectbmap = new HashMap();
 selectmap.put("uname","");  
 if(!startsavetime.equals("")){  
 selectbmap.put("startsavetime",">=");  
 mmm.put("startsavetime",startsavetime);  
 }  
 if(!endsavetime.equals("")){  
 selectbmap.put("endsavetime","<=");  
 mmm.put("endsavetime",endsavetime);  
 }  
String sql = Info.selectBuild3("messages",selectmap,selectymap,selectbmap,request) ;
String url = "messagescx.jsp?1=1&uname="+puname+"&savetime="+startsavetime+"&savetime="+endsavetime+""; 
ArrayList<HashMap> list = PageManager.getPages(url,5, sql, request ); 
//ArrayList<HashMap> list = (ArrayList<HashMap>)PageManager.getPages(request); 
for(HashMap map:list){ %>
<tr ng-repeat="x in names">

    <td align="center" height=33><%=map.get("uname")%></td>
    <td align="center" height=33><%=map.get("cont")%></td>
    <td align="center" height=33><%=map.get("recont")%></td>
    <td align="center" height=33><%=map.get("savetime")%></td>
    <td align="center" height=33>
<a href="messagesxg.jsp?id=<%=map.get("id")%>">回复</a>
&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;

<a onclick="return confirm('确定要删除这条记录吗?')" href="messagescx.jsp?scid=<%=map.get("id")%>">删除</a>
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
mmm.put("uname",puname); 
mmm.put("savetime",startsavetime); 
mmm.put("savetime",endsavetime); 
%>
<%=Info.tform(mmm)%> 
<script language=javascript >  
 
</script>  
<%=Info.tform(mmm)%> 
<script language=javascript src='/travelopr/js/My97DatePicker/WdatePicker.js'></script>
<script language=javascript src='/travelopr/js/popup.js'></script>
<script language=javascript> 
function update(no){ 
pop('messagesxg.jsp?id='+no,'信息修改',550,'100%') 
}
</script> 
<script language=javascript> 
function add(){ 
pop('messagestj.jsp','信息添加',550,'100%') 
}
</script> 
<%@page import="util.Info"%> 
<%@page import="java.util.ArrayList"%> 
<%@page import="java.util.HashMap"%> 
<%@page import="util.PageManager"%> 
<%@page import="dao.CommDAO"%> 
