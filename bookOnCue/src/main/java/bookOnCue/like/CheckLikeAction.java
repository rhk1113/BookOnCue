package bookOnCue.like;

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
@WebServlet("/CheckLikeAction")
public class CheckLikeAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckLikeAction() {
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
		LikeDao likeDao = LikeDao.getInstance();
		LikeDto dto = new LikeDto(user,isbn); 
		LikeDto likeDto = likeDao.getLikeByUserIsbn(dto);
		System.out.println("라이크체크의 라이크 디티오"+likeDto);
		
		PrintWriter res = response.getWriter();
		String json = new Gson().toJson(likeDto);
		
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
