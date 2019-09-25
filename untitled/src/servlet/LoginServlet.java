package servlet;

import entity.User;
import impl.LoginManagerImpl;
import manager.LoginManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");//解决乱码问题
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        LoginManager loginManager = new LoginManagerImpl();
        try {
            User user = loginManager.login(username,password);
            //把用户的信息放到session中存起来
            HttpSession session = request.getSession();
            session.setAttribute("username", user);
            response.sendRedirect("/Books/main.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            request.getRequestDispatcher("/Books/error.jsp")
                    .forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
