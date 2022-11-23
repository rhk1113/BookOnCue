package bookOnCue.wish;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

/**
 * Servlet implementation class CheckLikeAction
 */
@WebServlet("/CheckWishAction")
public class CheckWishAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckWishAction() {
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
		String user= request.getParameter("user");
		String isbn= request.getParameter("likeisbn");
		
		System.out.println("isbn:"+isbn);
		WishDao wishDao = WishDao.getInstance();
		WishDto dto = new WishDto(user,isbn); 
		WishDto wishDto = wishDao.getWishByUserIsbn(user, isbn);
		System.out.println("라이크체크의 라이크 디티오"+wishDto);
		
		PrintWriter res = response.getWriter();
		String json = new Gson().toJson(wishDto);
		
		if(json == null) {
			System.out.println("아무것도 없음");
		}
		System.out.println(json);
		res.println(json);
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
