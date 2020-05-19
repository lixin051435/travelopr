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

		<section class="category">
		  <div class="container">
		    <div class="row">
		      <div class=" ">
		        <div class="row">
		          <div class="col-md-12">         
		            <h2 class="page-title" style="font-size: 17px;margin-top: 20px">当前位置: 留言板</h1> 
		          </div>
		        </div>
		        <div class="line2"></div>
		        <div class="row">
		           
		           
		           
		           <TABLE cellSpacing=2 cellPadding=3 width="100%" align=center  bgColor=#ffffff border=0> 
     
                    
                    
    <%
      if(Info.getUser(request)!=null){
    HashMap extmap = new HashMap();
    extmap.put("uname",Info.getUser(request).get("uname"));
    extmap.put("filename",Info.getUser(request).get("filename"));
    new CommDAO().insert(request,response,"messages",extmap,true,false);
    if(request.getParameter("f")!=null)
    {
    %>
    <script language=javascript>
    alert("留言成功");
    window.location.replace("message.jsp");
    </script>
    <%
    }}
    
    String url = "message.jsp?1=1"; 
	ArrayList<HashMap> list = PageManager.getPages(url,5, "select * from messages order by id desc", request ); 
	for(HashMap map:list){ 
     %>
        <tr>
          <td  height="32" align="right" style="padding: 10px;border: 0px" valign="middle" class="dd">
          <img src="/travelopr/upfile/<%=map.get("filename")%>"   height="72" width="85" />
          </td>
         
          <td  width="99%" align="left" style="padding: 10px;border: 0px" valign="middle" class="dd">
          
          <font color=red><%=map.get("uname") %>  
           (<%=map.get("savetime") %>) : </font>
            <table>
              <tr>
                <td height="6"></td>
              </tr>
            </table>
            <%=map.get("cont") %>
            <table>
              <tr>
                <td height="6"></td>
              </tr>
            </table>
            
            <font color=gray> 
            管理员回复 ： <%=map.get("recont").equals("")?"暂无回复":map.get("recont") %> 
            </font>
            
            </td>
        </tr>
 <%} %>
 
 
   <tr  >
    <td height="20" align="center" colspan="4" style="padding: 10px;border: 0px" id="page">
		
		 ${page.info }		 	</td>
  </tr>
  
  
  
   <%
          if(Info.getUser(request)!=null){
           %>
          <tr>
          <td height="45" align="center" colspan="5" valign="middle" style="padding: 10px" >
          <form action="message.jsp?f=f" name="f1" method="post">
          <textArea cols="55" rows="3" name="cont" ></textArea>
          
          <table><tr><td height="3"></td></tr></table>
          
          <input type="submit" value=" 提交留言 " />
          </form>          </td>
          </tr> 
          <%} %>
      </table>
                            	
		           
		           
		           
		        </div>
		      </div>
		       
		    </div>
		  </div>
		</section>
 
    <jsp:include page="foot.jsp"></jsp:include>
	</body>
</html>



 
            