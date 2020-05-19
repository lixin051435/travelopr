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
 
<form name="f1" autocomplete="off"  action="pinluncx.jsp"  method="post" style="display: inline;font-size: 14px">
<center>

<div align="left" style="height: 40px;vertical-align: middle;padding-top: 8px;font-weight: 700;font-size: 15px">
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    当前位置 : 评论管理
</div>

<table align="center" width=97%  class="table5">
   
 
  <tr ng-repeat="x in names">
    <td colspan=7 height=45>  &nbsp;
<% 
String psaver = request.getParameter("saver")==null?"":request.getParameter("saver"); 
String pinfotitle = request.getParameter("infotitle")==null?"":request.getParameter("infotitle"); 
String startsavetime = request.getParameter("startsavetime")==null?"":request.getParameter("startsavetime"); 
String endsavetime = request.getParameter("endsavetime")==null?"":request.getParameter("endsavetime"); 
   %>

<%
 HashMap mmm = new HashMap();%> 

&nbsp;
评论人 
: 
<input type=text class=''  size=15 name='saver' />
&nbsp;

&nbsp;
评论对象 
: 
<input type=text class=''  size=15 name='infotitle' />
&nbsp;

&nbsp;
评论时间 :
 
<input type=text class=''  size=8 name='startsavetime' onclick='WdatePicker();' />
&nbsp;至&nbsp;

<input type=text class=''  size=8 name='endsavetime' onclick='WdatePicker();' />
&nbsp;

<input type=submit class='' value='查询信息' />
 &nbsp;
<!--   <jsp:include page='/travelopr/pinluncx.do'>
<jsp:param name="saver" value="<%=psaver %>" /> 
<jsp:param name="infotitle" value="<%=pinfotitle %>" /> 
<jsp:param name="startsavetime" value="<%=startsavetime %>" /> 
<jsp:param name="endsavetime" value="<%=endsavetime %>" /> 
</jsp:include>   -->
   
&nbsp;</td> 
  </tr> 

   <tr ng-repeat="x in names">
    <td align="center" height=33>评论人  </td>
<td align="center" height=33>内容  </td>
<td align="center" height=33>评论对象  </td>
<td align="center" height=33>类别  </td>
<td align="center" height=33>评论时间  </td>
<td align="center" height=33> 评分 </td>
<td align="center" height=33>操作  </td> 
  </tr> 

  <% 
new CommDAO().delete(request,"pinlun"); 
if(request.getParameter("saverid1")!=null){ 
 new CommDAO().commOper("update pinlun set saver ='' where id="+request.getParameter("saverid1"));  
} 
if(request.getParameter("saverid2")!=null){ 
 new CommDAO().commOper("update pinlun set saver ='' where id="+request.getParameter("saverid2"));  
} 
HashMap<String,String> selectmap = new HashMap();
HashMap<String,String> selectymap = new HashMap();
HashMap<String,String> selectbmap = new HashMap();
 selectmap.put("saver","");  
 selectmap.put("infotitle","");  
 if(!startsavetime.equals("")){  
 selectbmap.put("startsavetime",">=");  
 mmm.put("startsavetime",startsavetime);  
 }  
 if(!endsavetime.equals("")){  
 selectbmap.put("endsavetime","<=");  
 mmm.put("endsavetime",endsavetime);  
 }  
String sql = Info.selectBuild3("pinlun",selectmap,selectymap,selectbmap,request) ;
String url = "pinluncx.jsp?1=1&saver="+psaver+"&infotitle="+pinfotitle+"&savetime="+startsavetime+"&savetime="+endsavetime+""; 
ArrayList<HashMap> list = PageManager.getPages(url,5, sql, request ); 
//ArrayList<HashMap> list = (ArrayList<HashMap>)PageManager.getPages(request); 
for(HashMap map:list){ 
String tablename = map.get("tablename").toString();
if(tablename.equals("article"))tablename="网友游记";
if(tablename.equals("pros"))tablename="旅游线路";
%>
<tr ng-repeat="x in names">

    <td align="center" height=33><%=map.get("saver")%></td>
    <td align="center" height=33><%=map.get("content")%></td>
    <td align="center" height=33><%=map.get("infotitle")%></td>
    <td align="center" height=33><%=tablename%></td>
    <td align="center" height=33><%=map.get("savetime")%></td>
    <td align="center" height=33><%=map.get("pf")%></td>
    <td align="center" height=33> 
<a onclick="return confirm('确定要删除这条记录吗?')" href="pinluncx.jsp?scid=<%=map.get("id")%>">删除</a>
</td>
</tr>
<%}%> 

<tr>
<td colspan=7 height="35" align="center">${page.info}</td>
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
mmm.put("saver",psaver); 
mmm.put("infotitle",pinfotitle); 
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
pop('pinlunxg.jsp?id='+no,'信息修改',550,'100%') 
}
</script> 
<script language=javascript> 
function add(){ 
pop('pinluntj.jsp','信息添加',550,'100%') 
}
</script> 
<%@page import="util.Info"%> 
<%@page import="java.util.ArrayList"%> 
<%@page import="java.util.HashMap"%> 
<%@page import="util.PageManager"%> 
<%@page import="dao.CommDAO"%> 
