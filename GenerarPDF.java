/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlador;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chapter;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import dao.CestaDAO;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.NumberFormat;
import java.time.format.DateTimeFormatter;
import java.util.Locale;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.FacturaDAO;
import dao.PedidoDAO;
import dto.Factura;
import dto.Articulo;
import dto.Lineacesta;
import dto.Pedido;
import dto.TipoUsuario;
import dto.Usuario;
import java.util.ArrayList;
import javax.servlet.http.HttpSession;

/**
 *
 * @author jrmd
 */
public class GenerarPDF extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static final Font chapterFont = FontFactory.getFont(FontFactory.HELVETICA, 26, Font.BOLDITALIC);
    private static final Font paragraphFont = FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL);

    private static final Font categoryFont = new Font(Font.FontFamily.TIMES_ROMAN, 18, Font.BOLD);
    private static final Font subcategoryFont = new Font(Font.FontFamily.TIMES_ROMAN, 16, Font.BOLD);
    private static final Font blueFont = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.NORMAL, BaseColor.RED);
    private static final Font smallBold = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.BOLD);
    private static final Font totalBold = new Font(Font.FontFamily.TIMES_ROMAN, 14, Font.BOLD);

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setHeader("Content-disposition", "filename=factura.pdf");
        HttpSession session = request.getSession(false);
        Usuario usuarioSesion = (session != null && session.getAttribute("usuario") != null) ? (Usuario) session.getAttribute("usuario") : null;
        //Añadida por mi - Jraul
        Pedido pedi = new PedidoDAO().getByCodigo(Integer.valueOf(request.getParameter("id")));
        
        try (ServletOutputStream out = response.getOutputStream()) {
            // Recogemos el codigo de factura que se solicita exportar
            if (request.getParameter("id") != null) {
                int codigo = Integer.valueOf(request.getParameter("id"));
                /*
                Linea de Jose 
                Factura factura = new FacturaDAO().getByCodigo(codigo);
                */
                // Mi sustitución a la de arriba
                Factura factura = new FacturaDAO().getFacturaDelPedido(codigo);
                // Si la factura existe en la BD y además está asociada al mismo usuario que hay en la sesión entonces exportamos (excepto si es admin)
                //if (usuarioSesion != null && factura != null && (factura.getPedido().getCesta().getUsuario().equals(usuarioSesion) || usuarioSesion.getTipo() == TipoUsuario.ADMINISTRADOR)) {
                if (usuarioSesion != null && factura != null && (factura.getPedido().getDireccion().getUsuario().equals(usuarioSesion) || usuarioSesion.getTipo() == TipoUsuario.ADMINISTRADOR)) {
                    response.setHeader("Content-disposition", "filename=factura" + factura.getCodigo() + ".pdf");
                    createPDF(out, factura);
                }
            }

        } catch (SQLException ex) {
            System.out.println("Error SQL");
        }

    }

    public static String moneda(double valor) {
        NumberFormat currency = NumberFormat.getCurrencyInstance(Locale.ITALY);
        return currency.format(valor) + " ";
    }

    public void createPDF(OutputStream os, Factura factura) throws SQLException {
        try {
            
            Document document = new Document();
            PdfWriter.getInstance(document, os);
            document.open();
            document.addTitle("Factura " + factura.getCodigo());
            document.addAuthor("Samuel Hernandez Perez");

            // Primera página
            Chunk chunk = new Chunk("Factura nº " + factura.getCodigo(), chapterFont);
            chunk.setBackground(BaseColor.LIGHT_GRAY);
            // Let's create de first Chapter (Creemos el primer capítulo)
            Chapter chapter = new Chapter(new Paragraph(chunk), 1);
            chapter.setNumberDepth(0);

            //Usuario cliente = factura.getPedido().getCesta().getUsuario();
            Usuario cliente = factura.getPedido().getDireccion().getUsuario();
            chapter.add(new Paragraph(" ", subcategoryFont));
            chapter.add(new Paragraph("Datos del cliente:", subcategoryFont));
            chapter.add(new Paragraph("Nº cliente: " + cliente.getCodigo(), paragraphFont));
            chapter.add(new Paragraph("Nombre: " + cliente.getNombreCompleto(), paragraphFont));
            chapter.add(new Paragraph("E-mail: " + cliente.getEmail(), paragraphFont));
            chapter.add(new Paragraph("Teléfono: " + cliente.getTelefono(), paragraphFont));
            chapter.add(new Paragraph("Datos de la factura:", subcategoryFont));
            chapter.add(new Paragraph("Fecha: " + factura.getFecha().format(DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss")), paragraphFont));
            chapter.add(new Paragraph("Dirección: " + factura.getPedido().getDireccion().getProvincia() + ", " + factura.getPedido().getDireccion().getCp() + ", " + factura.getPedido().getDireccion().getTipo() + " " +factura.getPedido().getDireccion().getDireccion(), paragraphFont));

            chapter.add(new Paragraph("Líneas del pedido:", subcategoryFont));
            chapter.add(new Paragraph(" ", subcategoryFont));
            
            Integer numColumns = 6;
            Integer numRows = factura.getPedido().getCesta().getLineas().size() + 1;
            // Creamos la tabla.
            PdfPTable table = new PdfPTable(numColumns);
            // Ahora llenamos la tabla del PDF
            PdfPCell columnHeader;
            // rellenamos las filas de la tabla              

            columnHeader = new PdfPCell(new Phrase("CÓDIGO", smallBold));
            columnHeader.setHorizontalAlignment(Element.ALIGN_CENTER);
            table.addCell(columnHeader);
            columnHeader = new PdfPCell(new Phrase(" NOMBRE ", smallBold));
            columnHeader.setHorizontalAlignment(Element.ALIGN_CENTER);
            table.addCell(columnHeader);
            columnHeader = new PdfPCell(new Phrase(" PRECIO ", smallBold));
            columnHeader.setHorizontalAlignment(Element.ALIGN_CENTER);
            table.addCell(columnHeader);
            columnHeader = new PdfPCell(new Phrase("I.V.A.", smallBold));
            columnHeader.setHorizontalAlignment(Element.ALIGN_CENTER);
            table.addCell(columnHeader);
            columnHeader = new PdfPCell(new Phrase("CANTIDAD", smallBold));
            columnHeader.setHorizontalAlignment(Element.ALIGN_CENTER);
            table.addCell(columnHeader);
            columnHeader = new PdfPCell(new Phrase(" IMPORTE ", smallBold));
            columnHeader.setHorizontalAlignment(Element.ALIGN_CENTER);
            table.addCell(columnHeader);

            table.setHeaderRows(1);
            ArrayList<Lineacesta> l = new CestaDAO().getLineas(String.valueOf(factura.getPedido().getCodigo()) , cliente.getCodigo());
            // rellenamos las filas de la tabla.      
            double acum = 0;
            for (Lineacesta linea : l) {
                PdfPCell cell = new PdfPCell(Paragraph.getInstance(linea.getArticulo().getCodigo() + " "));
                cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
                cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                table.addCell(cell);
                cell = new PdfPCell(Paragraph.getInstance(linea.getArticulo().getNombre()));
                cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
                cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                table.addCell(cell);
                cell = new PdfPCell(Paragraph.getInstance(moneda(linea.getArticulo().getPvp())));
                cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
                cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
                table.addCell(cell);
                cell = new PdfPCell(Paragraph.getInstance("21% "));
                cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
                cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
                table.addCell(cell);
                cell = new PdfPCell(Paragraph.getInstance(linea.getCantidad() + " "));
                cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
                cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
                table.addCell(cell);
                cell = new PdfPCell(Paragraph.getInstance(moneda((linea.getTotalLinea() * 21))));
                cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
                cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
                table.addCell(cell);
                acum += linea.getTotalLinea();
            }

            table.setWidthPercentage(100);

            chapter.add(table);
            chapter.add(new Paragraph(" ", chapterFont));
            Paragraph paragraf = new Paragraph("BASE IMPONIBLE: " + moneda(acum), paragraphFont);
            paragraf.setAlignment(Element.ALIGN_RIGHT);
            chapter.add(paragraf);
            paragraf = new Paragraph("TOTAL FACTURA: " + moneda(acum * 21), totalBold);
            paragraf.setAlignment(Element.ALIGN_RIGHT);
            chapter.add(paragraf);

            document.add(chapter);
            document.close();
            System.out.println("Your PDF file has been generated!(¡Se ha generado tu hoja PDF!");

        } catch (DocumentException ex) {
            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(GenerarPDF.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(GenerarPDF.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

