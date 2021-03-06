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
 * JSP/Servlet κΈ°λ°? Project?? ??Ό? Upload ?  ? ?? Utility
 * commons-fileuploadλ₯? ?¬?©?¨.
 * @author Minchang Jang (mc.jang@hucloud.co.kr)
 *
 */
public class MultipartHttpServletRequest {

	private HttpServletRequest request;
	private List<FileItem> items;
	
	/**
	 * ?Όλ°μ ?Έ HttpServletReqeustλ₯? MultipartHttpServletRequestλ‘? λ³????€.
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
	 * request?? Parameterλ₯? κ°?? Έ?¨?€.
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
	 * request?? Parameterλ₯? κ°?? Έ?¨?€.
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
	 * Session? ?»?΄?¨?€.
	 * @return
	 */
	public HttpSession getSession() {
		return request.getSession();
	}
	
	/**
	 * RequestDispatcherλ₯? ?»?΄?¨?€.
	 * @param jspPage
	 * @return
	 */
	public RequestDispatcher getRequestDispatcher(String jspPage) {
		return request.getRequestDispatcher(jspPage);
	}
	
	/**
	 * ?λ‘λ? File Parameterλ₯? ?»?΄?¨?€.
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
	 * Upload ? ??Ό?΄ ??? ?Όλ‘? ???₯?  ?΄??€
	 * @author Minchang Jang (mc.jang@hucloud.co.kr)
	 *
	 */
	public class MultipartFile {
		private String fileName;
		private long fileSize;
		private String contentType;
		private FileItem fileItem;
		
		/**
		 * ??Ό? ?΄λ¦μ κ°?? Έ?¨?€.
		 * @return
		 */
		public String getFileName() {
			return fileName;
		}
		/**
		 * ??Ό? ?΄λ¦μ ?€? ??€.
		 * @param fileName
		 */
		public void setFileName(String fileName) {
			this.fileName = fileName;
		}

		/**
		 * ??Ό? ?¬κΈ°λ?? κ°?? Έ?¨?€.
		 * @return
		 */
		public long getFileSize() {
			return fileSize;
		}
		/**
		 * ??Ό? ?¬κΈ°λ?? ?€? ??€.
		 * @param fileSize
		 */
		public void setFileSize(long fileSize) {
			this.fileSize = fileSize;
		}

		/**
		 * ??Ό? Type? κ°?? Έ?¨?€.
		 * @return
		 */
		public String getContentType() {
			return contentType;
		}
		/**
		 * ??Ό? Type? ?€? ??€.
		 * @param contentType
		 */
		public void setContentType(String contentType) {
			this.contentType = contentType;
		}
		
		/**
		 * Upload ? File?΄ ??? ?Όλ‘? ???₯?? FileItem(commons-fileupload ? ?©)
		 * @param fileItem
		 */
		public void setFileItem(FileItem fileItem) {
			this.fileItem = fileItem;
		}
		
		/**
		 * Upload ? ??Ό? μ§?? ? ?₯?? ???₯??€.
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


