package edu;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Scanner;

// JDBC IMPORTS - REQUIRED FOR DATABASE CONNECTION
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/FileUploadServlet")
@MultipartConfig(fileSizeThreshold=1024*1024*10, 	// 10 MB - File size before writing to disk
			   maxFileSize=1024*1024*50,    	// 50 MB - Max size for a single file (Level 2b)
			   maxRequestSize=1024*1024*100) 	// 100 MB - Max size for the entire request
public class FileUploadServlet extends HttpServlet {

    private static final long serialVersionUID = 205242440643911308L;
	
    // Directory where uploaded files will be saved relative to the web application
    private static final String UPLOAD_DIR = "uploads";
    
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        
        // Gets absolute path of the web application 
        String applicationPath = request.getServletContext().getRealPath("");

        // Constructs full path of the directory to save the uploaded file
        String uploadFilePath = applicationPath + File.separator + UPLOAD_DIR;

        // Creates the save directory if it does not exist
        File fileSaveDir = new File(uploadFilePath);
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdirs();
        }
        System.out.println("Upload File Directory="+fileSaveDir.getAbsolutePath());

        String fileName = "";
        Part filePart = null; // Variable to hold the file Part for metadata
        
        // Get all parts from request and write the file to the server
        for (Part part : request.getParts()) {
            if ("fileName".equals(part.getName())) { // Only process the file part from the HTML form
                filePart = part;
                fileName = getFileName(part);
                
                // Clean up filename for various browsers
                fileName = fileName.substring(fileName.lastIndexOf("\\") + 1); 
                
                // 1. SAVE THE FILE TO THE DISK
                part.write(uploadFilePath + File.separator + fileName);
            }
        }

        String message = "File Upload Result";
        // This attempts to read the file content, useful for text files
        String content = "";
        try {
            content = new Scanner(new File(uploadFilePath + File.separator + fileName)).useDelimiter("\\Z").next();
        } catch (IOException e) {
            content = "Could not read file content.";
        }
        
        // =================================================================================
        // LEVEL 2a: INTEGRATE REMOTE DB CONNECTION TO STORE FILE METADATA
        // =================================================================================
        Connection conn = null;
        PreparedStatement ps = null;

        // DB CONNECTION DETAILS (my username and pass)
        String dbURL = "jdbc:mysql://127.0.0.1:3306/db_repo?useSSL=true&allowPublicKeyRetrieval=true&autoReconnect=true";
        String dbUser = "sha";
        String dbPass = "sha2025";
        String storagePath = uploadFilePath + File.separator + fileName;

        try {
            // Load the JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver"); 

            // Establish Connection
            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

            // SQL INSERT statement for your uploaded_files table
            String sql = "INSERT INTO uploaded_files (file_name, file_type, file_size_kb, storage_path) VALUES (?, ?, ?, ?)";
            ps = conn.prepareStatement(sql);

            // Get file 
            long fileSizeKB = filePart.getSize() / 1024;
            String fileType = fileName.substring(fileName.lastIndexOf(".") + 1);

            // Set parameters
            ps.setString(1, fileName);      // file_name
            ps.setString(2, fileType);      // file_type (e.g., pdf, jpg, txt)
            ps.setLong(3, fileSizeKB);      // file_size_kb
            ps.setString(4, storagePath);   // storage_path 
            
            // Execute the INSERT
            ps.executeUpdate();
            
            message = "SUCCESS: File '" + fileName + "' uploaded and database record created.";

        } catch (SQLException ex) {
            ex.printStackTrace();
            message = "DATABASE ERROR: Could not connect or insert data. Details: " + ex.getMessage();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
            message = "DRIVER ERROR: MySQL JDBC driver not found. Check project's lib folder.";
        } finally {
            // Close database resources to prevent connection leaks
            try {
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        // =================================================================================

        // Write the final message back to the user
        response.getWriter().write(message + "<BR>" + content);
	}

    // Utility method to get file name from HTTP header content-disposition
    private String getFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        System.out.println("content-disposition header= "+contentDisp);
        String[] tokens = contentDisp.split(";");
        for (String token : tokens) {
            if (token.trim().startsWith("filename")) {
                // The filename value often includes quotes, so we strip them
                return token.substring(token.indexOf("=") + 2, token.length()-1);
            }
        }
        return "";
    }
    
    // Utility method to write response content 
	private void writeToResponse(HttpServletResponse resp, String results) throws IOException {
		PrintWriter writer = new PrintWriter(resp.getOutputStream());
		resp.setContentType("text/plain");

		if (results.isEmpty()) {
			writer.write("No results found.");
		} else {
			writer.write(results);
		}
		writer.close();
	}	
	
}