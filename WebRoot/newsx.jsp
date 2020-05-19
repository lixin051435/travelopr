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
 HashMap mmm = new CommDAO().getmap(id,"hbnews"); 
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
		            <h2 class="page-title" style="font-size: 17px;margin-top: 20px">当前位置: 站内资讯</h1> 
		          </div>
		        </div>
		      <div class="line2"></div>
		        
		        <div class=" " align="center">
		        <h1 style="font-size: 23px;padding-top: 15px;padding-bottom: 15px;margin-bottom: 15px">
		        <%=mmm.get("title") %>
		        </h1>
		        </div>
		        
		        
		          <div   align="center">
		        <h1 style="font-size: 23px;padding-top: 5px;padding-bottom: 5px;margin-bottom: 5px">
		         <img src="/travelopr/upfile/<%=mmm.get("filename") %>" height="280" />
		        </h1>
		        </div>
		        
		        
		          <div class=" " align="center">
		        <font style="font-size: 14px;padding-top: 5px;padding-bottom: 5px;margin-bottom: 5px">
		         <%=mmm.get("itype") %> - <%=mmm.get("savetime") %>
		        </font>
		        </div>
		        
		        
		        <div class="row" style="margin-top: 20px">
		             <%=mmm.get("content") %>
		        </div>
		      </div>
		       
		    </div>
		  </div>
		</section>
 
    <jsp:include page="foot.jsp"></jsp:include>
	</body>
</html>



 
            