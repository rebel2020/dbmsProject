package com.brijesh;

import java.nio.file.Paths;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Base64;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.mysql.cj.xdevapi.Statement;

@Controller
public class ImageController {
	@RequestMapping("uploadimage")
	public String uploadImage(Model model,HttpSession session)
	{
		return "imageUpload";
	}
	
	@RequestMapping("getimage")
	public String getImage(Model model) throws ClassNotFoundException, SQLException, IOException
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/rebel", "root", "Rebel@123");
		java.sql.Statement st=con.createStatement();
		System.out.println(getClass().getResource("../../../.././resources/static/images"));
		File file=new File(getClass().getResource("../../../../resources/static/images/bee.jpg").toString().substring(5));
		FileOutputStream fos=new FileOutputStream(file);
		ResultSet rs=st.executeQuery("select * from img");
		if(rs.next())
		{
			Blob b=rs.getBlob("img");
			if(b==null)
				return "showImage";
			byte[] c=b.getBytes(1, (int)b.length());
			String encode=Base64.getEncoder().encodeToString(c);
			model.addAttribute("image",encode);
			fos.write(c);
		}
		st.close();
		con.close();
		fos.close();
		return "showImage";
	}
	@RequestMapping("loadimage")
	public String loadImage(Model model,@RequestParam CommonsMultipartFile file,HttpSession session) throws ClassNotFoundException, SQLException, IOException
	{
		byte[] barr=file.getBytes();
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/rebel", "root", "Rebel@123");
		InputStream fis2=file.getInputStream();
		PreparedStatement ps=con.prepareStatement("insert into img set img=?");
		ps.setBinaryStream(1, fis2,(int)barr.length);
		ps.executeUpdate();
		ps.close();
		con.close();
		fis2.close();
		return "home";
	}
}
