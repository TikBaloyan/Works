package shop;

public class Categories {
    private int catid;
    private String name;
    private String src;

    public Categories() {
    }

    public Categories(int catid, String name, String src) {
        this.catid = catid;
        this.name = name;
        this.src = src;
    }

    public int getCatid() {
        return catid;
    }

    public void setCatid(int catid) {
        this.catid = catid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSrc() {
        return src;
    }

    public void setSrc(String src) {
        this.src = src;
    }

    @Override
    public String toString() {
        return "Categories{" +
                "catid=" + catid +
                ", name='" + name + '\'' +
                ", src='" + src + '\'' +
                '}';
    }
}