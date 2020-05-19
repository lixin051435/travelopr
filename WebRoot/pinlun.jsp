<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title> </title> 

<link href="/travelopr/frontfiles/css/css.css" rel="stylesheet" type="text/css" />
<link href="/travelopr/frontfiles/css/zsjt.css" rel="stylesheet" type="text/css" /> 
</head>

<body>

 
<style>
A.applink:hover {border: 2px dotted #DCE6F4;padding:2px;background-color:#ffff00;color:green;text-decoration:none}
A.applink       {border: 2px dotted #DCE6F4;padding:2px;color:#2F5BFF;background:transparent;text-decoration:none}
A.info          {color:#2F5BFF;background:transparent;text-decoration:none}
A.info:hover    {color:green;background:transparent;text-decoration:underline}
</style> 

 
 <%
 String id = request.getParameter("id");
 String table = request.getParameter("table");
 String surl = request.getParameter("url");
  String colname = request.getParameter("colname");
 
  %>
 
 
    
	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="" align="center">
  <tr>
    <td align="center" valign="top" >　 
 
 
<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" >

  <tr align="center" valign="top">
    <td  >
      <table width="100%"  border="0" cellpadding="0" cellspacing="0"  >
   
    
    
    <tr><td colspan="4" background="/travelopr/frontfiles/images/sub2_05.jpg" height="1"></td></tr> 
    
    
    <%
     
    
    String url = surl+"?1=1"; 
	ArrayList<HashMap> list = PageManager.getPages(url,8, "select * from pinlun where tablename='"+table+"' and pid='"+id+"' order by id desc", request ); 
	for(HashMap map:list){ 
	 
     %>
        <tr>
          <td width="89" height="34" align="center" valign="middle" >
          
          <img src="upfile/<%=new CommDAO().select("select * from sysuser where uname='"+map.get("saver")+"'").get(0).get("filename") %>" width="45" height="40" />           </td>
          <td width="1201" align="left" valign="middle" style="padding: 10px" > 
         <font color=orange> <%=map.get("saver") %>  
          &nbsp;&nbsp;
           (<%=map.get("savetime") %>) : </font> 
          
          <table><tr><td height="0"></td></tr></table>
          
          <%=map.get("pf") %>分，<%=map.get("content") %>          </td>
           
          <td width="21" align="right" valign="middle"></td>
        </tr>
         
        
      <%} %>     
           
          
           <tr>
          <td height="45" align="center" colspan="4" valign="middle" >
          
          ${page.info }          </td>
          </tr> 
          
          
          <%
          if(Info.getUser(request)!=null){
          String uname = Info.getUser(request).get("uname").toString();
          //if(new CommDAO().getInt("select count(1) from pinlun where pid='"+id+"' and saver='"+uname+"'")==0){
           %>
          <tr>
          <td height="45" align="center" colspan="4" valign="middle" style="padding: 10px" >
          <form action="<%=surl%>?f=f&pid=<%=id%>&tablename=<%=table %>&id=<%=id%>&table=<%=table %>&colname=<%=colname %>" name="f1" method="post">
          
          <textArea cols="55" rows="3" name="content" ></textArea>
           
               <table><tr><td height="2"></td></tr></table>  
               
          评分 :  <label><input type=radio checked="checked" value="1" name="pf" /> &nbsp;1&nbsp; </label>
                <label><input type=radio value="2" name="pf" /> &nbsp;2&nbsp; </label>
                <label><input type=radio value="3" name="pf" /> &nbsp;3&nbsp; </label>
                <label><input type=radio value="4" name="pf" /> &nbsp;4&nbsp; </label>
                <label><input type=radio value="5" name="pf" /> &nbsp;5&nbsp; </label>
           
          <table><tr><td height="3"></td></tr></table>
          
          <input type="submit" value=" 提交评论 " />
          </form>          </td>
          </tr> 
          <%}//} %>
      </table></td>
  </tr>
 
</table> 
 
</td>
  </tr>
 

</table> 
 
 

</body>
</html>
 