package shop;

public class Cart {
    private String src;
    private String model;
    private int price;


    public Cart() {
    }

    public Cart(String src, String model, int price) {
        this.src = src;
        this.model = model;
        this.price = price;

    }

    public String getSrc() {
        return src;
    }

    public void setSrc(String src) {
        this.src = src;
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
}