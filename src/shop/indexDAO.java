package shop;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class indexDAO {
    public static ArrayList<searchResult> mainSearch(String s) throws SQLException, ClassNotFoundException {
        ArrayList<searchResult> searchResults = new ArrayList<>();
        Statement statement = ConnectDB.connect().createStatement();
        ResultSet resultSet = statement.executeQuery("SELECT categories.`images`,products.`model`,products.`price` FROM categories,products " +
                "WHERE categories.`catid`=products.`catid` AND categories.`name` LIKE '%" + s + "%'");
        while (resultSet.next()) {
            searchResult searchResult = new searchResult();
            searchResult.setSrc(resultSet.getString("images"));
            searchResult.setModel(resultSet.getString("model"));
            searchResult.setPrice(resultSet.getInt("price"));
            searchResults.add(searchResult);
        }
        if (searchResults.size() == 0) {
            ResultSet resultSet1 = statement.executeQuery("SELECT categories.`images`,products.`model`,products.`price` FROM categories,products " +
                    "WHERE categories.`catid`=products.`catid` AND products.`model` LIKE '%" + s + "%'");
            while (resultSet1.next()) {
                searchResult searchResult = new searchResult();
                searchResult.setSrc(resultSet1.getString("images"));
                searchResult.setModel(resultSet1.getString("model"));
                searchResult.setPrice(resultSet1.getInt("price"));
                searchResults.add(searchResult);
            }
        }
        return searchResults;
    }
}