package control;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.context.request.ServletWebRequest;

import com.alibaba.fastjson.JSONObject;

import dao.CommDAO;

import service.*;
import util.Info;
import util.PageManager;
import util.StrUtil;
import entity.*;
 
@Controller
@RequestMapping("/travelopr")
public class SysController {
    
     String date = Info.getDateStr();
     CommDAO cdao = new CommDAO();
     CommDAO dao = new CommDAO();
     
     @Autowired 
     public ArticleService articleService; 
     @Autowired 
     public GuidesService guidesService; 
     @Autowired 
     public HbnewsService hbnewsService; 
     @Autowired 
     public MessagesService messagesService; 
     @Autowired 
     public MixinfoService mixinfoService; 
     @Autowired 
     public OrdersService ordersService; 
     @Autowired 
     public PinlunService pinlunService; 
     @Autowired 
     public ProsService prosService; 
     @Autowired 
     public SysuserService sysuserService; 
     @Autowired 
     public TgroupService tgroupService; 
  

     //login.jsp请求处理开始
     @RequestMapping("/login")
     public String login(HttpServletRequest request,HttpServletResponse response,HttpSession session)throws Exception{
    	 String pagerandom = request.getParameter("pagerandom")==null?"":request.getParameter("pagerandom");
			String random = (String)request.getSession().getAttribute("random");
			if(!pagerandom.equals(random)&&request.getParameter("a")!=null)
			{ 
				request.setAttribute("random", "");
				go("/login.jsp", request, response);
			}
			else{ 
			String username = request.getParameter("uname");
			String password = request.getParameter("upass");
			String utype = request.getParameter("utype");
			request.getSession().setAttribute("utype", utype);
			HashMap<String, String> pmap = new HashMap<String, String>();
			pmap.put("tablename","sysuser a ");
			pmap.put("uname",username); 
			pmap.put("upass",password); 
			pmap.put("utype",utype); 
			pmap.put("status","正常");
			pmap.put("orderby"," a.id desc  "); 
				List<HashMap> list = cdao.selectByParam(request,pmap);
				if (list.size() == 1) {
					HashMap map = list.get(0);
					List<HashMap> ulist = cdao.selectByParam(request,pmap); 
					if (ulist.size() == 1&& password.equals(map.get("upass").toString())) { 
							request.getSession().setAttribute("admin", map); 
							gor("/travelopr/index.jsp", request, response); 
					} else {
						request.setAttribute("error", "");
						go("/login.jsp", request, response);
					}
				} else {
					request.setAttribute("error", "");
					go("/login.jsp", request, response);
				}
			}  
     return null;
     }
     //login.jsp请求处理结束
 

      //regedit.jsp请求处理开始
      @RequestMapping("/regedit")
      public String regedit(HttpServletRequest request,HttpServletResponse response,HttpSession session)throws Exception{
      HashMap<String,String> user = (HashMap<String,String>)session.getAttribute("admin");
      HashMap<String, String> map = new HashMap<String, String>();
      String uname = request.getParameter("uname")==null?"":request.getParameter("uname");
      String upass = request.getParameter("upass")==null?"":request.getParameter("upass");
      String tname = request.getParameter("tname")==null?"":request.getParameter("tname");
      String sfid = request.getParameter("sfid")==null?"":request.getParameter("sfid");
      String sex = request.getParameter("sex")==null?"":request.getParameter("sex");
      String birth = request.getParameter("birth")==null?"":request.getParameter("birth");
      String tel = request.getParameter("tel")==null?"":request.getParameter("tel");
      String addrs = request.getParameter("addrs")==null?"":request.getParameter("addrs");
      String email = request.getParameter("email")==null?"":request.getParameter("email");
      String utype = request.getParameter("utype")==null?"":request.getParameter("utype");
      String savetime = date;
      String filename = request.getParameter("filename")==null?"":request.getParameter("filename"); 
      String status = "新用户";
      map.put("uname",uname);
      map.put("upass",upass);
      map.put("tname",tname);
      map.put("sfid",sfid);
      map.put("sex",sex);
      map.put("birth",birth);
      map.put("tel",tel);
      map.put("addrs",addrs);
      map.put("email",email);
      map.put("savetime",savetime);
      map.put("filename",filename);
      map.put("utype",utype);
      map.put("status",status);
      sysuserService.insert(map);
      request.getSession().setAttribute("suc", "suc");
      response.sendRedirect("/travelopr/regedit.jsp");
      return null;
      }
      //regedit.jsp请求处理结束
 

