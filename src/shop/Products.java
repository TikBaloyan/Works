package shop;

public class Products {
    private int prodid;
    private String model;
    private int price;
    private int count;
    private int catid;

    public Products() {
    }

    public Products(int prodid, String model, int price, int count, int catid) {
        this.prodid = prodid;
        this.model = model;
        this.price = price;
        this.count = count;
        this.catid = catid;
    }

    public int getProdid() {
        return prodid;
    }

    public void setProdid(int prodid) {
        this.prodid = prodid;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public int getCatid() {
        return catid;
    }

    public void setCatid(int catid) {
        this.catid = catid;
    }

    @Override
    public String toString() {
        return "Products{" +
                "prodid=" + prodid +
                ", model='" + model + '\'' +
                ", price=" + price +
                ", count=" + count +
                ", catid=" + catid +
                '}';
    }
}
