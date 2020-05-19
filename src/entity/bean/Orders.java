package entity.bean;

/**
 * News entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class Orders implements java.io.Serializable {

	// Fields

     private Long id; 
     private String uname; 
     private String tname; 
     private String sfid; 
     private String tel; 
     private String dname; 
     private String pid; 
     private String tprice; 
     private String jt; 
     private String jtprice; 
     private String jd; 
     private String jdprice; 
     private String fkstatus; 
     private String acct; 
     private String apass; 
     private String status; 
     private String muname; 
     private String tgroupn; 
     private String tgroupnkey; 


	// Constructors

	/** default constructor */
	public Orders() {
	}

	/** minimal constructor */
	public Orders(Long id) {
		this.id = id;
	}

	/** full constructor */
	public Orders(
    Long id, 
    String uname, 
    String tname, 
    String sfid, 
    String tel, 
    String dname, 
    String pid, 
    String tprice, 
    String jt, 
    String jtprice, 
    String jd, 
    String jdprice, 
    String fkstatus, 
    String acct, 
    String apass, 
    String status, 
    String muname, 
    String tgroupn, 
    String tgroupnkey ) 
	{
     this.id = id; 
     this.uname = uname; 
     this.tname = tname; 
     this.sfid = sfid; 
     this.tel = tel; 
     this.dname = dname; 
     this.pid = pid; 
     this.tprice = tprice; 
     this.jt = jt; 
     this.jtprice = jtprice; 
     this.jd = jd; 
     this.jdprice = jdprice; 
     this.fkstatus = fkstatus; 
     this.acct = acct; 
     this.apass = apass; 
     this.status = status; 
     this.muname = muname; 
     this.tgroupn = tgroupn; 
     this.tgroupnkey = tgroupnkey;
	}

	// Property accessors

		public Long getId() {
			return this.id;
		}

		public void setId(Long id) {
			this.id = id;
		}

    public String getUname(){ 
       return this.uname; 
    } 

    public void setUname(String uname){ 
        this.uname=uname; 
    } 

    public String getTname(){ 
       return this.tname; 
    } 

    public void setTname(String tname){ 
        this.tname=tname; 
    } 

    public String getSfid(){ 
       return this.sfid; 
    } 

    public void setSfid(String sfid){ 
        this.sfid=sfid; 
    } 

    public String getTel(){ 
       return this.tel; 
    } 

    public void setTel(String tel){ 
        this.tel=tel; 
    } 

    public String getDname(){ 
       return this.dname; 
    } 

    public void setDname(String dname){ 
        this.dname=dname; 
    } 

    public String getPid(){ 
       return this.pid; 
    } 

    public void setPid(String pid){ 
        this.pid=pid; 
    } 

    public String getTprice(){ 
       return this.tprice; 
    } 

    public void setTprice(String tprice){ 
        this.tprice=tprice; 
    } 

    public String getJt(){ 
       return this.jt; 
    } 

    public void setJt(String jt){ 
        this.jt=jt; 
    } 

    public String getJtprice(){ 
       return this.jtprice; 
    } 

    public void setJtprice(String jtprice){ 
        this.jtprice=jtprice; 
    } 

    public String getJd(){ 
       return this.jd; 
    } 

    public void setJd(String jd){ 
        this.jd=jd; 
    } 

    public String getJdprice(){ 
       return this.jdprice; 
    } 

    public void setJdprice(String jdprice){ 
        this.jdprice=jdprice; 
    } 

    public String getFkstatus(){ 
       return this.fkstatus; 
    } 

    public void setFkstatus(String fkstatus){ 
        this.fkstatus=fkstatus; 
    } 

    public String getAcct(){ 
       return this.acct; 
    } 

    public void setAcct(String acct){ 
        this.acct=acct; 
    } 

    public String getApass(){ 
       return this.apass; 
    } 

    public void setApass(String apass){ 
        this.apass=apass; 
    } 

    public String getStatus(){ 
       return this.status; 
    } 

    public void setStatus(String status){ 
        this.status=status; 
    } 

    public String getMuname(){ 
       return this.muname; 
    } 

    public void setMuname(String muname){ 
        this.muname=muname; 
    } 

    public String getTgroupn(){ 
       return this.tgroupn; 
    } 

    public void setTgroupn(String tgroupn){ 
        this.tgroupn=tgroupn; 
    } 

    public String getTgroupnkey(){ 
       return this.tgroupnkey; 
    } 

    public void setTgroupnkey(String tgroupnkey){ 
        this.tgroupnkey=tgroupnkey; 
    } 



}