package net.ktds.drink.support.pager;

public class ListPageExplorer implements PageExplorer {

	private Pager pager;
	
	public ListPageExplorer(Pager pager) {
		this.pager = pager;
	}
	
	/**
	 * JSP?? Paging κ²°κ³Όλ₯? λ³΄μ¬μ€??€.
	 * getPagingList? &lt;form> ?κ·? ?? ??±??΄?Ό ??€.
	 * @param link Page λ²νΈλ₯? ? ?¬?  Parameter Name
	 * @param pageFormat Page λ²νΈλ₯? λ³΄μ¬μ€? ?¨?΄ @(at)κ°? ??΄μ§? λ²νΈλ‘? μΉν??€. [@]λ‘? ??±?  κ²½μ° [1] [2] [3] μ²λΌ λ³΄μ¬μ§λ€.
	 * @param prev ?΄?  ??΄μ§? κ·Έλ£Ή?Όλ‘? κ°?? λ²νΌ? ?΄λ¦μ ??±??€.
	 * @param next ?€? ??΄μ§? κ·Έλ£Ή?Όλ‘? κ°?? λ²νΌ? ?΄λ¦μ ??±??€.
	 * @param formId ?λ²μκ²? ? ?¬?  Form ? ??΄?λ₯? ??±??€.
	 * @return
	 */
	public String getPagingList(String link, String pageFormat, String prev, String next, String formId) {

		StringBuffer buffer = new StringBuffer();
		buffer.append("<script>");
		buffer.append("function movePage(pageNo) {");
		buffer.append("$(\"#"+link+"\").val(pageNo);");
		buffer.append("$(\"#"+formId+"\").attr('action', '');");
		buffer.append("$(\"#"+formId+"\").attr('method', 'post');");
		buffer.append("$(\"#"+formId+"\").submit();");
		buffer.append("}");
		buffer.append("</script>");
		
		buffer.append("<input type=\"hidden\" id=\""+link+"\" name=\""+link+"\" />");
		
		int centerPage = pager.printPage / 2;
		int startPageNumber = pager.pageNo - centerPage;
		if ( startPageNumber < 0 ) {
			startPageNumber = 0;
		}
		
		int endPageNumber = startPageNumber + pager.printPage;
		if ( endPageNumber > pager.totalPage ) {
			endPageNumber = pager.totalPage;
		}
		
		if ( endPageNumber - startPageNumber < pager.printPage ) {
			startPageNumber = startPageNumber - (pager.printPage - (endPageNumber - startPageNumber));
		}
		
		String pageNumber = "";
		
		if ( startPageNumber > 0 ) {
			buffer.append("<a href=\"javascript:movePage('" + (pager.pageNo - 1) + "')\">" + prev + "</a>");
		}
		
		for (int i = startPageNumber; i < endPageNumber; i++) {
			pageNumber = pageFormat.replaceAll("@", (i+1) + "");
			if (i == pager.pageNo) {
				pageNumber = "<b>" + pageNumber + "</b>";
			}
			
			buffer.append("<a href=\"javascript:movePage('" + i + "')\">" + pageNumber + "</a>");
		}
		
		if ( pager.pageNo < endPageNumber ) {
			buffer.append("<a href=\"javascript:movePage('" + (pager.pageNo + 1) + "')\">" + next + "</a>");
		}

		return buffer.toString();
	}
	
}