      //hysysusertj.jsp请求处理开始
      @RequestMapping("/hysysusertj")
      public String hysysusertj(HttpServletRequest request,HttpServletResponse response,HttpSession session)throws Exception{
      HashMap<String,String> user = (HashMap<String,String>)session.getAttribute("admin");
      HashMap<String, String> map = new HashMap<String, String>();
      String uname = request.getParameter("uname")==null?"":request.getParameter("uname");
      String upass = request.getParameter("upass")==null?"":request.getParameter("upass");
      String tname = request.getParameter("tname")==null?"":request.getParameter("tname");
      String tnamekey = cdao.getID("sysuser","tname","","",tname);
      String sfid = request.getParameter("sfid")==null?"":request.getParameter("sfid");
      String sex = request.getParameter("sex")==null?"":request.getParameter("sex");
      String birth = request.getParameter("birth")==null?"":request.getParameter("birth");
      String tel = request.getParameter("tel")==null?"":request.getParameter("tel");
      String addrs = request.getParameter("addrs")==null?"":request.getParameter("addrs");
      String email = request.getParameter("email")==null?"":request.getParameter("email");
      String savetime = date;
      String filename = request.getParameter("filename")==null?"":request.getParameter("filename");
      String utype = "用户";
      String status = "正常";
      map.put("uname",uname);
      map.put("upass",upass);
      map.put("tname",tname);
      map.put("sfid",sfid);
      map.put("sex",sex);
      map.put("birth",birth);
      map.put("tel",tel);
      map.put("addrs",addrs);
      map.put("email",email);
      map.put("savetime",savetime);
      map.put("filename",filename);
      map.put("utype",utype);
      map.put("status",status);
      map.put("tnamekey",tnamekey);
      sysuserService.insert(map);
      request.getSession().setAttribute("suc", "suc");
      response.sendRedirect("/travelopr/admin/hysysusertj.jsp");
      return null;
      }
      //hysysusertj.jsp请求处理结束

     //hysysuserxg.jsp请求处理开始
     @RequestMapping("/hysysuserxg")
     public String hysysuserxg(HttpServletRequest request,HttpServletResponse response,HttpSession session)throws Exception{
     HashMap<String,String> user = (HashMap<String,String>)session.getAttribute("admin");
     String id =  request.getParameter("id");
     HashMap<String, String> map = new HashMap<String, String>();
     String uname = request.getParameter("uname")==null?"":request.getParameter("uname");
     String upass = request.getParameter("upass")==null?"":request.getParameter("upass");
     String tname = request.getParameter("tname")==null?"":request.getParameter("tname");
     String tnamekey = cdao.getID("sysuser","tname","","",tname);
     String sfid = request.getParameter("sfid")==null?"":request.getParameter("sfid");
     String sex = request.getParameter("sex")==null?"":request.getParameter("sex");
     String birth = request.getParameter("birth")==null?"":request.getParameter("birth");
     String tel = request.getParameter("tel")==null?"":request.getParameter("tel");
     String addrs = request.getParameter("addrs")==null?"":request.getParameter("addrs");
     String email = request.getParameter("email")==null?"":request.getParameter("email");
     String filename = request.getParameter("filename")==null?"":request.getParameter("filename");
     map.put("uname",uname);
     map.put("upass",upass);
     map.put("tname",tname);
     map.put("tnamekey",tnamekey);
     map.put("sfid",sfid);
     map.put("sex",sex);
     map.put("birth",birth);
     map.put("tel",tel);
     map.put("addrs",addrs);
     map.put("email",email);
     map.put("filename",filename);
     map.put("id",id);
     sysuserService.update(map);
     request.getSession().setAttribute("suc", "suc");
     response.sendRedirect("/travelopr/admin/hysysuserxg.jsp?id="+id+"");
     return null;
     }
     //hysysuserxg.jsp请求处理结束

