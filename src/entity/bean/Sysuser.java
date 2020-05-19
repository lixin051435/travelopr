package entity.bean;

/**
 * News entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class Sysuser implements java.io.Serializable {

	// Fields

     private Long id; 
     private String uname; 
     private String upass; 
     private String utype; 
     private String tname; 
     private String sfid; 
     private String filename; 
     private String sex; 
     private String birth; 
     private String tel; 
     private String addrs; 
     private String email; 
     private String status; 
     private String savetime; 


	// Constructors

	/** default constructor */
	public Sysuser() {
	}

	/** minimal constructor */
	public Sysuser(Long id) {
		this.id = id;
	}

	/** full constructor */
	public Sysuser(
    Long id, 
    String uname, 
    String upass, 
    String utype, 
    String tname, 
    String sfid, 
    String filename, 
    String sex, 
    String birth, 
    String tel, 
    String addrs, 
    String email, 
    String status, 
    String savetime ) 
	{
     this.id = id; 
     this.uname = uname; 
     this.upass = upass; 
     this.utype = utype; 
     this.tname = tname; 
     this.sfid = sfid; 
     this.filename = filename; 
     this.sex = sex; 
     this.birth = birth; 
     this.tel = tel; 
     this.addrs = addrs; 
     this.email = email; 
     this.status = status; 
     this.savetime = savetime;
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

    public String getUpass(){ 
       return this.upass; 
    } 

    public void setUpass(String upass){ 
        this.upass=upass; 
    } 

    public String getUtype(){ 
       return this.utype; 
    } 

    public void setUtype(String utype){ 
        this.utype=utype; 
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

    public String getFilename(){ 
       return this.filename; 
    } 

    public void setFilename(String filename){ 
        this.filename=filename; 
    } 

    public String getSex(){ 
       return this.sex; 
    } 

    public void setSex(String sex){ 
        this.sex=sex; 
    } 

    public String getBirth(){ 
       return this.birth; 
    } 

    public void setBirth(String birth){ 
        this.birth=birth; 
    } 

    public String getTel(){ 
       return this.tel; 
    } 

    public void setTel(String tel){ 
        this.tel=tel; 
    } 

    public String getAddrs(){ 
       return this.addrs; 
    } 

    public void setAddrs(String addrs){ 
        this.addrs=addrs; 
    } 

    public String getEmail(){ 
       return this.email; 
    } 

    public void setEmail(String email){ 
        this.email=email; 
    } 

    public String getStatus(){ 
       return this.status; 
    } 

    public void setStatus(String status){ 
        this.status=status; 
    } 

    public String getSavetime(){ 
       return this.savetime; 
    } 

    public void setSavetime(String savetime){ 
        this.savetime=savetime; 
    } 



}