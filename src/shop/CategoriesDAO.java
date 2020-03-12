package shop;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class CategoriesDAO {

    public static List<Categories> categoriesList = new ArrayList<>();

    public static void categoriesFill() {
        Statement statement = null;
        ResultSet resultSet = null;
        try {
            statement = ConnectDB.connect().createStatement();
            resultSet = statement.executeQuery("SELECT * from categories");
            while (resultSet.next()) {
                Categories categories = new Categories();
                categories.setCatid(resultSet.getInt(1));
                categories.setName(resultSet.getString(2));
                categoriesList.add(categories);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static List<Categories> getCategoriesList() {
        return categoriesList;
    }

    public static void insertCategories(Categories categories) throws SQLException, ClassNotFoundException {
        PreparedStatement stmt = ConnectDB.connect().prepareStatement("INSERT into categories values(default, ?, ?)");
        stmt.setString(1, categories.getName());
        stmt.setString(2,categories.getSrc());
        stmt.executeUpdate();
    }

    public static ArrayList<Categories> searchCategories(Categories categories) throws SQLException, ClassNotFoundException {
        ArrayList<Categories> category = new ArrayList<>();
        Statement statement = ConnectDB.connect().createStatement();
        ResultSet resultSet = statement.executeQuery("SELECT * from categories where catid=" + categories.getCatid() +
                " or name like '" + categories.getName() + "%'");
        while (resultSet.next()) {
            Categories categories1 = new Categories();
            categories1.setCatid(resultSet.getInt(1));
            categories1.setName(resultSet.getString(2));
            category.add(categories1);
        }
        return category;
    }

    public static boolean updateCategories(Categories categories) throws SQLException, ClassNotFoundException {
        PreparedStatement stmt = ConnectDB.connect().prepareStatement("UPDATE categories SET name=?, images=? where catid=?");
        ResultSet resultSet = stmt.executeQuery("SELECT catid from categories");
        while (resultSet.next()) {
            if (resultSet.getInt(1) == categories.getCatid()) {
                stmt.setString(1, categories.getName());
                stmt.setString(2, categories.getSrc());
                stmt.setInt(3, categories.getCatid());
                stmt.executeUpdate();
                return true;
            }
        }
        return false;
    }

    public static void deleteCategories(Categories categories) throws SQLException, ClassNotFoundException {
        PreparedStatement stmt = ConnectDB.connect().prepareStatement("Delete from categories where catid=?");

        stmt.setInt(1, categories.getCatid());
        stmt.executeUpdate();
    }
}