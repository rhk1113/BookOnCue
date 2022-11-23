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
 * Servlet implementation class LikeToggleAction
 */
@WebServlet("/WishToggleAction")
public class WishToggleAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WishToggleAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		response.setContentType("application/json");
		request.setCharacterEncoding("utf-8");
		String user= request.getParameter("user");
		String isbn= request.getParameter("likeisbn");
		System.out.println("toggleisbn:"+isbn);
		WishDao wishDao = WishDao.getInstance();
		WishDto checkDto = wishDao.getWishByUserIsbn(user, isbn);
		System.out.println("확인용디티오"+checkDto);
		
		String result;
		wishDao = WishDao.getInstance();
		
		if(checkDto!= null) {
			long no = checkDto.getNo();
			wishDao = WishDao.getInstance();
			wishDao.deleteWish(no);
			System.out.println("좋아요 해제");
			result = "off";
		}else {
			wishDao = WishDao.getInstance();
			wishDao.createWish(new WishDto(user,isbn));
			System.out.println("좋아요 체크");
			result = "on";
		}
		
		PrintWriter res = response.getWriter();
		res.print(new Gson().toJson(result));
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
