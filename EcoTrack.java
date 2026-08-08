import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/api/buscar-horarios")
public class EcoTrack extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.setHeader("Access-Control-Allow-Origin", "*");
        
        String nombreColonia = request.getParameter("colonia");
        PrintWriter out = response.getWriter();
        
        if (nombreColonia == null || nombreColonia.trim().isEmpty()) {
            out.print("{\"status\":\"error\", \"mensaje\":\"Debe ingresar una colonia\"}");
            return;
        }
        
        String sql = "SELECT c.nombre_colonia, r.nombre_ruta, h.dias, h.turno, h.hora_estimada_inicio " +
                     "FROM colonias c " +
                     "JOIN rutas r ON c.ruta_id = r.id " +
                     "JOIN horarios h ON r.horario_id = h.id " +
                     "WHERE c.nombre_colonia LIKE ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, "%" + nombreColonia + "%");
            ResultSet rs = stmt.executeQuery();
            
            StringBuilder jsonResponse = new StringBuilder();
            jsonResponse.append("{\"status\":\"success\", \"datos\": [");
            
            boolean first = true;
            while (rs.next()) {
                if (!first) jsonResponse.append(",");
                jsonResponse.append("{");
                jsonResponse.append("\"colonia\":\"").append(rs.getString("nombre_colonia")).append("\",");
                jsonResponse.append("\"ruta\":\"").append(rs.getString("nombre_ruta")).append("\",");
                jsonResponse.append("\"dias\":\"").append(rs.getString("dias")).append("\",");
                jsonResponse.append("\"turno\":\"").append(rs.getString("turno")).append("\",");
                jsonResponse.append("\"hora_inicio\":\"").append(rs.getString("hora_estimada_inicio")).append("\"");
                jsonResponse.append("}");
                first = false;
            }
            jsonResponse.append("]}");
            
            out.print(jsonResponse.toString());
            
        } catch (Exception e) {
            out.print("{\"status\":\"error\", \"mensaje\":\"Error en la base de datos: " + e.getMessage() + "\"}");
        }
        out.flush();
    }
}