package shop;

public class Admins {
    private int adminid;
    private String name;
    private String surname;
    private String login;
    private String password;

    public Admins() {
    }

    public Admins(int adminid, String name, String surname, String login, String password) {
        this.adminid = adminid;
        this.name = name;
        this.surname = surname;
        this.login = login;
        this.password = password;
    }

    public int getAdminid() {
        return adminid;
    }

    public void setAdminid(int adminid) {
        this.adminid = adminid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "Admins{" +
                "adminid=" + adminid +
                ", name='" + name + '\'' +
                ", surname='" + surname + '\'' +
                ", login='" + login + '\'' +
                ", password='" + password + '\'' +
                '}';
    }
}
