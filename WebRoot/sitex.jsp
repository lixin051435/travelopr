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
 HashMap mmm = new CommDAO().getmap(id,"mixinfo"); 
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
		      <div class=" ">
		        <div class="row">
		          <div class="col-md-12">         
		            <h2 class="page-title" style="font-size: 17px;margin-top: 20px">当前位置: <%=mmm.get("infotype") %></h1> 
		          </div>
		        </div>
		        <div class="line2"></div>
		        <div class="row">
		             <%=mmm.get("content") %>
		        </div>
		      </div>
		       
		    </div>
		  </div>
		</section>
 
    <jsp:include page="foot.jsp"></jsp:include>
	</body>
</html>



 
            