package net.ktds.drink.support;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 * JSP/Servlet 기반?�� Project?��?�� ?��?��?�� Upload ?�� ?�� ?��?�� Utility
 * commons-fileupload�? ?��?��?��.
 * @author Minchang Jang (mc.jang@hucloud.co.kr)
 *
 */
public class MultipartHttpServletRequest {

	private HttpServletRequest request;
	private List<FileItem> items;
	
	/**
	 * ?��반적?�� HttpServletReqeust�? MultipartHttpServletRequest�? �??��?��?��.
	 * @param request
	 */
	public MultipartHttpServletRequest(HttpServletRequest request) {
		this.request = request;
		
		// Create a factory for disk-based file items
		DiskFileItemFactory factory = new DiskFileItemFactory();

		// Configure a repository (to ensure a secure temp location is used)
		ServletContext servletContext = request.getServletContext();
		File repository = (File) servletContext.getAttribute("javax.servlet.context.tempdir");
		factory.setRepository(repository);

		// Create a new file upload handler
		ServletFileUpload upload = new ServletFileUpload(factory);
		upload.setHeaderEncoding("UTF-8"); 
		
		try {
			items = upload.parseRequest(request);
		} catch (FileUploadException e) {
			throw new RuntimeException(e.getMessage(), e);
		}
	}
	
	/**
	 * request?��?�� Parameter�? �??��?��?��.
	 * @param name
	 * @return
	 */
	public String getParameter(String name) {
		for ( FileItem fileItem : items ) {
			if ( fileItem.getFieldName().equals(name) )  {
				try {
					return fileItem.getString("UTF-8");
				} catch (UnsupportedEncodingException e) {
					return fileItem.getString();
				}
			}
		}
		return null;
	}
	
	/**
	 * request?��?�� Parameter�? �??��?��?��.
	 * @param name
	 * @return
	 */
	public List<String> getParameterValue(String name) {
		List<String> values = new ArrayList<String>();
		
		for ( FileItem fileItem : items ) {
			if ( fileItem.getFieldName().equals(name) )  {
				try {
					values.add(fileItem.getString("UTF-8"));
				} catch (UnsupportedEncodingException e) {
					values.add(fileItem.getString());
				}
			}
		}
		return values;
	}
	
	/**
	 * Session?�� ?��?��?��?��.
	 * @return
	 */
	public HttpSession getSession() {
		return request.getSession();
	}
	
	/**
	 * RequestDispatcher�? ?��?��?��?��.
	 * @param jspPage
	 * @return
	 */
	public RequestDispatcher getRequestDispatcher(String jspPage) {
		return request.getRequestDispatcher(jspPage);
	}
	
	/**
	 * ?��로드?�� File Parameter�? ?��?��?��?��.
	 * @param name
	 * @return
	 */
	public MultipartFile getFile(String name) {
		MultipartFile file = new MultipartFile();
		
		for ( FileItem fileItem : items ) {
			if ( fileItem.getFieldName().equals(name) )  {
				file.setFileName(fileItem.getName());
				file.setFileSize(fileItem.getSize());
				file.setContentType(fileItem.getContentType());
				file.setFileItem(fileItem);
				
				return file;
			}
		}
		
		return null;
	}
	
	/**
	 * Upload ?�� ?��?��?�� ?��?��?��?���? ???��?�� ?��?��?��
	 * @author Minchang Jang (mc.jang@hucloud.co.kr)
	 *
	 */
	public class MultipartFile {
		private String fileName;
		private long fileSize;
		private String contentType;
		private FileItem fileItem;
		
		/**
		 * ?��?��?�� ?��름을 �??��?��?��.
		 * @return
		 */
		public String getFileName() {
			return fileName;
		}
		/**
		 * ?��?��?�� ?��름을 ?��?��?��?��.
		 * @param fileName
		 */
		public void setFileName(String fileName) {
			this.fileName = fileName;
		}

		/**
		 * ?��?��?�� ?��기�?? �??��?��?��.
		 * @return
		 */
		public long getFileSize() {
			return fileSize;
		}
		/**
		 * ?��?��?�� ?��기�?? ?��?��?��?��.
		 * @param fileSize
		 */
		public void setFileSize(long fileSize) {
			this.fileSize = fileSize;
		}

		/**
		 * ?��?��?�� Type?�� �??��?��?��.
		 * @return
		 */
		public String getContentType() {
			return contentType;
		}
		/**
		 * ?��?��?�� Type?�� ?��?��?��?��.
		 * @param contentType
		 */
		public void setContentType(String contentType) {
			this.contentType = contentType;
		}
		
		/**
		 * Upload ?�� File?�� ?��?��?��?���? ???��?��?�� FileItem(commons-fileupload ?��?��)
		 * @param fileItem
		 */
		public void setFileItem(FileItem fileItem) {
			this.fileItem = fileItem;
		}
		
		/**
		 * Upload ?�� ?��?��?�� �??��?�� ?��?��?�� ???��?��?��.
		 * @param dest
		 * @return
		 */
		public File write(String dest) {
			File file = new File(dest);
			try {
				fileItem.write(file);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return file;
		}
		
	}
	
}