      //sysusertj.jsp请求处理开始
      @RequestMapping("/sysusertj")
      public String sysusertj(HttpServletRequest request,HttpServletResponse response,HttpSession session)throws Exception{
      HashMap<String,String> user = (HashMap<String,String>)session.getAttribute("admin");
      HashMap<String, String> map = new HashMap<String, String>();
      String uname = request.getParameter("uname")==null?"":request.getParameter("uname");
      String upass = request.getParameter("upass")==null?"":request.getParameter("upass");
      String tname = request.getParameter("tname")==null?"":request.getParameter("tname");
      String tnamekey = cdao.getID("sysuser","tname","","",tname);
      String sfid = request.getParameter("sfid")==null?"":request.getParameter("sfid");
      String sex = request.getParameter("sex")==null?"":request.getParameter("sex");
      String birth = request.getParameter("birth")==null?"":request.getParameter("birth");
      String tel = request.getParameter("tel")==null?"":request.getParameter("tel");
      String addrs = request.getParameter("addrs")==null?"":request.getParameter("addrs");
      String email = request.getParameter("email")==null?"":request.getParameter("email");
      String savetime = date;
      String filename = request.getParameter("filename")==null?"":request.getParameter("filename");
      String utype = "管理员";
      String status = "正常";
      map.put("uname",uname);
      map.put("upass",upass);
      map.put("tname",tname);
      map.put("sfid",sfid);
      map.put("sex",sex);
      map.put("birth",birth);
      map.put("tel",tel);
      map.put("addrs",addrs);
      map.put("email",email);
      map.put("savetime",savetime);
      map.put("filename",filename);
      map.put("utype",utype);
      map.put("status",status);
      map.put("tnamekey",tnamekey);
      sysuserService.insert(map);
      request.getSession().setAttribute("suc", "suc");
      response.sendRedirect("/travelopr/admin/sysusertj.jsp");
      return null;
      }
      //sysusertj.jsp请求处理结束

     //sysuserxg.jsp请求处理开始
     @RequestMapping("/sysuserxg")
     public String sysuserxg(HttpServletRequest request,HttpServletResponse response,HttpSession session)throws Exception{
     HashMap<String,String> user = (HashMap<String,String>)session.getAttribute("admin");
     String id =  request.getParameter("id");
     HashMap<String, String> map = new HashMap<String, String>();
     String uname = request.getParameter("uname")==null?"":request.getParameter("uname");
     String upass = request.getParameter("upass")==null?"":request.getParameter("upass");
     String tname = request.getParameter("tname")==null?"":request.getParameter("tname");
     String tnamekey = cdao.getID("sysuser","tname","","",tname);
     String sfid = request.getParameter("sfid")==null?"":request.getParameter("sfid");
     String sex = request.getParameter("sex")==null?"":request.getParameter("sex");
     String birth = request.getParameter("birth")==null?"":request.getParameter("birth");
     String tel = request.getParameter("tel")==null?"":request.getParameter("tel");
     String addrs = request.getParameter("addrs")==null?"":request.getParameter("addrs");
     String email = request.getParameter("email")==null?"":request.getParameter("email");
     String filename = request.getParameter("filename")==null?"":request.getParameter("filename");
     map.put("uname",uname);
     map.put("upass",upass);
     map.put("tname",tname);
     map.put("tnamekey",tnamekey);
     map.put("sfid",sfid);
     map.put("sex",sex);
     map.put("birth",birth);
     map.put("tel",tel);
     map.put("addrs",addrs);
     map.put("email",email);
     map.put("filename",filename);
     map.put("id",id);
     sysuserService.update(map);
     request.getSession().setAttribute("suc", "suc");
     response.sendRedirect("/travelopr/admin/sysuserxg.jsp?id="+id+"");
     return null;
     }
     //sysuserxg.jsp请求处理结束

