package bookOnCue.board;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

/**
 * Servlet implementation class DetailBookReviewAction
 */
@WebServlet("/DetailBookReviewAction")
public class DetailBookReviewAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DetailBookReviewAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json");
		request.setCharacterEncoding("utf-8");
		String query = request.getParameter("getisbn");
		System.out.println(query);

		BoardDao boardDao = BoardDao.getInstance();
		ArrayList<BoardDto> list= boardDao.readBoardByIsbn(query);
		System.out.println(list);

		ArrayList<BoardDto> bookReview = new ArrayList<BoardDto>();
		for(BoardDto dto : list){ 
		 	if(dto.getDivision()==2) {
			bookReview.add(dto);
			}
		}

		PrintWriter res = response.getWriter();
		String json = new Gson().toJson(bookReview);
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
