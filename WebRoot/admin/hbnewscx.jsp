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
 
<form name="f1" autocomplete="off"  action="hbnewscx.jsp"  method="post" style="display: inline;font-size: 14px">
<center>

<div align="left" style="height: 40px;vertical-align: middle;padding-top: 8px;font-weight: 700;font-size: 15px">
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    当前位置 : 站内资讯
</div>

<table align="center" width=97%  class="table5">
   
 
  <tr ng-repeat="x in names">
    <td colspan=5 height=45>  &nbsp;
<% 
String ptitle = request.getParameter("title")==null?"":request.getParameter("title"); 
String pitype = request.getParameter("itype")==null?"":request.getParameter("itype"); 
String startsavetime = request.getParameter("startsavetime")==null?"":request.getParameter("startsavetime"); 
String endsavetime = request.getParameter("endsavetime")==null?"":request.getParameter("endsavetime"); 
   %>

<%
 HashMap mmm = new HashMap();%> 

&nbsp;
标题 
: 
<input type=text class=''  size=20 name='title' />
&nbsp;
类别 
: 
<select name='itype'>
<option value="">不限</option>
<option value='优惠活动'>优惠活动</option> 
<option value='旅游资讯'>旅游资讯</option> 
<option value='热门景点'>热门景点</option> 
</select>
&nbsp; 

&nbsp;
发布时间 :
 
<input type=text class=''  size=10 name='startsavetime' onclick='WdatePicker();' />
&nbsp;至&nbsp;

<input type=text class=''  size=10 name='endsavetime' onclick='WdatePicker();' />
&nbsp;

<input type=submit class='' value='查询信息' />
 &nbsp;
<!--   <jsp:include page='/travelopr/hbnewscx.do'>
<jsp:param name="title" value="<%=ptitle %>" /> 
<jsp:param name="itype" value="<%=pitype %>" /> 
<jsp:param name="startsavetime" value="<%=startsavetime %>" /> 
<jsp:param name="endsavetime" value="<%=endsavetime %>" /> 
</jsp:include>   -->
  
<input type=button   class='' value='添加信息' onclick="window.location.replace('hbnewstj.jsp')" /> 
&nbsp;</td> 
  </tr> 

   <tr ng-repeat="x in names">
    <td align="center" height=33>标题  </td>
<td align="center" height=33>类别  </td>
<td align="center" height=33>发布时间  </td>
<td align="center" height=33>操作  </td> 
  </tr> 

  <% 
new CommDAO().delete(request,"hbnews"); 
if(request.getParameter("titleid1")!=null){ 
 new CommDAO().commOper("update hbnews set title ='' where id="+request.getParameter("titleid1"));  
} 
if(request.getParameter("titleid2")!=null){ 
 new CommDAO().commOper("update hbnews set title ='' where id="+request.getParameter("titleid2"));  
} 
HashMap<String,String> selectmap = new HashMap();
HashMap<String,String> selectymap = new HashMap();
HashMap<String,String> selectbmap = new HashMap();
 selectmap.put("title","");  
 selectmap.put("itype","");  
 if(!startsavetime.equals("")){  
 selectbmap.put("startsavetime",">=");  
 mmm.put("startsavetime",startsavetime);  
 }  
 if(!endsavetime.equals("")){  
 selectbmap.put("endsavetime","<=");  
 mmm.put("endsavetime",endsavetime);  
 }  
String sql = Info.selectBuild3("hbnews",selectmap,selectymap,selectbmap,request) ;
String url = "hbnewscx.jsp?1=1&title="+ptitle+"&itype="+pitype+"&savetime="+startsavetime+"&savetime="+endsavetime+""; 
ArrayList<HashMap> list = PageManager.getPages(url,5, sql, request ); 
//ArrayList<HashMap> list = (ArrayList<HashMap>)PageManager.getPages(request); 
for(HashMap map:list){ %>
<tr ng-repeat="x in names">

    <td align="center" height=33><%=map.get("title")%></td>
    <td align="center" height=33><%=map.get("itype")%></td>
    <td align="center" height=33><%=map.get("savetime")%></td>
    <td align="center" height=33>
<a href="hbnewsxg.jsp?id=<%=map.get("id")%>">修改</a>
&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;

<a onclick="return confirm('确定要删除这条记录吗?')" href="hbnewscx.jsp?scid=<%=map.get("id")%>">删除</a>
</td>
</tr>
<%}%> 

<tr>
<td colspan=5 height="35" align="center">${page.info}</td>
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
mmm.put("title",ptitle); 
mmm.put("itype",pitype); 
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
pop('hbnewsxg.jsp?id='+no,'信息修改',550,'100%') 
}
</script> 
<script language=javascript> 
function add(){ 
pop('hbnewstj.jsp','信息添加',550,'100%') 
}
</script> 
<%@page import="util.Info"%> 
<%@page import="java.util.ArrayList"%> 
<%@page import="java.util.HashMap"%> 
<%@page import="util.PageManager"%> 
<%@page import="dao.CommDAO"%> 
