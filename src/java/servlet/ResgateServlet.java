package servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;


@WebServlet(name="resgate", urlPatterns = {"/resgate"})
public class ResgateServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        try {
            String url = "https://run.mocky.io/v3/ca4ec77d-b941-4477-8a7f-95d4daf7a653";
            URL obj = new URL(url);
            HttpURLConnection con = (HttpURLConnection) obj.openConnection();
            int responseCode = con.getResponseCode();
            BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
            String inputLine; StringBuffer response_url = new StringBuffer();
            
            while ((inputLine = in.readLine()) != null) {
                response_url.append(inputLine);
            }
            
            in.close();
            
            request.setAttribute("resp", response_url.toString());
                
                        
        } catch (Exception e) {e.printStackTrace();}
        
        request.getRequestDispatcher("/WEB-INF/resgate.jsp").forward(request, response);
 
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //processRequest(request, response);
        //String nome = request.getParameter("Ademario");
    }

 

}
