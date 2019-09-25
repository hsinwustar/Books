package impl;

import dao.UserDAO;
import entity.User;
import manager.LoginManager;

public class LoginManagerImpl implements LoginManager {
    private UserDAO userDao = new UserDAO();

    @Override
    public User login(String username, String password) {

        User user = userDao.getUserById("username");
        if (user != null) {
            if (user.getPassword().equals(password)) {
                // 密码正确
                return user;
            }
//            } else {
//                // 密码错误
////                throw new UserNotFoundException("500");
//            }
//        } else {
//            //用户为空
////            throw new UserNotFoundException("404");
//        }
        }
    return null;
    }
}