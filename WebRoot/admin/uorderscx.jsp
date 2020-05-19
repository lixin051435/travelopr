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
		
		
		<title>Magzz - Responsive HTML5 and CSS3</title>
		
	</head>

	<body class="skin-orange">
 
		<jsp:include page="../top.jsp"></jsp:include>

<section>
<div class="">
 
<form name="f1" autocomplete="off"  action="uorderscx.jsp"  method="post" style="display: inline;font-size: 14px">
<center>

<div align="left" style="height: 40px;vertical-align: middle;padding-top: 8px;font-weight: 700;font-size: 15px">
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    当前位置 : 我的预定
</div>

<table align="center" width=97%  class="table5">
   
 
  <tr ng-repeat="x in names">
    <td colspan=13 height=45>  &nbsp;
<% 
String pdname = request.getParameter("dname")==null?"":request.getParameter("dname"); 
String pmuname = request.getParameter("muname")==null?"":request.getParameter("muname"); 
   %>

<%
 HashMap mmm = new HashMap();%> 

&nbsp;
项目 
: 
<input type=text class=''  size=20 name='dname' />
&nbsp;

&nbsp;
民宿管理员 
: 
<input type=text class=''  size=20 name='muname' />
&nbsp;

<input type=submit class='' value='查询信息' />
 &nbsp;
<!--   <jsp:include page='/travelopr/uorderscx.do'>
<jsp:param name="dname" value="<%=pdname %>" /> 
<jsp:param name="muname" value="<%=pmuname %>" /> 
</jsp:include>   -->
   
&nbsp;</td> 
  </tr> 

   <tr ng-repeat="x in names">
    <td align="center" height=33>预定人  </td>
<td align="center" height=33>姓名  </td>
<td align="center" height=33>身份证  </td>
<td align="center" height=33>联系电话  </td>
<td align="center" height=33>项目  </td>
<td align="center" height=33>价格  </td>
<td align="center" height=33>交通  </td>
<td align="center" height=33>酒店  </td>
<td align="center" height=33>合计  </td>
<td align="center" height=33>付款状态  </td>
<td align="center" height=33>受理状态  </td> 
<td align="center" height=33>操作  </td> 
  </tr> 

  <% 
new CommDAO().delete(request,"orders"); 
if(request.getParameter("statusid1")!=null){ 
HashMap m = new CommDAO().getmap(request.getParameter("statusid1"),"orders"); 
if(m.get("fkstatus").equals("已付款"))
 new CommDAO().commOper("update orders set status ='取消',fkstatus='已退款' where id="+request.getParameter("statusid1"));  
if(m.get("fkstatus").equals("未付款"))
 new CommDAO().commOper("update orders set status ='取消' where id="+request.getParameter("statusid1"));  

} 
if(request.getParameter("statusid2")!=null){ 
 new CommDAO().commOper("update orders set status ='' where id="+request.getParameter("statusid2"));  
} 
String sql = "select * from orders where 1=1 " ;
 if(!pdname.equals("")){ 
 sql+= " and dname like'%"+pdname+"%' " ;
 }  
 if(!pmuname.equals("")){ 
 sql+= " and muname like'%"+pmuname+"%' " ;
 }  
  sql +="  and (1!=1 " ; 
  sql +="  or  uname like'%"+Info.getUser(request).get("uname")+"%') " ;
  sql +=" order by id desc ";
String url = "uorderscx.jsp?1=1&dname="+pdname+"&muname="+pmuname+""; 
ArrayList<HashMap> list = PageManager.getPages(url,5, sql, request ); 
//ArrayList<HashMap> list = (ArrayList<HashMap>)PageManager.getPages(request); 
for(HashMap map:list){ 
double totprice = 0;
totprice = Integer.parseInt(map.get("jtprice").toString())+Integer.parseInt(map.get("jdprice").toString())+Integer.parseInt(map.get("tprice").toString());
%>
<tr ng-repeat="x in names">

    <td align="center" height=33><%=map.get("uname")%></td>
    <td align="center" height=33><%=map.get("tname")%></td>
    <td align="center" height=33><%=map.get("sfid")%></td>
    <td align="center" height=33><%=map.get("tel")%></td>
    <td align="center" height=33><%=map.get("dname")%></td>
    <td align="center" height=33><%=map.get("tprice")%></td>
    <td align="center" height=33><%=map.get("jt")+" - "+map.get("jtprice")%></td>
    <td align="center" height=33><%=map.get("jd")+" - "+map.get("jdprice")%></td>
    <td align="center" height=33><%=totprice%></td>
    <td align="center" height=33><%=map.get("fkstatus")%></td>
    <td align="center" height=33><%=map.get("status")%></td> 
    <td align="center" height=33>
    
<%if(map.get("status").equals("待受理")){ %>    
<a href="uorderscx.jsp?value=取消&statusid1=<%=map.get("id")%>">取消</a> 
<%} %>
&nbsp;&nbsp;
<%if(map.get("fkstatus").equals("未付款")){ %>    
<a href="uordersxg.jsp?id=<%=map.get("id")%>">付款</a> 
<%} %>

</td>
</tr>
<%}%> 

<tr>
<td colspan=13 height="35" align="center">${page.info}</td>
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
mmm.put("dname",pdname); 
mmm.put("muname",pmuname); 
%>
<%=Info.tform(mmm)%> 
<script language=javascript >  
 
</script>  
<%=Info.tform(mmm)%> 
<script language=javascript src='/travelopr/js/My97DatePicker/WdatePicker.js'></script>
<script language=javascript src='/travelopr/js/popup.js'></script>
<script language=javascript> 
function update(no){ 
pop('uordersxg.jsp?id='+no,'信息修改',550,'100%') 
}
</script> 
<script language=javascript> 
function add(){ 
pop('orderstj.jsp','信息添加',550,'100%') 
}
</script> 
<%@page import="util.Info"%> 
<%@page import="java.util.ArrayList"%> 
<%@page import="java.util.HashMap"%> 
<%@page import="util.PageManager"%> 
<%@page import="dao.CommDAO"%> 
