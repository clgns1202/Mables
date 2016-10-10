<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/Mables/js/jquery-3.1.1.js"></script>
<script type="text/javascript">

$(function(){ 
	  $('.bt_up').click(function(){ 
	    var n = $('.bt_up').index(this);
	    var num = $(".num:eq("+n+")").val();
	    num = $(".num:eq("+n+")").val(num*1+1); 
	  });
	  $('.bt_down').click(function(){ 
	    var n = $('.bt_down').index(this);
	    var num = $(".num:eq("+n+")").val();
	    num = $(".num:eq("+n+")").val(num*1-1); 
	  });
	}) 
	  
</script>
</head>
<body>
<div id="goods_list">
  <form>
    <table>
      <tr>
        <td>선택</td>
        <td>박스</td>
        <td>입수</td>
        <td>수량</td>
      </tr>
      <tr>
        <td><input type="checkbox" name="checkbox" value="1" style="border:0"></td>
        <td>
          <table>
            <tr>
              <td><input type="text" name="num" value="1" id="" class="num"/></td>
              <td>
                <div>
                  <img src="http://placehold.it/10x10" alt="" width="10" height="10" class="bt_up"/>
                </div>
                <div>
                  <img src="http://placehold.it/10x10" alt="" width="10" height="10" class="bt_down" />
                </div>
              </td>
            </tr>
          </table>
        </td>
        <td>12</td>
        <td><div class="total_num">12</div></td>
      </tr>
    </table>
  </form>
 
  <form>
    <table align='' border='1' cellspacing='0' cellpadding='0'>
      <tr>
        <td>선택</td>
        <td>박스</td>
        <td>입수</td>
        <td>수량</td>
      </tr>
      <tr>
        <td><input type="checkbox" name="checkbox" value="1" style="border:0"></td>
        <td>
          <table>
            <tr>
              <td><input type="text" name="num" value="1" id="" class="num"/></td>
              <td>
                <div>
                  <img src="http://placehold.it/10x10" alt="" width="10" height="10" class="bt_up"/>
                </div>
                <div>
                  <img src="http://placehold.it/10x10" alt="" width="10" height="10" class="bt_down" />
                </div>
              </td>
            </tr>
          </table>
        </td>
        <td>12</td>
        <td><div class="total_num">12</div></td>
      </tr>
    </table>
  </form>
  </div>
</body>
</html>