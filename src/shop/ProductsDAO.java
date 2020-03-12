package shop;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ProductsDAO {

    public static List<Products> productsList = new ArrayList<>();

    public static void productFill() throws SQLException, ClassNotFoundException {
        Statement statement = null;
        ResultSet resultSet = null;

        statement = ConnectDB.connect().createStatement();
        resultSet = statement.executeQuery("SELECT  * FROM products");
        while (resultSet.next()) {
            Products products = new Products();

            products.setProdid(resultSet.getInt(1));
            products.setModel(resultSet.getString(2));
            products.setPrice(resultSet.getInt(3));
            products.setCount(resultSet.getInt(4));
            products.setCatid(resultSet.getInt(5));
            productsList.add(products);
        }
    }

    public static List<Products> getProductsList() {
        return productsList;
    }

    public static boolean insertProducts(Products products) throws SQLException, ClassNotFoundException {
        PreparedStatement stmt = ConnectDB.connect().prepareStatement("INSERT into products values(default,?,?,?,?)");
        ResultSet resultSet = stmt.executeQuery("SELECT  catid from categories");
        while (resultSet.next()) {
            if (resultSet.getInt(1) == products.getCatid()) {
                stmt.setString(1, products.getModel());
                stmt.setInt(2, products.getPrice());
                stmt.setInt(3, products.getCount());
                stmt.setInt(4, products.getCatid());
                stmt.executeUpdate();
                return true;
            }
        }
        return false;
    }

    public static ArrayList<Products> searchProducts(Products products) throws SQLException, ClassNotFoundException {
        ArrayList<Products> prods = new ArrayList<>();
        Statement statement = ConnectDB.connect().createStatement();
        ResultSet resultSet = statement.executeQuery("SELECT * FROM products WHERE prodid=" + products.getProdid()
                + " or model like '" + products.getModel() + "%'" + " or price <= " + products.getPrice() + " or count <="
                + products.getCount() + " or catid=" + products.getCatid());
        while (resultSet.next()) {
            Products products1 = new Products();
            products1.setProdid(resultSet.getInt(1));
            products1.setModel(resultSet.getString(2));
            products1.setPrice(resultSet.getInt(3));
            products1.setCount(resultSet.getInt(4));
            products1.setCatid(resultSet.getInt(5));
            prods.add(products1);
        }
        return prods;
    }

    public static boolean updateProducts(Products products) throws SQLException, ClassNotFoundException {
        PreparedStatement stmt = ConnectDB.connect().prepareStatement("UPDATE products SET model=?, price=?, " +
                "count=?, catid=? where prodid=?");
        ResultSet resultSet = stmt.executeQuery("SELECT catid from categories");
        while (resultSet.next()) {
            if (resultSet.getInt(1) == products.getCatid()) {
                stmt.setString(1, products.getModel());
                stmt.setInt(2, products.getPrice());
                stmt.setInt(3, products.getCount());
                stmt.setInt(4, products.getCatid());
                stmt.setInt(5, products.getProdid());
                stmt.executeUpdate();
                return true;
            }
        }
        return false;
    }

    public static boolean deleteProducts(Products products) throws SQLException, ClassNotFoundException {
        PreparedStatement stmt = ConnectDB.connect().prepareStatement("Delete from products where prodid=?");
        ResultSet resultSet = stmt.executeQuery("SELECT prodid from products");
        while (resultSet.next()) {
            if (resultSet.getInt(1) == products.getProdid()) {
                stmt.setInt(1, products.getProdid());
                stmt.executeUpdate();
                return true;
            }
        }
        return false;
    }
}
