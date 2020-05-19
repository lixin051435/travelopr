package entity.bean;

/**
 * News entity.
 *
 * @author MyEclipse Persistence Tools
 */

public class Guides implements java.io.Serializable {

    // Fields

    private Long id;
    private String gno;
    private String gname;
    private String sex;
    private String tel;


    // Constructors

    /**
     * default constructor
     */
    public Guides() {
    }

    /**
     * minimal constructor
     */
    public Guides(Long id) {
        this.id = id;
    }

    /**
     * full constructor
     */
    public Guides(
            Long id,
            String gno,
            String gname,
            String sex,
            String tel) {
        this.id = id;
        this.gno = gno;
        this.gname = gname;
        this.sex = sex;
        this.tel = tel;
    }

    // Property accessors

    public Long getId() {
        return this.id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getGno() {
        return this.gno;
    }

    public void setGno(String gno) {
        this.gno = gno;
    }

    public String getGname() {
        return this.gname;
    }

    public void setGname(String gname) {
        this.gname = gname;
    }

    public String getSex() {
        return this.sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getTel() {
        return this.tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }


}