     //psysuserxg.jsp请求处理开始
     @RequestMapping("/psysuserxg")
     public String psysuserxg(HttpServletRequest request,HttpServletResponse response,HttpSession session)throws Exception{
     HashMap<String,String> user = (HashMap<String,String>)session.getAttribute("admin");
     String id =  request.getParameter("id");
     HashMap<String, String> map = new HashMap<String, String>();
     String tname = request.getParameter("tname")==null?"":request.getParameter("tname");
     String tnamekey = cdao.getID("sysuser","tname","","",tname);
     String sfid = request.getParameter("sfid")==null?"":request.getParameter("sfid");
     String sex = request.getParameter("sex")==null?"":request.getParameter("sex");
     String birth = request.getParameter("birth")==null?"":request.getParameter("birth");
     String tel = request.getParameter("tel")==null?"":request.getParameter("tel");
     String addrs = request.getParameter("addrs")==null?"":request.getParameter("addrs");
     String email = request.getParameter("email")==null?"":request.getParameter("email");
     String filename = request.getParameter("filename")==null?"":request.getParameter("filename");
     map.put("tname",tname);
     map.put("tnamekey",tnamekey);
     map.put("sfid",sfid);
     map.put("sex",sex);
     map.put("birth",birth);
     map.put("tel",tel);
     map.put("addrs",addrs);
     map.put("email",email);
     map.put("filename",filename);
     map.put("id",id);
     sysuserService.update(map);
     request.getSession().setAttribute("suc", "suc");
     response.sendRedirect("/travelopr/admin/psysuserxg.jsp?id="+id+"");
     return null;
     }
     //psysuserxg.jsp请求处理结束

     //zmixinfoxg.jsp请求处理开始
     @RequestMapping("/zmixinfoxg")
     public String zmixinfoxg(HttpServletRequest request,HttpServletResponse response,HttpSession session)throws Exception{
     HashMap<String,String> user = (HashMap<String,String>)session.getAttribute("admin");
     String id =  request.getParameter("id");
     HashMap<String, String> map = new HashMap<String, String>();
     String content = request.getParameter("content")==null?"":request.getParameter("content");
     content = content.replaceAll("'"," ");
     map.put("content",content);
     map.put("id",id);
     mixinfoService.update(map);
     request.getSession().setAttribute("suc", "suc");
     response.sendRedirect("/travelopr/admin/zmixinfoxg.jsp?id="+id+"");
     return null;
     }
     //zmixinfoxg.jsp请求处理结束

     //messagesxg.jsp请求处理开始
     @RequestMapping("/messagesxg")
     public String messagesxg(HttpServletRequest request,HttpServletResponse response,HttpSession session)throws Exception{
     HashMap<String,String> user = (HashMap<String,String>)session.getAttribute("admin");
     String id =  request.getParameter("id");
     HashMap<String, String> map = new HashMap<String, String>();
     String recont = request.getParameter("recont")==null?"":request.getParameter("recont");
     map.put("recont",recont);
     map.put("id",id);
     messagesService.update(map);
     request.getSession().setAttribute("suc", "suc");
     response.sendRedirect("/travelopr/admin/messagesxg.jsp?id="+id+"");
     return null;
     }
     //messagesxg.jsp请求处理结束

     //gmixinfoxg.jsp请求处理开始
     @RequestMapping("/gmixinfoxg")
     public String gmixinfoxg(HttpServletRequest request,HttpServletResponse response,HttpSession session)throws Exception{
     HashMap<String,String> user = (HashMap<String,String>)session.getAttribute("admin");
     String id =  request.getParameter("id");
     HashMap<String, String> map = new HashMap<String, String>();
     String mtitle = request.getParameter("mtitle")==null?"":request.getParameter("mtitle");
     String remo = request.getParameter("remo")==null?"":request.getParameter("remo");
     String filename = request.getParameter("filename")==null?"":request.getParameter("filename");
     map.put("mtitle",mtitle);
     map.put("remo",remo);
     map.put("filename",filename);
     map.put("id",id);
     mixinfoService.update(map);
     request.getSession().setAttribute("suc", "suc");
     response.sendRedirect("/travelopr/admin/gmixinfoxg.jsp?id="+id+"");
     return null;
     }
     //gmixinfoxg.jsp请求处理结束

