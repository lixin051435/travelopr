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
		            <h2 class="page-title" style="font-size: 17px;margin-top: 20px">当前位置: 站内资讯</h1> 
		          </div>
		        </div>
		        <div class="line2"></div>
		        <div class="row">
		         
		         
		         
		         
  <%  
String itype = request.getParameter("itype");
 
 
HashMap<String,String> selectmap = new HashMap();
HashMap<String,String> selectymap = new HashMap();
HashMap<String,String> selectbmap = new HashMap();
 selectmap.put("title","");     
String sql = Info.selectBuild3("hbnews",selectmap,selectymap,selectbmap,request) ;
String url = "news.jsp?1=1"; 
ArrayList<HashMap> list = PageManager.getPages(url,5, sql, request ); 
//ArrayList<HashMap> list = (ArrayList<HashMap>)PageManager.getPages(request); 
for(HashMap map:list){ %>
		          <article class="col-md-12 article-list">
		            <div class="inner">
		              <figure>
			              <a href="newsx.jsp?id=<%=map.get("id")%>">
			                <img src="/travelopr/upfile/<%=map.get("filename") %>">
		                </a>
		              </figure>
		              <div class="details">
		                <div class="detail" style="font-size: 12px">
		                  <div class="category">
		                   <a href="newsx.jsp?id=<%=map.get("id")%>"><%=map.get("itype") %></a>
		                  </div>
		                  <div class="time"><%=map.get("savetime") %></div>
		                </div>
		                <h1><a href="newsx.jsp?id=<%=map.get("id")%>"><%=map.get("title") %></a></h1>
		                <p>
		                  <%=Info.ensubStr(map.get("content").toString(),150) %>
		                </p>
		              
		              </div>
		            </div>
		          </article>
		          <%} %>
		           
		            
		          <div class="col-md-12 text-center"> 
		            <div class="pagination-help-text">
		            	${page.info }
		            </div>
		          </div>
		        </div>
		      </div>
		       
		    </div>
		  </div>
		</section>
 
    <jsp:include page="foot.jsp"></jsp:include>
	</body>
</html>



 
            