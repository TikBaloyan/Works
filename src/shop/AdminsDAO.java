package shop;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class AdminsDAO {
    public static List<Admins> adminsList = new ArrayList<>();

    public static boolean checkLP(String log, String psw) {
        Statement statement = null;
        ResultSet resultSet = null;
        try {
            statement = ConnectDB.connect().createStatement();
            resultSet = statement.executeQuery("SELECT * from admins where login='" + log + "' AND password='" + psw + "'");
            if (resultSet.next() == true) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return false;
    }

    public static void adminFill() {
        Statement statement = null;
        ResultSet resultSet = null;
        try {
            statement = ConnectDB.connect().createStatement();
            resultSet = statement.executeQuery("SELECT * from admins");
            while (resultSet.next()) {
                Admins admin = new Admins();
                admin.setAdminid(resultSet.getInt(1));
                admin.setName(resultSet.getString(2));
                admin.setSurname(resultSet.getString(3));
                admin.setLogin(resultSet.getString(4));
                adminsList.add(admin);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static List<Admins> getAdminsList() {
        return adminsList;
    }

    public static void insertAdmin(Admins admin) throws SQLException, ClassNotFoundException {
        PreparedStatement stmt = ConnectDB.connect().prepareStatement("INSERT into admins values(default, ?,?,?,?)");
        stmt.setString(1, admin.getName());
        stmt.setString(2, admin.getSurname());
        stmt.setString(3, admin.getLogin());
        stmt.setString(4, admin.getPassword());
        stmt.executeUpdate();
    }

    public static ArrayList<Admins> searchAdmins(Admins admins) {
        ArrayList<Admins> adminsArrayList = new ArrayList<>();
        Statement stmt = null;
        ResultSet resultSet = null;

        try {
            stmt = ConnectDB.connect().createStatement();
            resultSet = stmt.executeQuery("select * from admins where adminid ='" + admins.getAdminid() + "'" +
                    "or name like '" + admins.getName() + "%'" + "or surname like '" + admins.getSurname() + "%'" +
                    "or login like '" + admins.getLogin() + "%'");

            while (resultSet.next()) {
                Admins admins1 = new Admins();
                admins1.setAdminid(resultSet.getInt(1));
                admins1.setName(resultSet.getString(2));
                admins1.setSurname(resultSet.getString(3));
                admins1.setLogin(resultSet.getString(4));
                adminsArrayList.add(admins1);
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return adminsArrayList;
    }

    public static void updateAdmins(Admins admins) throws SQLException, ClassNotFoundException {
        PreparedStatement stmt = ConnectDB.connect().prepareStatement("UPDATE admins SET name=?, surname=?, login=?, password=? where adminid=?");

        stmt.setString(1, admins.getName());
        stmt.setString(2, admins.getSurname());
        stmt.setString(3, admins.getLogin());
        stmt.setString(4, admins.getPassword());
        stmt.setInt(5, admins.getAdminid());
        stmt.executeUpdate();

    }

    public static void deleteAdmin(Admins admin) throws SQLException, ClassNotFoundException {
        PreparedStatement stmt = ConnectDB.connect().prepareStatement("DELETE  from admins where adminid=?");
        stmt.setInt(1, admin.getAdminid());
        stmt.executeUpdate();
    }

    public static String adminName(String login) throws SQLException, ClassNotFoundException {
        String s = "";
        Statement statement = ConnectDB.connect().createStatement();
        ResultSet resultSet = statement.executeQuery("SELECT name from admins where login='" + login + "'");
        if (resultSet.next()) {
            s = resultSet.getString("name");
        }
        return s;
    }
}