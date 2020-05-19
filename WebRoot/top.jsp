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
HashMap<String,String> user = Info.getUser(request);
 %>
			
			
<header class=" ">
			<div class="firstbar"> 
			<div class="container">
            
            
            
                   <div style="width: 100%;text-align: right;margin-top: 5px"> 
         <marquee behavior="scroll" direction="left" scrollamount="2"  style="width: 600px;float: left" ONMOUSEOUT="this.start();"  ONMOUSEOVER="this.stop()" >
		   <%=new CommDAO().getmap("16","mixinfo").get("content").toString().replaceAll("<p>","").replaceAll("</p>","") %>
		    </marquee> 
                   <div id="time" style="display: inline"></div>
					<script type="text/javascript">
					function time(){
					var vWeek,vWeek_s,vDay;
					vWeek = ["星期天","星期一","星期二","星期三","星期四","星期五","星期六"];
					var date =  new Date();
					year = date.getFullYear();
					month = date.getMonth() + 1;
					day = date.getDate();
					hours = date.getHours();
					minutes = date.getMinutes();
					seconds = date.getSeconds();
					vWeek_s = date.getDay();
					document.getElementById("time").innerHTML = "<font face='宋体'>"+year + "年" + month + "月" + day + "日" + "\t" + hours + ":" + minutes +":" + seconds + "\t" + vWeek[vWeek_s]+"</font>" ;
					
					};
					setInterval("time()",1000);
					
					</script>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    
                   <%
                   if(user==null){
                    %>
                         <a href="/travelopr/regedit.jsp">
                         <font color="black"   style="font-size: 13px">用户注册</font> 
                         </a>
                         &nbsp;|&nbsp; 
                         <a href="/travelopr/login.jsp">
                         <font color="black"   style="font-size: 13px">用户登录</font>  
                         </a>
                         <%}else{ %>
                        
					<font color=gray  >
				          欢迎 : <%=user.get("uname") %>
									- <%=user.get("tname") %> &nbsp; ( <%=user.get("utype") %> ) 
									 
					 &nbsp;&nbsp; <a href="/travelopr/index.jsp?z=z">[注销] </a> 
					 </font>
					 <%} %>
					
					
					<table style="border: 0px;margin-bottom: 0px"><tr><td height=5 style="border: 0px"></td></tr></table>
					
					
					<table style="border: 0px;margin-bottom: 0px" width="100%">
					<tr>
					<td height=50 style="border: 0px">
					  <div class="column" style="display: inline;text-align: left"  >
                       <div class="logo"> 
                        <a href="/travelopr/index.jsp">
                           <font style="font-size: 21px" face="黑体" color="black">旅游管理系统</font>
                        </a>  
                       </div> 
                    </div>
					</td>
					<td align="right" width="85%">
					<font style="font-size: 14px;display: inline">
					 
					  <%
                   if(user!=null){
                    %>
                     
					 
					   <%if(user.get("utype").equals("用户")){ %>
                    <a href="/travelopr/admin/uorderscx.jsp"><font color="gray">我的预定</font></a>  
                    |
					<a href="/travelopr/admin/articlecx.jsp"><font color="gray">我的游记</font></a> 
					 <%} %>  
					  
                    <%if(user.get("utype").equals("管理员")){ %>
                    
                    <a href="/travelopr/admin/proscx.jsp"><font color="gray">路线管理</font></a>
					|
					<a href="/travelopr/admin/aorderscx.jsp"><font color="gray">预订受理</font></a>
					|
					<a href="/travelopr/admin/tgroupcx.jsp"><font color="gray">团队管理</font></a>
					| 
					<a href="/travelopr/admin/pinluncx.jsp"><font color="gray">评论管理</font></a>
					|
					<a href="/travelopr/admin/sarticlecx.jsp"><font color="gray">游记管理</font></a>
					 | 
					 <a href="/travelopr/admin/guidescx.jsp"><font color="gray">导游管理</font></a>
				 |
				  <a href="/travelopr/admin/hbnewscx.jsp"><font color="gray">站内资讯</font></a>
					 <table><tr><td height=0></td></tr></table>
                   
					
                    <a href="/travelopr/admin/gmixinfocx.jsp"><font color="gray">滚动图片</font></a>
					|
					<a href="/travelopr/admin/messagescx.jsp"><font color="gray">留言板</font></a>
					|
                    <a href="/travelopr/admin/zmixinfocx.jsp"><font color="gray">网站信息</font></a>
					| 
					<a href="/travelopr/admin/hysysusercx.jsp"><font color="gray">用户管理</font></a>
					|  
					<a href="/travelopr/admin/sysusercx.jsp"><font color="gray">管理员信息</font></a> 
					 <%} %>  
					 
					 &nbsp;| 
					<a href="/travelopr/admin/psysuserxg.jsp"><font  color="gray">个人信息</font></a>
					|
					<a href="/travelopr/admin/uppass.jsp"><font  color="gray">修改密码</font></a> 
                     
                     <%} %>
                     </font>
					
					 </td></tr></table>
                     
                      
                    </div>
                     
                     
                     
             
                  
                  
            </div> 
			</div>
			
			 
			

			<!-- Start nav -->
			<nav class="menu">
				<div class="container">
					<div class="brand">
						<a href="#">
							<img src="/travelopr/frontfiles/images/logo.png" alt="Magz Logo">
						</a>
					</div>
					<div class="mobile-toggle">
						<a href="#" data-toggle="menu" data-target="#menu-list"><i class="ion-navicon-round"></i></a>
					</div>
					<div class="mobile-toggle">
						<a href="#" data-toggle="sidebar" data-target="#sidebar"><i class="ion-ios-arrow-left"></i></a>
					</div>
					<div id="menu-list">
						<ul class="nav-list"> 
							<li><a href="/travelopr/index.jsp">首页</a></li>
							<li ><a href="/travelopr/sitex.jsp?id=4">网站简介  </a></li>
							<li ><a href="/travelopr/news.jsp">站内资讯  </a></li> 
							<li ><a href="/travelopr/art.jsp">网友游记  </a></li> 
							<li ><a href="/travelopr/sitex.jsp?id=6">联系我们  </a></li>
							<li ><a href="/travelopr/message.jsp">留言板  </a></li> 
						</ul>
					</div>
				</div>
			</nav>
			<!-- End nav -->
		</header>
		
		
		
		
