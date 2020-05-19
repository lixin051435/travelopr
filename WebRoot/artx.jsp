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
 HashMap mmm = new CommDAO().getmap(id,"article"); 
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
 
		<jsp:include page="top.jsp"></jsp:include>

		<section class="category">
		  <div class="container">
		    <div class="row">
		      <div class="">
		        <div class="row">
		          <div class="col-md-12">         
		            <h2 class="page-title" style="font-size: 17px;margin-top: 20px">当前位置: 网友游记</h1> 
		          </div>
		        </div>
		      <div class="line2"></div>
		        
		        <div class=" " align="center">
		        <h1 style="font-size: 23px;padding-top: 15px;padding-bottom: 15px;margin-bottom: 15px">
		        <%=mmm.get("ytitle") %>
		        </h1>
		        </div>
		        
		         
		        
		          <div class=" " align="center">
		        <font style="font-size: 14px;padding-top: 5px;padding-bottom: 5px;margin-bottom: 5px">
		         <%=mmm.get("uname") %> - <%=mmm.get("savetime") %>
		        </font>
		        </div>
		        
		        
		        <div class="row" style="margin-top: 20px">
		             <%=mmm.get("content") %>
		        </div>
		      </div>
		      
		      
		              
  <table align="center" width="95%">
     <tr>
          <td height="45" align="center" colspan="4" valign="middle" >
              <%
              	String table="article";
                                        String colname = "ytitle";
                                        String url = "artx.jsp";
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



 
            