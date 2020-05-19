package entity.bean;

/**
 * News entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class Pros implements java.io.Serializable {

	// Fields

     private Long id; 
     private String sname; 
     private String city; 
     private String addrs; 
     private String tprice; 
     private String hprice; 
     private String fprice; 
     private String jprice; 
     private String wprice; 
     private String remo; 
     private String filename; 
     private String guide; 
     private String savetime; 
     private String guidekey; 


	// Constructors

	/** default constructor */
	public Pros() {
	}

	/** minimal constructor */
	public Pros(Long id) {
		this.id = id;
	}

	/** full constructor */
	public Pros(
    Long id, 
    String sname, 
    String city, 
    String addrs, 
    String tprice, 
    String hprice, 
    String fprice, 
    String jprice, 
    String wprice, 
    String remo, 
    String filename, 
    String guide, 
    String savetime, 
    String guidekey ) 
	{
     this.id = id; 
     this.sname = sname; 
     this.city = city; 
     this.addrs = addrs; 
     this.tprice = tprice; 
     this.hprice = hprice; 
     this.fprice = fprice; 
     this.jprice = jprice; 
     this.wprice = wprice; 
     this.remo = remo; 
     this.filename = filename; 
     this.guide = guide; 
     this.savetime = savetime; 
     this.guidekey = guidekey;
	}

	// Property accessors

		public Long getId() {
			return this.id;
		}

		public void setId(Long id) {
			this.id = id;
		}

    public String getSname(){ 
       return this.sname; 
    } 

    public void setSname(String sname){ 
        this.sname=sname; 
    } 

    public String getCity(){ 
       return this.city; 
    } 

    public void setCity(String city){ 
        this.city=city; 
    } 

    public String getAddrs(){ 
       return this.addrs; 
    } 

    public void setAddrs(String addrs){ 
        this.addrs=addrs; 
    } 

    public String getTprice(){ 
       return this.tprice; 
    } 

    public void setTprice(String tprice){ 
        this.tprice=tprice; 
    } 

    public String getHprice(){ 
       return this.hprice; 
    } 

    public void setHprice(String hprice){ 
        this.hprice=hprice; 
    } 

    public String getFprice(){ 
       return this.fprice; 
    } 

    public void setFprice(String fprice){ 
        this.fprice=fprice; 
    } 

    public String getJprice(){ 
       return this.jprice; 
    } 

    public void setJprice(String jprice){ 
        this.jprice=jprice; 
    } 

    public String getWprice(){ 
       return this.wprice; 
    } 

    public void setWprice(String wprice){ 
        this.wprice=wprice; 
    } 

    public String getRemo(){ 
       return this.remo; 
    } 

    public void setRemo(String remo){ 
        this.remo=remo; 
    } 

    public String getFilename(){ 
       return this.filename; 
    } 

    public void setFilename(String filename){ 
        this.filename=filename; 
    } 

    public String getGuide(){ 
       return this.guide; 
    } 

    public void setGuide(String guide){ 
        this.guide=guide; 
    } 

    public String getSavetime(){ 
       return this.savetime; 
    } 

    public void setSavetime(String savetime){ 
        this.savetime=savetime; 
    } 

    public String getGuidekey(){ 
       return this.guidekey; 
    } 

    public void setGuidekey(String guidekey){ 
        this.guidekey=guidekey; 
    } 



}