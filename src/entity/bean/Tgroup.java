package entity.bean;

/**
 * News entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class Tgroup implements java.io.Serializable {

	// Fields

     private Long id; 
     private String gname; 
     private String guide; 
     private String sdate; 
     private String edate; 
     private String guidekey; 


	// Constructors

	/** default constructor */
	public Tgroup() {
	}

	/** minimal constructor */
	public Tgroup(Long id) {
		this.id = id;
	}

	/** full constructor */
	public Tgroup(
    Long id, 
    String gname, 
    String guide, 
    String sdate, 
    String edate, 
    String guidekey ) 
	{
     this.id = id; 
     this.gname = gname; 
     this.guide = guide; 
     this.sdate = sdate; 
     this.edate = edate; 
     this.guidekey = guidekey;
	}

	// Property accessors

		public Long getId() {
			return this.id;
		}

		public void setId(Long id) {
			this.id = id;
		}

    public String getGname(){ 
       return this.gname; 
    } 

    public void setGname(String gname){ 
        this.gname=gname; 
    } 

    public String getGuide(){ 
       return this.guide; 
    } 

    public void setGuide(String guide){ 
        this.guide=guide; 
    } 

    public String getSdate(){ 
       return this.sdate; 
    } 

    public void setSdate(String sdate){ 
        this.sdate=sdate; 
    } 

    public String getEdate(){ 
       return this.edate; 
    } 

    public void setEdate(String edate){ 
        this.edate=edate; 
    } 

    public String getGuidekey(){ 
       return this.guidekey; 
    } 

    public void setGuidekey(String guidekey){ 
        this.guidekey=guidekey; 
    } 



}