package control;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUpload;
import org.apache.commons.fileupload.RequestContext;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.servlet.ServletRequestContext;


import util.Info;
import util.StrUtil;

import dao.CommDAO;

public class MainCtrl extends HttpServlet {

    public MainCtrl() {
        super();
    }

    public void destroy() {
        super.destroy(); // Just puts "destroy" string in log
        // Put your code here
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        this.doPost(request, response);
    }

    public void go(String url, HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher(url).forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void gor(String url, HttpServletRequest request, HttpServletResponse response) {
        try {
            response.sendRedirect(url);
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String ac = request.getParameter("ac");
        if (ac == null) ac = "";
        CommDAO dao = new CommDAO();
        String date = Info.getDateStr();
        String today = date.substring(0, 10);
        String tomonth = date.substring(0, 7);
        HttpSession session = request.getSession();

        if (ac.equals("compl")) {
            String touname = request.getParameter("touname") == null ? "" : request.getParameter("touname");
            String sname = request.getParameter("sname") == null ? "" : request.getParameter("sname");
            String ctype = request.getParameter("ctype") == null ? "" : request.getParameter("ctype");
            String message = request.getParameter("message") == null ? "" : request.getParameter("message");
            String bid = request.getParameter("bid") == null ? "" : request.getParameter("bid");
            String savetime = date;
            String uname = Info.getUser(request).get("uname").toString();
            String sql = "insert into compl(sname,touname,ctype,message,bid,savetime,uname " +
                    ")values('" + sname + "','" + touname + "','" + ctype + "','" + message + "','" + bid + "','" + savetime + "','" + uname + "')";
            dao.commOper(sql);
            session.setAttribute("suc", "suc");
            response.sendRedirect("/travelopr/pre.jsp?id=" + bid);
        }


        if (ac.equals("login")) {
            String pagerandom = request.getParameter("pagerandom") == null ? "" : request.getParameter("pagerandom");
            String random = (String) request.getSession().getAttribute("random");
            if (!pagerandom.equals(random) && request.getParameter("a") != null) {
                request.setAttribute("random", "");
                go("/login.jsp", request, response);
            } else {
                String username = request.getParameter("uname");
                String password = request.getParameter("upass");
                String utype = request.getParameter("utype");
                request.getSession().setAttribute("utype", utype);
                List<HashMap> list = dao
                        .select("select * from sysuser where uname='"
                                + username + "' and status='正常'");
                if (list.size() == 1) {
                    HashMap map = list.get(0);
                    List<HashMap> ulist = dao
                            .select("select * from sysuser where utype='" + utype + "' and uname='"
                                    + username + "' and upass='" + password
                                    + "' and status='正常' ");

                    if (ulist.size() == 1 && password.equals(map.get("upass").toString())) {

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
        }


        //修改密码
        if (ac.equals("uppass")) {
            String userpass = request.getParameter("upass");
            String copyuserpass = request.getParameter("copyuserpass");
            HashMap user = dao.getmap(Info.getUser(request).get("id").toString(), "sysuser");
            String id = (String) user.get("id");
            String sql = "update sysuser set upass='" + userpass + "' where id=" + id;
            dao.commOper(sql);
            request.setAttribute("suc", "");
            go("/admin/uppass.jsp", request, response);
        }


        if (ac.equals("uploaddoc")) {
            try {
                String filename = "";
                request.setCharacterEncoding("utf-8");
                RequestContext requestContext = new ServletRequestContext(request);
                if (FileUpload.isMultipartContent(requestContext)) {

                    DiskFileItemFactory factory = new DiskFileItemFactory();
                    factory.setRepository(new File(request.getRealPath("/upfile/") + "/"));
                    ServletFileUpload upload = new ServletFileUpload(factory);
                    upload.setSizeMax(100 * 1024 * 1024);
                    List items = new ArrayList();

                    items = upload.parseRequest(request);

                    FileItem fileItem = (FileItem) items.get(0);
                    if (fileItem.getName() != null && fileItem.getSize() != 0) {
                        if (fileItem.getName() != null && fileItem.getSize() != 0) {
                            File fullFile = new File(fileItem.getName());
                            filename = Info.generalFileName(fullFile.getName());
                            File newFile = new File(request.getRealPath("/upfile/") + "/" + filename);
                            try {
                                fileItem.write(newFile);
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        } else {
                        }
                    }
                }

                gor("/travelopr/js/uploaddoc.jsp?docname=" + filename, request, response);
            } catch (Exception e1) {
                e1.printStackTrace();
            }
        }


        if (ac.equals("uploaddoc2")) {
            try {
                String filename = "";
                request.setCharacterEncoding("utf-8");
                RequestContext requestContext = new ServletRequestContext(request);
                if (FileUpload.isMultipartContent(requestContext)) {

                    DiskFileItemFactory factory = new DiskFileItemFactory();
                    factory.setRepository(new File(request.getRealPath("/upfile/") + "/"));
                    ServletFileUpload upload = new ServletFileUpload(factory);
                    upload.setSizeMax(100 * 1024 * 1024);
                    List items = new ArrayList();

                    items = upload.parseRequest(request);

                    FileItem fileItem = (FileItem) items.get(0);
                    if (fileItem.getName() != null && fileItem.getSize() != 0) {
                        if (fileItem.getName() != null && fileItem.getSize() != 0) {
                            File fullFile = new File(fileItem.getName());
                            filename = Info.generalFileName(fullFile.getName());
                            File newFile = new File(request.getRealPath("/upfile/") + "/" + filename);
                            try {
                                fileItem.write(newFile);
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        } else {
                        }
                    }
                }

                go("/travelopr/js/uploaddoc2.jsp?docname=" + filename, request, response);
            } catch (Exception e1) {
                e1.printStackTrace();
            }
        }


        if (ac.equals("uploaddoc3")) {
            try {
                String filename = "";
                request.setCharacterEncoding("utf-8");
                RequestContext requestContext = new ServletRequestContext(request);
                if (FileUpload.isMultipartContent(requestContext)) {

                    DiskFileItemFactory factory = new DiskFileItemFactory();
                    factory.setRepository(new File(request.getRealPath("/upfile/") + "/"));
                    ServletFileUpload upload = new ServletFileUpload(factory);
                    upload.setSizeMax(100 * 1024 * 1024);
                    List items = new ArrayList();

                    items = upload.parseRequest(request);

                    FileItem fileItem = (FileItem) items.get(0);
                    if (fileItem.getName() != null && fileItem.getSize() != 0) {
                        if (fileItem.getName() != null && fileItem.getSize() != 0) {
                            File fullFile = new File(fileItem.getName());
                            filename = Info.generalFileName(fullFile.getName());
                            File newFile = new File(request.getRealPath("/upfile/") + "/" + filename);
                            try {
                                fileItem.write(newFile);
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        } else {
                        }
                    }
                }

                go("/travelopr/js/uploaddoc3.jsp?docname=" + filename, request, response);
            } catch (Exception e1) {
                e1.printStackTrace();
            }
        }

        //导excel
        if (ac.equals("importexcel")) {
            String page = request.getParameter("page");
            String whzdstr = request.getParameter("whzdstr");
            String tablename = request.getParameter("tablename");
            try {
                String filename = "";
                request.setCharacterEncoding("utf-8");
                RequestContext requestContext = new ServletRequestContext(request);
                if (FileUpload.isMultipartContent(requestContext)) {

                    DiskFileItemFactory factory = new DiskFileItemFactory();
                    factory.setRepository(new File(request.getRealPath("/upfile/") + "/"));
                    ServletFileUpload upload = new ServletFileUpload(factory);
                    upload.setSizeMax(100 * 1024 * 1024);
                    List items = new ArrayList();

                    items = upload.parseRequest(request);

                    FileItem fileItem = (FileItem) items.get(0);
                    if (fileItem.getName() != null && fileItem.getSize() != 0) {
                        if (fileItem.getName() != null && fileItem.getSize() != 0) {
                            File fullFile = new File(fileItem.getName());
                            filename = Info.generalFileName(fullFile.getName());
                            File newFile = new File(request.getRealPath("/upfile/") + "/" + filename);
                            try {
                                fileItem.write(newFile);
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        } else {
                        }
                    }

                    if (filename.indexOf(".xls") > -1) {
                        Workbook workbook;
                        try {
                            workbook = Workbook.getWorkbook(new File(request.getRealPath("/upfile/") + "/" + filename));
                            //通过Workbook的getSheet方法选择第一个工作簿（从0开始）
                            Sheet sheet = workbook.getSheet(0);
                            //通过Sheet方法的getCell方法选择位置为C2的单元格（两个参数都从0开始）
                            //int empty = 0;
                            for (int i = 1; i < 1000; i++) {
                                Cell cell = null;
                                try {
                                    String isql = "insert into " + tablename + "(";

                                    for (String str : whzdstr.split("-")) {
                                        isql += str + ",";
                                    }
                                    isql = isql.substring(0, isql.length() - 1);
                                    isql += ")values(";

                                    int j = 0;
                                    int empty = 1;
                                    for (String str : whzdstr.split("-")) {
                                        cell = sheet.getCell(j, i);
                                        isql += "'" + cell.getContents() + "',";
                                        String content = cell.getContents() == null ? "" : cell.getContents();
                                        if (!"".equals(content.trim())) {
                                            empty = 0;
                                        }
                                        j++;
                                    }
                                    if (empty == 1) continue;
                                    isql = isql.substring(0, isql.length() - 1);
                                    isql += ")";
                                    dao.commOper(isql);
                                } catch (Exception e) {
                                    continue;
                                }

                            }
                            workbook.close();
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }
                }
                go("/admin/" + page + "?docname=" + filename, request, response);
            } catch (Exception e1) {
                e1.printStackTrace();
            }
        }


        if (ac.equals("uploadimg")) {
            try {
                String filename = "";
                request.setCharacterEncoding("utf-8");
                RequestContext requestContext = new ServletRequestContext(request);
                if (FileUpload.isMultipartContent(requestContext)) {

                    DiskFileItemFactory factory = new DiskFileItemFactory();
                    factory.setRepository(new File(request.getRealPath("/upfile/") + "/"));
                    ServletFileUpload upload = new ServletFileUpload(factory);
                    upload.setSizeMax(100 * 1024 * 1024);
                    List items = new ArrayList();

                    items = upload.parseRequest(request);

                    FileItem fileItem = (FileItem) items.get(0);
                    if (fileItem.getName() != null && fileItem.getSize() != 0) {
                        if (fileItem.getName() != null && fileItem.getSize() != 0) {
                            File fullFile = new File(fileItem.getName());
                            filename = Info.generalFileName(fullFile.getName());
                            File newFile = new File(request.getRealPath("/upfile/") + "/" + filename);
                            try {
                                fileItem.write(newFile);
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        } else {
                        }
                    }
                }

                go("/js/uploadimg.jsp?filename=" + filename, request, response);
            } catch (Exception e1) {
                e1.printStackTrace();
            }
        }


        if (ac.equals("uploadimg2")) {
            try {
                String filename = "";
                request.setCharacterEncoding("utf-8");
                RequestContext requestContext = new ServletRequestContext(request);
                if (FileUpload.isMultipartContent(requestContext)) {

                    DiskFileItemFactory factory = new DiskFileItemFactory();
                    factory.setRepository(new File(request.getRealPath("/upfile/") + "/"));
                    ServletFileUpload upload = new ServletFileUpload(factory);
                    upload.setSizeMax(100 * 1024 * 1024);
                    List items = new ArrayList();

                    items = upload.parseRequest(request);

                    FileItem fileItem = (FileItem) items.get(0);
                    if (fileItem.getName() != null && fileItem.getSize() != 0) {
                        if (fileItem.getName() != null && fileItem.getSize() != 0) {
                            File fullFile = new File(fileItem.getName());
                            filename = Info.generalFileName(fullFile.getName());
                            File newFile = new File(request.getRealPath("/upfile/") + "/" + filename);
                            try {
                                fileItem.write(newFile);
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        } else {
                        }
                    }
                }

                go("/travelopr/js/uploadimg2.jsp?filename=" + filename, request, response);
            } catch (Exception e1) {
                e1.printStackTrace();
            }
        }

        if (ac.equals("uploadimg3")) {
            try {
                String filename = "";
                request.setCharacterEncoding("utf-8");
                RequestContext requestContext = new ServletRequestContext(request);
                if (FileUpload.isMultipartContent(requestContext)) {

                    DiskFileItemFactory factory = new DiskFileItemFactory();
                    factory.setRepository(new File(request.getRealPath("/upfile/") + "/"));
                    ServletFileUpload upload = new ServletFileUpload(factory);
                    upload.setSizeMax(100 * 1024 * 1024);
                    List items = new ArrayList();

                    items = upload.parseRequest(request);

                    FileItem fileItem = (FileItem) items.get(0);
                    if (fileItem.getName() != null && fileItem.getSize() != 0) {
                        if (fileItem.getName() != null && fileItem.getSize() != 0) {
                            File fullFile = new File(fileItem.getName());
                            filename = Info.generalFileName(fullFile.getName());
                            File newFile = new File(request.getRealPath("/upfile/") + "/" + filename);
                            try {
                                fileItem.write(newFile);
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        } else {
                        }
                    }
                }

                go("/travelopr/js/uploadimg3.jsp?filename=" + filename, request, response);
            } catch (Exception e1) {
                e1.printStackTrace();
            }
        }

        if (ac.equals("uploadimg4")) {
            try {
                String filename = "";
                request.setCharacterEncoding("utf-8");
                RequestContext requestContext = new ServletRequestContext(request);
                if (FileUpload.isMultipartContent(requestContext)) {

                    DiskFileItemFactory factory = new DiskFileItemFactory();
                    factory.setRepository(new File(request.getRealPath("/upfile/") + "/"));
                    ServletFileUpload upload = new ServletFileUpload(factory);
                    upload.setSizeMax(100 * 1024 * 1024);
                    List items = new ArrayList();

                    items = upload.parseRequest(request);

                    FileItem fileItem = (FileItem) items.get(0);
                    if (fileItem.getName() != null && fileItem.getSize() != 0) {
                        if (fileItem.getName() != null && fileItem.getSize() != 0) {
                            File fullFile = new File(fileItem.getName());
                            filename = Info.generalFileName(fullFile.getName());
                            File newFile = new File(request.getRealPath("/upfile/") + "/" + filename);
                            try {
                                fileItem.write(newFile);
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        } else {
                        }
                    }
                }

                go("/travelopr/js/uploadimg4.jsp?filename=" + filename, request, response);
            } catch (Exception e1) {
                e1.printStackTrace();
            }
        }

        if (ac.equals("uploadimg5")) {
            try {
                String filename = "";
                request.setCharacterEncoding("utf-8");
                RequestContext requestContext = new ServletRequestContext(request);
                if (FileUpload.isMultipartContent(requestContext)) {

                    DiskFileItemFactory factory = new DiskFileItemFactory();
                    factory.setRepository(new File(request.getRealPath("/upfile/") + "/"));
                    ServletFileUpload upload = new ServletFileUpload(factory);
                    upload.setSizeMax(100 * 1024 * 1024);
                    List items = new ArrayList();

                    items = upload.parseRequest(request);

                    FileItem fileItem = (FileItem) items.get(0);
                    if (fileItem.getName() != null && fileItem.getSize() != 0) {
                        if (fileItem.getName() != null && fileItem.getSize() != 0) {
                            File fullFile = new File(fileItem.getName());
                            filename = Info.generalFileName(fullFile.getName());
                            File newFile = new File(request.getRealPath("/upfile/") + "/" + filename);
                            try {
                                fileItem.write(newFile);
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        } else {
                        }
                    }
                }

                go("/travelopr/js/uploadimg5.jsp?filename=" + filename, request, response);
            } catch (Exception e1) {
                e1.printStackTrace();
            }
        }


        //regedit.jsp请求处理开始
        if (ac.equals("regedit")) {
            String uname = request.getParameter("uname") == null ? "" : request.getParameter("uname");
            String upass = request.getParameter("upass") == null ? "" : request.getParameter("upass");
            String tname = request.getParameter("tname") == null ? "" : request.getParameter("tname");
            String sfid = request.getParameter("sfid") == null ? "" : request.getParameter("sfid");
            String sex = request.getParameter("sex") == null ? "" : request.getParameter("sex");
            String birth = request.getParameter("birth") == null ? "" : request.getParameter("birth");
            String tel = request.getParameter("tel") == null ? "" : request.getParameter("tel");
            String addrs = request.getParameter("addrs") == null ? "" : request.getParameter("addrs");
            String email = request.getParameter("email") == null ? "" : request.getParameter("email");
            String savetime = date;
            String filename = request.getParameter("filename") == null ? "" : request.getParameter("filename");
            String utype = "会员";
            String status = "新用户";
            String sql = "insert into sysuser(uname,upass,tname,sfid,sex,birth,tel,addrs,email,savetime,filename,utype,status " +
                    ")values('" + uname + "','" + upass + "','" + tname + "','" + sfid + "','" + sex + "','" + birth + "','" + tel + "','" + addrs + "','" + email + "','" + savetime + "','" + filename + "','" + utype + "','" + status + "')";
            dao.commOper(sql);
            session.setAttribute("suc", "suc");
            response.sendRedirect("/travelopr/regedit.jsp");
        }
        //regedit.jsp请求处理结束


        //aprosxg.jsp请求处理开始
        if (ac.equals("aprosxg")) {
            String id = request.getParameter("id");
            String jstatus = request.getParameter("jstatus") == null ? "" : request.getParameter("jstatus");
            String status = request.getParameter("status") == null ? "" : request.getParameter("status");
            String sql = "update pros set jstatus='" + jstatus + "',status='" + status + "' where id=" + id;
            dao.commOper(sql);
            session.setAttribute("suc", "suc");
            response.sendRedirect("/travelopr/admin/aprosxg.jsp?id=" + id + "");
        }
        //aprosxg.jsp请求处理结束

        //uordersxg.jsp请求处理开始
        if (ac.equals("uordersxg")) {
            String id = request.getParameter("id");
            String acct = request.getParameter("acct") == null ? "" : request.getParameter("acct");
            String apass = request.getParameter("apass") == null ? "" : request.getParameter("apass");
            String sql = "update orders set acct='" + acct + "',apass='" + apass + "',fkstatus='已付款' where id=" + id;
            dao.commOper(sql);
            session.setAttribute("suc", "suc");
            response.sendRedirect("/travelopr/admin/uordersxg.jsp?id=" + id + "");
        }
        //uordersxg.jsp请求处理结束

        //aordersxg.jsp请求处理开始
        if (ac.equals("aordersxg")) {
            String id = request.getParameter("id");
            String tgroupn = request.getParameter("tgroupn") == null ? "" : request.getParameter("tgroupn");
            String tgroupnkey = dao.getID("orders", "tgroupn", "tgroup", "gname~hnoname", tgroupn);
            String sql = "update orders set tgroupn='" + tgroupn + "',tgroupnkey='" + tgroupnkey + "',status='已受理' where id=" + id;
            dao.commOper(sql);
            session.setAttribute("suc", "suc");
            response.sendRedirect("/travelopr/admin/aordersxg.jsp?id=" + id + "");
        }
        //aordersxg.jsp请求处理结束

        //sarticlexg.jsp请求处理开始
        if (ac.equals("sarticlexg")) {
            String id = request.getParameter("id");
            String sql = "update article set where id=" + id;
            dao.commOper(sql);
            session.setAttribute("suc", "suc");
            response.sendRedirect("/travelopr/admin/sarticlexg.jsp?id=" + id + "");
        }
        //sarticlexg.jsp请求处理结束

        //hysysusertj.jsp请求处理开始
        if (ac.equals("hysysusertj")) {
            String uname = request.getParameter("uname") == null ? "" : request.getParameter("uname");
            String upass = request.getParameter("upass") == null ? "" : request.getParameter("upass");
            String tname = request.getParameter("tname") == null ? "" : request.getParameter("tname");
            String tnamekey = dao.getID("sysuser", "tname", "", "", tname);
            String sfid = request.getParameter("sfid") == null ? "" : request.getParameter("sfid");
            String sex = request.getParameter("sex") == null ? "" : request.getParameter("sex");
            String birth = request.getParameter("birth") == null ? "" : request.getParameter("birth");
            String tel = request.getParameter("tel") == null ? "" : request.getParameter("tel");
            String addrs = request.getParameter("addrs") == null ? "" : request.getParameter("addrs");
            String email = request.getParameter("email") == null ? "" : request.getParameter("email");
            String savetime = date;
            String filename = request.getParameter("filename") == null ? "" : request.getParameter("filename");
            String utype = "用户";
            String status = "正常";
            String sql = "insert into sysuser(uname,upass,tname,tnamekey,sfid,sex,birth,tel,addrs,email,savetime,filename,utype,status " +
                    ")values('" + uname + "','" + upass + "','" + tname + "','" + tnamekey + "','" + sfid + "','" + sex + "','" + birth + "','" + tel + "','" + addrs + "','" + email + "','" + savetime + "','" + filename + "','" + utype + "','" + status + "')";
            dao.commOper(sql);
            session.setAttribute("suc", "suc");
            response.sendRedirect("/travelopr/admin/hysysusertj.jsp");
        }
        //hysysusertj.jsp请求处理结束

        //hysysuserxg.jsp请求处理开始
        if (ac.equals("hysysuserxg")) {
            String id = request.getParameter("id");
            String uname = request.getParameter("uname") == null ? "" : request.getParameter("uname");
            String upass = request.getParameter("upass") == null ? "" : request.getParameter("upass");
            String tname = request.getParameter("tname") == null ? "" : request.getParameter("tname");
            String tnamekey = dao.getID("sysuser", "tname", "", "", tname);
            String sfid = request.getParameter("sfid") == null ? "" : request.getParameter("sfid");
            String sex = request.getParameter("sex") == null ? "" : request.getParameter("sex");
            String birth = request.getParameter("birth") == null ? "" : request.getParameter("birth");
            String tel = request.getParameter("tel") == null ? "" : request.getParameter("tel");
            String addrs = request.getParameter("addrs") == null ? "" : request.getParameter("addrs");
            String email = request.getParameter("email") == null ? "" : request.getParameter("email");
            String filename = request.getParameter("filename") == null ? "" : request.getParameter("filename");
            String sql = "update sysuser set uname='" + uname + "',upass='" + upass + "',tname='" + tname + "',tnamekey='" + tnamekey + "',sfid='" + sfid + "',sex='" + sex + "',birth='" + birth + "',tel='" + tel + "',addrs='" + addrs + "',email='" + email + "',filename='" + filename + "' where id=" + id;
            dao.commOper(sql);
            session.setAttribute("suc", "suc");
            response.sendRedirect("/travelopr/admin/hysysuserxg.jsp?id=" + id + "");
        }
        //hysysuserxg.jsp请求处理结束

        //sysusertj.jsp请求处理开始
        if (ac.equals("sysusertj")) {
            String uname = request.getParameter("uname") == null ? "" : request.getParameter("uname");
            String upass = request.getParameter("upass") == null ? "" : request.getParameter("upass");
            String tname = request.getParameter("tname") == null ? "" : request.getParameter("tname");
            String tnamekey = dao.getID("sysuser", "tname", "", "", tname);
            String sfid = request.getParameter("sfid") == null ? "" : request.getParameter("sfid");
            String sex = request.getParameter("sex") == null ? "" : request.getParameter("sex");
            String birth = request.getParameter("birth") == null ? "" : request.getParameter("birth");
            String tel = request.getParameter("tel") == null ? "" : request.getParameter("tel");
            String addrs = request.getParameter("addrs") == null ? "" : request.getParameter("addrs");
            String email = request.getParameter("email") == null ? "" : request.getParameter("email");
            String savetime = date;
            String filename = request.getParameter("filename") == null ? "" : request.getParameter("filename");
            String utype = "管理员";
            String status = "正常";
            String sql = "insert into sysuser(uname,upass,tname,tnamekey,sfid,sex,birth,tel,addrs,email,savetime,filename,utype,status " +
                    ")values('" + uname + "','" + upass + "','" + tname + "','" + tnamekey + "','" + sfid + "','" + sex + "','" + birth + "','" + tel + "','" + addrs + "','" + email + "','" + savetime + "','" + filename + "','" + utype + "','" + status + "')";
            dao.commOper(sql);
            session.setAttribute("suc", "suc");
            response.sendRedirect("/travelopr/admin/sysusertj.jsp");
        }
        //sysusertj.jsp请求处理结束

        //sysuserxg.jsp请求处理开始
        if (ac.equals("sysuserxg")) {
            String id = request.getParameter("id");
            String uname = request.getParameter("uname") == null ? "" : request.getParameter("uname");
            String upass = request.getParameter("upass") == null ? "" : request.getParameter("upass");
            String tname = request.getParameter("tname") == null ? "" : request.getParameter("tname");
            String tnamekey = dao.getID("sysuser", "tname", "", "", tname);
            String sfid = request.getParameter("sfid") == null ? "" : request.getParameter("sfid");
            String sex = request.getParameter("sex") == null ? "" : request.getParameter("sex");
            String birth = request.getParameter("birth") == null ? "" : request.getParameter("birth");
            String tel = request.getParameter("tel") == null ? "" : request.getParameter("tel");
            String addrs = request.getParameter("addrs") == null ? "" : request.getParameter("addrs");
            String email = request.getParameter("email") == null ? "" : request.getParameter("email");
            String filename = request.getParameter("filename") == null ? "" : request.getParameter("filename");
            String sql = "update sysuser set uname='" + uname + "',upass='" + upass + "',tname='" + tname + "',tnamekey='" + tnamekey + "',sfid='" + sfid + "',sex='" + sex + "',birth='" + birth + "',tel='" + tel + "',addrs='" + addrs + "',email='" + email + "',filename='" + filename + "' where id=" + id;
            dao.commOper(sql);
            session.setAttribute("suc", "suc");
            response.sendRedirect("/travelopr/admin/sysuserxg.jsp?id=" + id + "");
        }
        //sysuserxg.jsp请求处理结束

        //psysuserxg.jsp请求处理开始
        if (ac.equals("psysuserxg")) {
            String id = request.getParameter("id");
            String tname = request.getParameter("tname") == null ? "" : request.getParameter("tname");
            String tnamekey = dao.getID("sysuser", "tname", "", "", tname);
            String sfid = request.getParameter("sfid") == null ? "" : request.getParameter("sfid");
            String sex = request.getParameter("sex") == null ? "" : request.getParameter("sex");
            String birth = request.getParameter("birth") == null ? "" : request.getParameter("birth");
            String tel = request.getParameter("tel") == null ? "" : request.getParameter("tel");
            String addrs = request.getParameter("addrs") == null ? "" : request.getParameter("addrs");
            String email = request.getParameter("email") == null ? "" : request.getParameter("email");
            String filename = request.getParameter("filename") == null ? "" : request.getParameter("filename");
            String sql = "update sysuser set tname='" + tname + "',tnamekey='" + tnamekey + "',sfid='" + sfid + "',sex='" + sex + "',birth='" + birth + "',tel='" + tel + "',addrs='" + addrs + "',email='" + email + "',filename='" + filename + "' where id=" + id;
            dao.commOper(sql);
            session.setAttribute("suc", "suc");
            response.sendRedirect("/travelopr/admin/psysuserxg.jsp?id=" + id + "");
        }
        //psysuserxg.jsp请求处理结束

        //zmixinfoxg.jsp请求处理开始
        if (ac.equals("zmixinfoxg")) {
            String id = request.getParameter("id");
            String content = request.getParameter("content") == null ? "" : request.getParameter("content");
            content = content.replaceAll("'", " ");
            String sql = "update mixinfo set content='" + content + "' where id=" + id;
            dao.commOper(sql);
            session.setAttribute("suc", "suc");
            response.sendRedirect("/travelopr/admin/zmixinfoxg.jsp?id=" + id + "");
        }
        //zmixinfoxg.jsp请求处理结束

        //messagesxg.jsp请求处理开始
        if (ac.equals("messagesxg")) {
            String id = request.getParameter("id");
            String recont = request.getParameter("recont") == null ? "" : request.getParameter("recont");
            String sql = "update messages set recont='" + recont + "' where id=" + id;
            dao.commOper(sql);
            session.setAttribute("suc", "suc");
            response.sendRedirect("/travelopr/admin/messagesxg.jsp?id=" + id + "");
        }
        //messagesxg.jsp请求处理结束

        //gmixinfoxg.jsp请求处理开始
        if (ac.equals("gmixinfoxg")) {
            String id = request.getParameter("id");
            String mtitle = request.getParameter("mtitle") == null ? "" : request.getParameter("mtitle");
            String remo = request.getParameter("remo") == null ? "" : request.getParameter("remo");
            String filename = request.getParameter("filename") == null ? "" : request.getParameter("filename");
            String sql = "update mixinfo set mtitle='" + mtitle + "',remo='" + remo + "',filename='" + filename + "' where id=" + id;
            dao.commOper(sql);
            session.setAttribute("suc", "suc");
            response.sendRedirect("/travelopr/admin/gmixinfoxg.jsp?id=" + id + "");
        }
        //gmixinfoxg.jsp请求处理结束

        //hbnewstj.jsp请求处理开始
        if (ac.equals("hbnewstj")) {
            String title = request.getParameter("title") == null ? "" : request.getParameter("title");
            String itype = request.getParameter("itype") == null ? "" : request.getParameter("itype");
            String savetime = date;
            String filename = request.getParameter("filename") == null ? "" : request.getParameter("filename");
            String content = request.getParameter("content") == null ? "" : request.getParameter("content");
            content = content.replaceAll("'", " ");
            String sql = "insert into hbnews(title,itype,savetime,filename,content " +
                    ")values('" + title + "','" + itype + "','" + savetime + "','" + filename + "','" + content + "')";
            dao.commOper(sql);
            session.setAttribute("suc", "suc");
            response.sendRedirect("/travelopr/admin/hbnewstj.jsp");
        }
        //hbnewstj.jsp请求处理结束

        //hbnewsxg.jsp请求处理开始
        if (ac.equals("hbnewsxg")) {
            String id = request.getParameter("id");
            String title = request.getParameter("title") == null ? "" : request.getParameter("title");
            String itype = request.getParameter("itype") == null ? "" : request.getParameter("itype");
            String filename = request.getParameter("filename") == null ? "" : request.getParameter("filename");
            String content = request.getParameter("content") == null ? "" : request.getParameter("content");
            content = content.replaceAll("'", " ");
            String sql = "update hbnews set title='" + title + "',itype='" + itype + "',filename='" + filename + "',content='" + content + "' where id=" + id;
            dao.commOper(sql);
            session.setAttribute("suc", "suc");
            response.sendRedirect("/travelopr/admin/hbnewsxg.jsp?id=" + id + "");
        }
        //hbnewsxg.jsp请求处理结束

        //guidestj.jsp请求处理开始
        if (ac.equals("guidestj")) {
            String gno = request.getParameter("gno") == null ? "" : request.getParameter("gno");
            String gname = request.getParameter("gname") == null ? "" : request.getParameter("gname");
            String sex = request.getParameter("sex") == null ? "" : request.getParameter("sex");
            String tel = request.getParameter("tel") == null ? "" : request.getParameter("tel");
            String sql = "insert into guides(gno,gname,sex,tel " +
                    ")values('" + gno + "','" + gname + "','" + sex + "','" + tel + "')";
            dao.commOper(sql);
            session.setAttribute("suc", "suc");
            response.sendRedirect("/travelopr/admin/guidestj.jsp");
        }
        //guidestj.jsp请求处理结束

        //guidesxg.jsp请求处理开始
        if (ac.equals("guidesxg")) {
            String id = request.getParameter("id");
            String gno = request.getParameter("gno") == null ? "" : request.getParameter("gno");
            String gname = request.getParameter("gname") == null ? "" : request.getParameter("gname");
            String sex = request.getParameter("sex") == null ? "" : request.getParameter("sex");
            String tel = request.getParameter("tel") == null ? "" : request.getParameter("tel");
            String sql = "update guides set gno='" + gno + "',gname='" + gname + "',sex='" + sex + "',tel='" + tel + "' where id=" + id;
            dao.commOper(sql);
            session.setAttribute("suc", "suc");
            response.sendRedirect("/travelopr/admin/guidesxg.jsp?id=" + id + "");
        }
        //guidesxg.jsp请求处理结束

        //prostj.jsp请求处理开始
        if (ac.equals("prostj")) {
            String sname = request.getParameter("sname") == null ? "" : request.getParameter("sname");
            String city = request.getParameter("city") == null ? "" : request.getParameter("city");
            String addrs = request.getParameter("addrs") == null ? "" : request.getParameter("addrs");
            String tprice = request.getParameter("tprice") == null ? "" : request.getParameter("tprice");
            String hprice = request.getParameter("hprice") == null ? "" : request.getParameter("hprice");
            String fprice = request.getParameter("fprice") == null ? "" : request.getParameter("fprice");
            String jprice = request.getParameter("jprice") == null ? "" : request.getParameter("jprice");
            String wprice = request.getParameter("wprice") == null ? "" : request.getParameter("wprice");
            String remo = request.getParameter("remo") == null ? "" : request.getParameter("remo");
            String guide = request.getParameter("guide") == null ? "" : request.getParameter("guide");
            String guidekey = dao.getID("pros", "guide", "guides", "gno~hnoname", guide);
            String savetime = date;
            String filename = request.getParameter("filename") == null ? "" : request.getParameter("filename");
            String sql = "insert into pros(sname,city,addrs,tprice,hprice,fprice,jprice,wprice,remo,guide,guidekey,savetime,filename " +
                    ")values('" + sname + "','" + city + "','" + addrs + "','" + tprice + "','" + hprice + "','" + fprice + "','" + jprice + "','" + wprice + "','" + remo + "','" + guide + "','" + guidekey + "','" + savetime + "','" + filename + "')";
            dao.commOper(sql);
            session.setAttribute("suc", "suc");
            response.sendRedirect("/travelopr/admin/prostj.jsp");
        }
        //prostj.jsp请求处理结束

        //prosxg.jsp请求处理开始
        if (ac.equals("prosxg")) {
            String id = request.getParameter("id");
            String sname = request.getParameter("sname") == null ? "" : request.getParameter("sname");
            String city = request.getParameter("city") == null ? "" : request.getParameter("city");
            String addrs = request.getParameter("addrs") == null ? "" : request.getParameter("addrs");
            String tprice = request.getParameter("tprice") == null ? "" : request.getParameter("tprice");
            String hprice = request.getParameter("hprice") == null ? "" : request.getParameter("hprice");
            String fprice = request.getParameter("fprice") == null ? "" : request.getParameter("fprice");
            String jprice = request.getParameter("jprice") == null ? "" : request.getParameter("jprice");
            String wprice = request.getParameter("wprice") == null ? "" : request.getParameter("wprice");
            String remo = request.getParameter("remo") == null ? "" : request.getParameter("remo");
            String guide = request.getParameter("guide") == null ? "" : request.getParameter("guide");
            String guidekey = dao.getID("pros", "guide", "guides", "gno~hnoname", guide);
            String filename = request.getParameter("filename") == null ? "" : request.getParameter("filename");
            String sql = "update pros set sname='" + sname + "',city='" + city + "',addrs='" + addrs + "',tprice='" + tprice + "',hprice='" + hprice + "',fprice='" + fprice + "',jprice='" + jprice + "',wprice='" + wprice + "',remo='" + remo + "',guide='" + guide + "',guidekey='" + guidekey + "',filename='" + filename + "' where id=" + id;
            dao.commOper(sql);
            session.setAttribute("suc", "suc");
            response.sendRedirect("/travelopr/admin/prosxg.jsp?id=" + id + "");
        }
        //prosxg.jsp请求处理结束

        //tgrouptj.jsp请求处理开始
        if (ac.equals("tgrouptj")) {
            String gname = request.getParameter("gname") == null ? "" : request.getParameter("gname");
            String guide = request.getParameter("guide") == null ? "" : request.getParameter("guide");
            String guidekey = dao.getID("tgroup", "guide", "guides", "gno~hnoname", guide);
            String sdate = request.getParameter("sdate") == null ? "" : request.getParameter("sdate");
            String edate = request.getParameter("edate") == null ? "" : request.getParameter("edate");
            String sql = "insert into tgroup(gname,guide,guidekey,sdate,edate " +
                    ")values('" + gname + "','" + guide + "','" + guidekey + "','" + sdate + "','" + edate + "')";
            dao.commOper(sql);
            session.setAttribute("suc", "suc");
            response.sendRedirect("/travelopr/admin/tgrouptj.jsp");
        }
        //tgrouptj.jsp请求处理结束

        //tgroupxg.jsp请求处理开始
        if (ac.equals("tgroupxg")) {
            String id = request.getParameter("id");
            String gname = request.getParameter("gname") == null ? "" : request.getParameter("gname");
            String guide = request.getParameter("guide") == null ? "" : request.getParameter("guide");
            String guidekey = dao.getID("tgroup", "guide", "guides", "gno~hnoname", guide);
            String sdate = request.getParameter("sdate") == null ? "" : request.getParameter("sdate");
            String edate = request.getParameter("edate") == null ? "" : request.getParameter("edate");
            String sql = "update tgroup set gname='" + gname + "',guide='" + guide + "',guidekey='" + guidekey + "',sdate='" + sdate + "',edate='" + edate + "' where id=" + id;
            dao.commOper(sql);
            session.setAttribute("suc", "suc");
            response.sendRedirect("/travelopr/admin/tgroupxg.jsp?id=" + id + "");
        }
        //tgroupxg.jsp请求处理结束

        //articletj.jsp请求处理开始
        if (ac.equals("articletj")) {
            String ytitle = request.getParameter("ytitle") == null ? "" : request.getParameter("ytitle");
            String savetime = date;
            String content = request.getParameter("content") == null ? "" : request.getParameter("content");
            content = content.replaceAll("'", " ");
            String uname = Info.getUser(request).get("uname").toString();
            String sql = "insert into article(ytitle,savetime,content,uname " +
                    ")values('" + ytitle + "','" + savetime + "','" + content + "','" + uname + "')";
            dao.commOper(sql);
            session.setAttribute("suc", "suc");
            response.sendRedirect("/travelopr/admin/articletj.jsp");
        }
        //articletj.jsp请求处理结束

        //articlexg.jsp请求处理开始
        if (ac.equals("articlexg")) {
            String id = request.getParameter("id");
            String ytitle = request.getParameter("ytitle") == null ? "" : request.getParameter("ytitle");
            String content = request.getParameter("content") == null ? "" : request.getParameter("content");
            content = content.replaceAll("'", " ");
            String sql = "update article set ytitle='" + ytitle + "',content='" + content + "' where id=" + id;
            dao.commOper(sql);
            session.setAttribute("suc", "suc");
            response.sendRedirect("/travelopr/admin/articlexg.jsp?id=" + id + "");
        }
        //articlexg.jsp请求处理结束

//--业务层代码块结束--
        dao.updateById("sysuser", "tname", "", "", "");
        dao.updateById("pros", "guide", "guides", "gno~hnoname", "");
        dao.updateById("tgroup", "guide", "guides", "gno~hnoname", "");
        dao.close();
        out.flush();
        out.close();
    }


    public void init() throws ServletException {
        // Put your code here
    }

    public static void main(String[] args) {
        String a = "'a";
        System.out.println(a.replaceAll("'", "''"));
    }

}
