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
  CommDAO dao = new CommDAO();
  if(request.getParameter("z")!=null)session.invalidate(); 
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

		<section class="home">
			<div class="container">
				<div class="row">  
					<div class="col-md-8 col-sm-12 col-xs-12">  
						<div class="   " id=" ">
							  
							 
				<div class="main-slider">
                    	
                    	
                    	
                    	
                    	<div class="lb-box" id="lb-1">
<!-- 轮播内容 -->
<div class="lb-content">
  <% 
List<HashMap> list = new CommDAO().select("select * from mixinfo where infotype='滚动图片'");
int ii = 0;
for(HashMap<String,String> m:list)
{
 %>
  <div class="lb-item <%if(ii==0){%>active<%} %>">
	<a href="<%=m.get("remo") %>">
	  <img src="/travelopr/upfile/<%=m.get("filename") %>" alt="picture loss">
	  <span><%=m.get("mtitle") %></span>
	</a>
  </div>
    <%ii++;} %>   
</div>
<!-- 轮播标志 -->
<ol class="lb-sign">
  <li class="active">1</li>
  <li>2</li>
  <li>3</li>
  <li>4</li>
</ol>
<!-- 轮播控件 -->
<div class="lb-ctrl left">＜</div>
<div class="lb-ctrl right">＞</div>
</div>
                    	
                    	
                    	
                    	
                    </div>
                
							 
							 
						</div> 
						
						
						
						
						<div class="line">
							<div>旅游线路信息</div>
						</div>
<%  
String sname = request.getParameter("sname")==null?"":request.getParameter("sname");   
String city = request.getParameter("city")==null?"":request.getParameter("city");  
%>
						
						<div class="   " style="width: 100%">
							<form class="search" autocomplete="off" name="f1" action="index.jsp" style="display: inline">
								<div class="form-group" >
									<div style="margin: 0px;font-family: 黑体;font-size: 14px">
									<label style="font-family: 黑体;font-size: 16px;vertical-align: -2px;color: gray" >
									信息搜索: 
									 
									 
										    <input type="text" name="sname"  style="width: 170px;height: 27px;vertical-align: -2px"  placeholder="请输入旅游项目名称" />									
										  
										  	<input type="text" name="city"  style="width: 170px;height: 27px;vertical-align: -2px"  placeholder="请输入旅游城市" />									
										   
											<button   style="height: 27px;vertical-align: -2px">搜索</button>
										 
									</div>
								</div> 
							</form>								
						</div>
						
						
						
						   <div class="row">
						   
						    
								 <table width="100%">
								  <tr>
<%  
int i = 0;
HashMap<String,String> selectmap = new HashMap();
HashMap<String,String> selectymap = new HashMap();
HashMap<String,String> selectbmap = new HashMap(); 
String sql = "";
  selectmap.put("sname","");  
  selectmap.put("city","");  
sql = Info.selectBuild3("pros",selectmap,selectymap,selectbmap,request) ; 
 
String url = "index.jsp?1=1&sname="+sname; 
ArrayList<HashMap> list5 = PageManager.getPages(url,9, sql, request ); 
//ArrayList<HashMap> list = (ArrayList<HashMap>)PageManager.getPages(request); 
 
for(HashMap map:list5){ 
i++;
%>
  <td  >
<article  class="article col-md-12"  >
	<div class="inner">
		<figure>
			<a href="pre.jsp?itype=1&id=<%=map.get("id") %>">
				<img src="/travelopr/upfile/<%=map.get("filename") %>" height="181" width="246" alt="Sample Article">
			</a>
		</figure>
		<div class="padding">
			<div class="detail">
				<div class="time"><%=map.get("city") %></div>
				<div class="category"><a href="pre.jsp?itype=1&id=<%=map.get("id") %>">导游 : <%=map.get("guide") %></a></div>
			</div>
			<h2><a href="pre.jsp?itype=1&id=<%=map.get("id") %>"><%=map.get("sname") %></a></h2>
			基础费用 : <%=map.get("tprice") %>
			 
			 
		</div>
	</div>
</article>
</td>

<%
if(i%3==0){
 %>
</tr><tr>
<%} %>

<%} %>
 


</tr>


<tr><td height="28" align="center" colspan="3">${page.info }</td></tr>
			 
			 </table>
	 
	
	
</div>
						
						
						 
						 
					</div>
					<div class="col-xs-6 col-md-4 sidebar" id="sidebar">
						<div class="sidebar-title for-tablet">Sidebar</div>
						<aside>
							<div class="aside-body">
								<div class="featured-author">
									<div class="featured-author-inner">
										 
										<div class="featured-author-body">
											  
											<div class="block">
												 <h2 style="font-size: 18px">站内公告</h2>
												<div class="block-body" style="font-family: 黑体;font-size: 16px">
												 <%=new CommDAO().getmap("7","mixinfo").get("content").toString().replaceAll("<p>","").replaceAll("</p>","") %>
												</div>
											</div>
											 
										</div>
									</div>
								</div>
							</div>
						</aside>
						<aside>
							<h1 class="aside-title">优惠活动 </h1>
							<div class="aside-body">
							<%
							List<HashMap> list2 = new CommDAO().select("select * from hbnews where itype='优惠活动' order by id desc",1,5);
							for(HashMap<String,String> m:list2)
							{
							 %>
								<article  class="article-mini" >
									<div class="inner">
										<figure>
											<a href="newsx.jsp?id=<%=m.get("id")%>">
												<img src="/travelopr/upfile/<%=m.get("filename") %>" alt="Sample Article">
											</a>
										</figure>
										<div class="padding"  >
											<h1 style="line-height: 25px"><a href="newsx.jsp?id=<%=m.get("id")%>"><%=m.get("title") %></a></h1>
										</div>
										<div class="padding" style="line-height: 25px">
											 <%=m.get("savetime") %> 
										</div>
									</div>
								</article>
								 <%} %>    
							</div>
						</aside>
						
						
						
						
						
						<aside style="margin-top: -20px">
							<h1 class="aside-title">旅游资讯 </h1>
							<div class="aside-body" >
							<%
							List<HashMap> list3 = new CommDAO().select("select * from hbnews where itype='旅游资讯' order by id desc",1,5);
							for(HashMap<String,String> m:list3)
							{
							 %>
								<article  class="article-mini" >
									<div class="inner">
										<figure>
											<a href="newsx.jsp?id=<%=m.get("id")%>">
												<img src="/travelopr/upfile/<%=m.get("filename") %>"  alt="Sample Article">
											</a>
										</figure>
										<div class="padding"  >
											<h1 style="line-height: 25px"><a href="newsx.jsp?id=<%=m.get("id")%>"><%=m.get("title") %></a></h1>
										</div>
										<div class="padding" style="line-height: 25px">
											 <%=m.get("savetime") %> 
										</div>
									</div>
								</article>
								 <%} %>    
							</div>
						</aside>
						
						
						
						
						
						 
					</div>
				</div>
			</div>
		</section>
 
    <jsp:include page="foot.jsp"></jsp:include>
	</body>
</html>
<% 
HashMap mmm = new HashMap();  
mmm.put("sname",sname);  
mmm.put("city",city);  
%>
<%=Info.tform(mmm)%> 


 
            