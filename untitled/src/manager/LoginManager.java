package manager;

import entity.User;

public interface LoginManager {

    public User login(String username, String password);

}