<style>
 
.table5,  .table5 td {
    border: 0.5px solid #F8E8E9;
    border-collapse: collapse;
    padding: 5px;
    font-size: 15px; 
}
 
 select{
  height: 27px;
 }

</style>


 


<link rel="stylesheet" type="text/css" href="/travelopr/frontfiles/css/flexslider.css" media="screen" />
		<!-- Bootstrap -->
		<link rel="stylesheet" href="/travelopr/frontfiles/scripts/bootstrap/bootstrap.min.css">
		<!-- IonIcons -->
		<link rel="stylesheet" href="/travelopr/frontfiles/scripts/ionicons/css/ionicons.min.css">
		<!-- Toast -->
		<link rel="stylesheet" href="/travelopr/frontfiles/scripts/toast/jquery.toast.min.css">
		<!-- OwlCarousel -->
		<link rel="stylesheet" href="/travelopr/frontfiles/scripts/owlcarousel/dist/assets/owl.carousel.min.css">
		<link rel="stylesheet" href="/travelopr/frontfiles/scripts/owlcarousel/dist/assets/owl.theme.default.min.css">
		<!-- Magnific Popup -->
		<link rel="stylesheet" href="/travelopr/frontfiles/scripts/magnific-popup/dist/magnific-popup.css">
		<link rel="stylesheet" href="/travelopr/frontfiles/scripts/sweetalert/dist/sweetalert.css">
		<!-- Custom style -->
		<link rel="stylesheet" href="/travelopr/frontfiles/css/style.css">
		<link rel="stylesheet" href="/travelopr/frontfiles/css/skins/all.css">
		<link rel="stylesheet" href="/travelopr/frontfiles/css/demo.css">
		<script type="text/javascript" src="/travelopr/frontfiles/js/flexslider-min.js"></script>
		<script type="text/javascript" src="/travelopr/frontfiles/js/1.8.2.min.js"></script>
		<link rel="stylesheet" href="/travelopr/frontfiles/slider/lb.css">
        <script src="/travelopr/frontfiles/slider/lb.js"></script>
        <script>
			window.onload = function () {
			  // 轮播选项
			  const options = {
				id: 'lb-1',              // 轮播盒ID
				speed: 600,              // 轮播速度(ms)
				delay: 3000,             // 轮播延迟(ms)
				direction: 'left',       // 图片滑动方向
				moniterKeyEvent: true,   // 是否监听键盘事件
				moniterTouchEvent: true  // 是否监听屏幕滑动事件
			  }
			  const lb = new Lb(options);
			  lb.start();
			}
			</script>