      //hbnewstj.jsp请求处理开始
      @RequestMapping("/hbnewstj")
      public String hbnewstj(HttpServletRequest request,HttpServletResponse response,HttpSession session)throws Exception{
      HashMap<String,String> user = (HashMap<String,String>)session.getAttribute("admin");
      HashMap<String, String> map = new HashMap<String, String>();
      String title = request.getParameter("title")==null?"":request.getParameter("title");
      String itype = request.getParameter("itype")==null?"":request.getParameter("itype");
      String savetime = date;
      String filename = request.getParameter("filename")==null?"":request.getParameter("filename");
      String content = request.getParameter("content")==null?"":request.getParameter("content");
      content = content.replaceAll("'"," ");
      map.put("title",title);
      map.put("itype",itype);
      map.put("savetime",savetime);
      map.put("filename",filename);
      map.put("content",content);
      hbnewsService.insert(map);
      request.getSession().setAttribute("suc", "suc");
      response.sendRedirect("/travelopr/admin/hbnewstj.jsp");
      return null;
      }
      //hbnewstj.jsp请求处理结束

     //hbnewsxg.jsp请求处理开始
     @RequestMapping("/hbnewsxg")
     public String hbnewsxg(HttpServletRequest request,HttpServletResponse response,HttpSession session)throws Exception{
     HashMap<String,String> user = (HashMap<String,String>)session.getAttribute("admin");
     String id =  request.getParameter("id");
     HashMap<String, String> map = new HashMap<String, String>();
     String title = request.getParameter("title")==null?"":request.getParameter("title");
     String itype = request.getParameter("itype")==null?"":request.getParameter("itype");
     String filename = request.getParameter("filename")==null?"":request.getParameter("filename");
     String content = request.getParameter("content")==null?"":request.getParameter("content");
     content = content.replaceAll("'"," ");
     map.put("title",title);
     map.put("itype",itype);
     map.put("filename",filename);
     map.put("content",content);
     map.put("id",id);
     hbnewsService.update(map);
     request.getSession().setAttribute("suc", "suc");
     response.sendRedirect("/travelopr/admin/hbnewsxg.jsp?id="+id+"");
     return null;
     }
     //hbnewsxg.jsp请求处理结束

      //guidestj.jsp请求处理开始
      @RequestMapping("/guidestj")
      public String guidestj(HttpServletRequest request,HttpServletResponse response,HttpSession session)throws Exception{
      HashMap<String,String> user = (HashMap<String,String>)session.getAttribute("admin");
      HashMap<String, String> map = new HashMap<String, String>();
      String gno = request.getParameter("gno")==null?"":request.getParameter("gno");
      String gname = request.getParameter("gname")==null?"":request.getParameter("gname");
      String sex = request.getParameter("sex")==null?"":request.getParameter("sex");
      String tel = request.getParameter("tel")==null?"":request.getParameter("tel");
      map.put("gno",gno);
      map.put("gname",gname);
      map.put("sex",sex);
      map.put("tel",tel);
      guidesService.insert(map);
      request.getSession().setAttribute("suc", "suc");
      response.sendRedirect("/travelopr/admin/guidestj.jsp");
      return null;
      }
      //guidestj.jsp请求处理结束

     //guidesxg.jsp请求处理开始
     @RequestMapping("/guidesxg")
     public String guidesxg(HttpServletRequest request,HttpServletResponse response,HttpSession session)throws Exception{
     HashMap<String,String> user = (HashMap<String,String>)session.getAttribute("admin");
     String id =  request.getParameter("id");
     HashMap<String, String> map = new HashMap<String, String>();
     String gno = request.getParameter("gno")==null?"":request.getParameter("gno");
     String gname = request.getParameter("gname")==null?"":request.getParameter("gname");
     String sex = request.getParameter("sex")==null?"":request.getParameter("sex");
     String tel = request.getParameter("tel")==null?"":request.getParameter("tel");
     map.put("gno",gno);
     map.put("gname",gname);
     map.put("sex",sex);
     map.put("tel",tel);
     map.put("id",id);
     guidesService.update(map);
     request.getSession().setAttribute("suc", "suc");
     response.sendRedirect("/travelopr/admin/guidesxg.jsp?id="+id+"");
     return null;
     }
     //guidesxg.jsp请求处理结束

