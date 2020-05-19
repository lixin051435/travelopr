package entity.bean;

/**
 * News entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class Hbnews implements java.io.Serializable {

	// Fields

     private Long id; 
     private String title; 
     private String itype; 
     private String filename; 
     private String content; 
     private String savetime; 
     private String infotype; 


	// Constructors

	/** default constructor */
	public Hbnews() {
	}

	/** minimal constructor */
	public Hbnews(Long id) {
		this.id = id;
	}

	/** full constructor */
	public Hbnews(
    Long id, 
    String title, 
    String itype, 
    String filename, 
    String content, 
    String savetime, 
    String infotype ) 
	{
     this.id = id; 
     this.title = title; 
     this.itype = itype; 
     this.filename = filename; 
     this.content = content; 
     this.savetime = savetime; 
     this.infotype = infotype;
	}

	// Property accessors

		public Long getId() {
			return this.id;
		}

		public void setId(Long id) {
			this.id = id;
		}

    public String getTitle(){ 
       return this.title; 
    } 

    public void setTitle(String title){ 
        this.title=title; 
    } 

    public String getItype(){ 
       return this.itype; 
    } 

    public void setItype(String itype){ 
        this.itype=itype; 
    } 

    public String getFilename(){ 
       return this.filename; 
    } 

    public void setFilename(String filename){ 
        this.filename=filename; 
    } 

    public String getContent(){ 
       return this.content; 
    } 

    public void setContent(String content){ 
        this.content=content; 
    } 

    public String getSavetime(){ 
       return this.savetime; 
    } 

    public void setSavetime(String savetime){ 
        this.savetime=savetime; 
    } 

    public String getInfotype(){ 
       return this.infotype; 
    } 

    public void setInfotype(String infotype){ 
        this.infotype=infotype; 
    } 



}