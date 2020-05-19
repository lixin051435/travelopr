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
		
		
		
		 
<%
CommDAO dao = new CommDAO();
String g = request.getParameter("g");
if("g".equals(g))
{    
HashMap user = Info.getUser(request);
String uname = user.get("uname").toString();
String tname = user.get("tname").toString();
String sfid = user.get("sfid").toString();
String tel = user.get("tel").toString();
String jt = request.getParameter("jt"); 
String jtprice = jt.split("-")[1];
jt = jt.split("-")[0];
String jd = request.getParameter("jd");  
String jdprice = jd.split("-")[1];
jd = jd.split("-")[0]; 
String stype = "";
String sprice = "";
 
String tprice = mmm.get("tprice").toString();
  
String sql = "Insert into orders(fkstatus,uname,tname,sfid,tel,dname,pid,tprice,jt,jtprice,jd,jdprice,status,muname)"+
"values('未付款','"+uname+"','"+tname+"','"+sfid+"','"+tel+"','"+dname+"','"+id+"','"+mmm.get("tprice")+"','"+jt+"','"+jtprice+"','"+jd+"','"+jdprice+"','待受理','"+mmm.get("uname")+"' )";
dao.commOper(sql);
 
%>
<script type="text/javascript">
alert("申请已发送，待负责人受理");
</script>
<% 
}
%>
	 
		
		

		<section class="category">
		  <div class="container">
		    <div class="row">
		      <div class="">
		        <div class="row">
		          <div class="col-md-12">         
		            <h2 class="page-title" style="font-size: 17px;margin-top: 20px">当前位置: 演唱会购票</h1> 
		          </div>
		        </div>
		      <div class="line2"></div>
		      
		        <div class=" " align="center">
		        <h1 style="font-size: 23px;padding-top: 15px;padding-bottom: 15px;margin-bottom: 15px">
		        <%=mmm.get("sname") %> 
		        </h1>
		        </div>
		        
		        
		          <div   align="center">
		        <h1 style="font-size: 23px;padding-top: 5px;padding-bottom: 5px;margin-bottom: 5px">
		         <img src="/travelopr/upfile/<%=mmm.get("filename") %>" height="280" />
		        </h1>
		        </div>
		        
		        
		          <div class=" " align="center">
		        
<table  align="center" width=97%  > 
 <%
  if(Info.getUser(request)!=null ){  
   if(Info.getUser(request).get("utype").equals("用户")){
  %>
 
<%} }%> 
<tr ng-repeat="x in names">
<td width="21%" height="32" align="center">项目名称</td>
<td width="79%" align="left"  style="padding-left: 5px"><%=mmm.get("sname")%></td>
</tr>
<tr ng-repeat="x in names">
<td width="21%" height="32" align="center">所属城市</td>
<td width="79%" align="left"  style="padding-left: 5px"><%=mmm.get("city")%></td>
</tr>
<tr ng-repeat="x in names">
<td width="21%" height="32" align="center">地址</td>
<td width="79%" align="left"  style="padding-left: 5px"><%=mmm.get("addrs")%></td>
</tr>
  
<tr ng-repeat="x in names">
<td width="21%" height="32" align="center">简介</td>
<td width="79%" align="left"  style="padding-left: 5px"><%=mmm.get("remo")%></td>
</tr>
 
<tr ng-repeat="x in names">
<td width="21%" height="32" align="center">基础费用</td>
<td width="79%" align="left"  style="padding-left: 5px"><%=mmm.get("tprice")%></td>
</tr>

    
</table>
		        </div>
		        
		         
		      </div>
		      
		      
		       <div class="row" style="margin-top: 20px">
		          <%
				 if(Info.getUser(request)!=null ){  
				 String utype = Info.getUser(request).get("utype").toString();
				 if(utype.equals("用户")){
				 %>
				  <form autocomplete="off" action="pre.jsp?id=<%=id %>&itype=<%=itype %>&g=g" name="f3" method="post" style="display: inline">  
				<center>
				 交通 : 
				<label>
				<input type=radio   size='11' class='' name='jt' checked="checked" value="火车-<%=mmm.get("hprice") %>" /> 火车(<%=mmm.get("hprice") %>)
				</label>&nbsp;  
				<label>
				<input type=radio   size='11' class='' name='jt'  value="飞机-<%=mmm.get("fprice") %>" /> 飞机(<%=mmm.get("fprice") %>)
				</label>
				 &nbsp;  
				   &nbsp;   &nbsp;  
				  酒店 : 
				<label>
				<input type=radio   size='11' class='' name='jd' checked="checked" value="经济酒店-<%=mmm.get("jprice") %>" /> 经济酒店(<%=mmm.get("jprice") %>)
				</label>
				 &nbsp;  
				<label>
				<input type=radio   size='11' class='' name='jd'  value="星级酒店-<%=mmm.get("wprice") %>" /> 星级酒店(<%=mmm.get("wprice") %>)
				</label>
				 &nbsp;  &nbsp;  
				<input type="submit"  name="button" style="height: 28px"  value="提交预定" /> 
				 </center>
				</form>  
				  <%}}%>
		        </div>
		        
		        
		        
		        
		        
  <table align="center" width="85%">
     <tr>
          <td height="45" align="center" colspan="4" valign="middle" >
              <%
              	String table="pros";
                                        String colname = "sname";
                                        String url = "pre.jsp";
                                        if(Info.getUser(request)!=null&&request.getParameter("content")!=null){
                            		    HashMap extmap = new HashMap();
                            		    extmap.put("saver",Info.getUser(request).get("uname"));
                            		    HashMap imap = new CommDAO().getmap(id,table);
                            		    String infotitle = imap.get(colname).toString();
                            		    extmap.put("infotitle",infotitle);
                            		    new CommDAO().insert(request,response,"pinlun",extmap,true,false);
                            		    }
              %>
           <jsp:include page='pinlun.jsp'>
           <jsp:param name="id" value="<%=id %>" />
           <jsp:param name="colname" value="<%=colname %>" />
           <jsp:param name="table" value="<%=table %>" />
           <jsp:param name="url" value="<%=url %>" />
           </jsp:include>
           </td>
          </tr> 
  </table>
		      
		      
		       
		    </div>
		  </div>
		</section>
 
    <jsp:include page="foot.jsp"></jsp:include>
	</body>
</html>
<script language=javascript>  
 <%
 if(request.getParameter("g")!=null||request.getParameter("f")!=null){
 %> 
 window.location.replace("pre.jsp?id=<%=id%>")
 <%}%>
</script>  
	<script language=javascript src='/register/js/My97DatePicker/WdatePicker.js'></script>
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
 
            