      //prostj.jsp请求处理开始
      @RequestMapping("/prostj")
      public String prostj(HttpServletRequest request,HttpServletResponse response,HttpSession session)throws Exception{
      HashMap<String,String> user = (HashMap<String,String>)session.getAttribute("admin");
      HashMap<String, String> map = new HashMap<String, String>();
      String sname = request.getParameter("sname")==null?"":request.getParameter("sname");
      String city = request.getParameter("city")==null?"":request.getParameter("city");
      String addrs = request.getParameter("addrs")==null?"":request.getParameter("addrs");
      String tprice = request.getParameter("tprice")==null?"":request.getParameter("tprice");
      String hprice = request.getParameter("hprice")==null?"":request.getParameter("hprice");
      String fprice = request.getParameter("fprice")==null?"":request.getParameter("fprice");
      String jprice = request.getParameter("jprice")==null?"":request.getParameter("jprice");
      String wprice = request.getParameter("wprice")==null?"":request.getParameter("wprice");
      String remo = request.getParameter("remo")==null?"":request.getParameter("remo");
      String guide = request.getParameter("guide")==null?"":request.getParameter("guide");
      String guidekey = cdao.getID("pros","guide","guides","gno~hnoname",guide);
      String savetime = date;
      String filename = request.getParameter("filename")==null?"":request.getParameter("filename");
      map.put("sname",sname);
      map.put("city",city);
      map.put("addrs",addrs);
      map.put("tprice",tprice);
      map.put("hprice",hprice);
      map.put("fprice",fprice);
      map.put("jprice",jprice);
      map.put("wprice",wprice);
      map.put("remo",remo);
      map.put("guide",guide);
      map.put("savetime",savetime);
      map.put("filename",filename);
      map.put("guidekey",guidekey);
      prosService.insert(map);
      request.getSession().setAttribute("suc", "suc");
      response.sendRedirect("/travelopr/admin/prostj.jsp");
      return null;
      }
      //prostj.jsp请求处理结束

     //prosxg.jsp请求处理开始
     @RequestMapping("/prosxg")
     public String prosxg(HttpServletRequest request,HttpServletResponse response,HttpSession session)throws Exception{
     HashMap<String,String> user = (HashMap<String,String>)session.getAttribute("admin");
     String id =  request.getParameter("id");
     HashMap<String, String> map = new HashMap<String, String>();
     String sname = request.getParameter("sname")==null?"":request.getParameter("sname");
     String city = request.getParameter("city")==null?"":request.getParameter("city");
     String addrs = request.getParameter("addrs")==null?"":request.getParameter("addrs");
     String tprice = request.getParameter("tprice")==null?"":request.getParameter("tprice");
     String hprice = request.getParameter("hprice")==null?"":request.getParameter("hprice");
     String fprice = request.getParameter("fprice")==null?"":request.getParameter("fprice");
     String jprice = request.getParameter("jprice")==null?"":request.getParameter("jprice");
     String wprice = request.getParameter("wprice")==null?"":request.getParameter("wprice");
     String remo = request.getParameter("remo")==null?"":request.getParameter("remo");
     String guide = request.getParameter("guide")==null?"":request.getParameter("guide");
     String guidekey = cdao.getID("pros","guide","guides","gno~hnoname",guide);
     String filename = request.getParameter("filename")==null?"":request.getParameter("filename");
     map.put("sname",sname);
     map.put("city",city);
     map.put("addrs",addrs);
     map.put("tprice",tprice);
     map.put("hprice",hprice);
     map.put("fprice",fprice);
     map.put("jprice",jprice);
     map.put("wprice",wprice);
     map.put("remo",remo);
     map.put("guide",guide);
     map.put("guidekey",guidekey);
     map.put("filename",filename);
     map.put("id",id);
     prosService.update(map);
     request.getSession().setAttribute("suc", "suc");
     response.sendRedirect("/travelopr/admin/prosxg.jsp?id="+id+"");
     return null;
     }
     //prosxg.jsp请求处理结束

