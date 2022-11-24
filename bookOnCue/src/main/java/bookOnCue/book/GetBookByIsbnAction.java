package bookOnCue.book;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import bookOnCue.board.BoardDao;
import bookOnCue.board.BoardDto;

/**
 * Servlet implementation class GetImgByIsbnAction
 */
@WebServlet("/GetBookByIsbnAction")
public class GetBookByIsbnAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetBookByIsbnAction() {
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
		String isbn = request.getParameter("isbn");

		BookDao bookDao = BookDao.getInstance();
		BookDto dto= bookDao.getBookByIsbn(isbn);
		System.out.println(dto);

		PrintWriter res = response.getWriter();
		String json = new Gson().toJson(dto);
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
