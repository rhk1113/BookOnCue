package bookOnCue.comment;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

/**
 * Servlet implementation class CommentUpadteAction
 */
@WebServlet("/CommentUpadteAction")
public class CommentUpadteAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentUpadteAction() {
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
//		no:commentnum,
//		post:postNo,
//		id:curUser,
//		text:text
		
		long no = Long.parseLong(request.getParameter("no"));
		long post = Long.parseLong(request.getParameter("post"));
		String id = request.getParameter("id");
		String text = request.getParameter("text");
		
		System.out.println(no);
		CommentDao commentDao = CommentDao.getInstance();
		CommentDto dto = new CommentDto(no, id, post, text);
		System.out.println(dto);
		commentDao.updateComment(dto, no);
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
