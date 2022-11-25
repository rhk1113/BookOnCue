package bookOnCue.user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




/**
 * Servlet implementation class UserUpdateAction
 */
@WebServlet("/UserUpdateAction")
public class UserUpdateAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserUpdateAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("application/json");
		request.setCharacterEncoding("utf-8");
		UserDao userDao =UserDao.getinstance();
		UserDto userDto = null;

		String id = request.getParameter("user");
		userDto = userDao.readUserById(id);
		
		String password = request.getParameter("pw");
		if(password!=null){
			userDto.setPassword(password);
		}
		String name = request.getParameter("name");
		if(name !=null){
			userDto.setName(name);
		}
		String nickname = request.getParameter("nickname");
		if(nickname !=null){
			userDto.setNickname(nickname);
		}
		String address = request.getParameter("address");
		if(address !=null){
			userDto.setAddress(address);
		}
		userDto = new UserDto(password, name, address, nickname);
		userDao.UpdateUserById(userDto,id);
		System.out.println("저장완료");	
//		response.sendRedirect("myPage.jsp");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		doGet(request, response);
	}

}