      //tgrouptj.jsp请求处理开始
      @RequestMapping("/tgrouptj")
      public String tgrouptj(HttpServletRequest request,HttpServletResponse response,HttpSession session)throws Exception{
      HashMap<String,String> user = (HashMap<String,String>)session.getAttribute("admin");
      HashMap<String, String> map = new HashMap<String, String>();
      String gname = request.getParameter("gname")==null?"":request.getParameter("gname");
      String guide = request.getParameter("guide")==null?"":request.getParameter("guide");
      String guidekey = cdao.getID("tgroup","guide","guides","gno~hnoname",guide);
      String sdate = request.getParameter("sdate")==null?"":request.getParameter("sdate");
      String edate = request.getParameter("edate")==null?"":request.getParameter("edate");
      map.put("gname",gname);
      map.put("guide",guide);
      map.put("sdate",sdate);
      map.put("edate",edate);
      map.put("guidekey",guidekey);
      tgroupService.insert(map);
      request.getSession().setAttribute("suc", "suc");
      response.sendRedirect("/travelopr/admin/tgrouptj.jsp");
      return null;
      }
      //tgrouptj.jsp请求处理结束

     //tgroupxg.jsp请求处理开始
     @RequestMapping("/tgroupxg")
     public String tgroupxg(HttpServletRequest request,HttpServletResponse response,HttpSession session)throws Exception{
     HashMap<String,String> user = (HashMap<String,String>)session.getAttribute("admin");
     String id =  request.getParameter("id");
     HashMap<String, String> map = new HashMap<String, String>();
     String gname = request.getParameter("gname")==null?"":request.getParameter("gname");
     String guide = request.getParameter("guide")==null?"":request.getParameter("guide");
     String guidekey = cdao.getID("tgroup","guide","guides","gno~hnoname",guide);
     String sdate = request.getParameter("sdate")==null?"":request.getParameter("sdate");
     String edate = request.getParameter("edate")==null?"":request.getParameter("edate");
     map.put("gname",gname);
     map.put("guide",guide);
     map.put("guidekey",guidekey);
     map.put("sdate",sdate);
     map.put("edate",edate);
     map.put("id",id);
     tgroupService.update(map);
     request.getSession().setAttribute("suc", "suc");
     response.sendRedirect("/travelopr/admin/tgroupxg.jsp?id="+id+"");
     return null;
     }
     //tgroupxg.jsp请求处理结束

      //articletj.jsp请求处理开始
      @RequestMapping("/articletj")
      public String articletj(HttpServletRequest request,HttpServletResponse response,HttpSession session)throws Exception{
      HashMap<String,String> user = (HashMap<String,String>)session.getAttribute("admin");
      HashMap<String, String> map = new HashMap<String, String>();
      String ytitle = request.getParameter("ytitle")==null?"":request.getParameter("ytitle");
      String savetime = date;
      String content = request.getParameter("content")==null?"":request.getParameter("content");
      content = content.replaceAll("'"," ");
      String uname = Info.getUser(request).get("uname").toString();
      map.put("ytitle",ytitle);
      map.put("savetime",savetime);
      map.put("content",content);
      map.put("uname",uname);
      articleService.insert(map);
      request.getSession().setAttribute("suc", "suc");
      response.sendRedirect("/travelopr/admin/articletj.jsp");
      return null;
      }
      //articletj.jsp请求处理结束

     //articlexg.jsp请求处理开始
     @RequestMapping("/articlexg")
     public String articlexg(HttpServletRequest request,HttpServletResponse response,HttpSession session)throws Exception{
     HashMap<String,String> user = (HashMap<String,String>)session.getAttribute("admin");
     String id =  request.getParameter("id");
     HashMap<String, String> map = new HashMap<String, String>();
     String ytitle = request.getParameter("ytitle")==null?"":request.getParameter("ytitle");
     String content = request.getParameter("content")==null?"":request.getParameter("content");
     content = content.replaceAll("'"," ");
     map.put("ytitle",ytitle);
     map.put("content",content);
     map.put("id",id);
     articleService.update(map);
     request.getSession().setAttribute("suc", "suc");
     response.sendRedirect("/travelopr/admin/articlexg.jsp?id="+id+"");
     return null;
     }
     //articlexg.jsp请求处理结束

//--业务层代码块结束--
 
    public void go(String url,HttpServletRequest request, HttpServletResponse response)
	{
	try {
		request.getRequestDispatcher(url).forward(request, response);
	} catch (Exception e) {
		e.printStackTrace();
	}
	}
	
	public void gor(String url,HttpServletRequest request, HttpServletResponse response)
	{
		try {
			response.sendRedirect(url);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	}
    
}