package entity.bean;

/**
 * News entity.
 *
 * @author MyEclipse Persistence Tools
 */

public class Article implements java.io.Serializable {

    // Fields

    private Long id;
    private String uname;
    private String ytitle;
    private String content;
    private String savetime;


    // Constructors

    /**
     * default constructor
     */
    public Article() {
    }

    /**
     * minimal constructor
     */
    public Article(Long id) {
        this.id = id;
    }

    /**
     * full constructor
     */
    public Article(
            Long id,
            String uname,
            String ytitle,
            String content,
            String savetime) {
        this.id = id;
        this.uname = uname;
        this.ytitle = ytitle;
        this.content = content;
        this.savetime = savetime;
    }

    // Property accessors

    public Long getId() {
        return this.id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUname() {
        return this.uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getYtitle() {
        return this.ytitle;
    }

    public void setYtitle(String ytitle) {
        this.ytitle = ytitle;
    }

    public String getContent() {
        return this.content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getSavetime() {
        return this.savetime;
    }

    public void setSavetime(String savetime) {
        this.savetime = savetime;
    }


}