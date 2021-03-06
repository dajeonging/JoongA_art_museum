<%@page import="java.util.ArrayList"%>
<%@page import="vo.ShowVO"%>
<%@page import="vo.BookingVO"%>
<%@page import="dao.BookingDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/header.css?after" />
<link rel="stylesheet" href="../css/footer.css" />
<link rel="stylesheet" href="../css/mainSection.css" />
<title>Insert title here</title>
<style>
html, body {
	box-sizing: border-box;
	padding: 0;
	margin: 0;
}

*, *:before, *:after {
	box-sizing: inherit;
}

.clearfix:after {
	content: '';
	display: block;
	clear: both;
	float: none;
}

/* ======== Calendar ======== */
.my-calendar {
	width: 700px;
	margin: 30px;
	padding: 20px 20px 10px;
	text-align: center;
	font-weight: 800;
	border: 1px solid #ddd;
	cursor: default;
}

.my-calendar .clicked-date {
	border-radius: 25px;
	margin-top: 36px;
	float: left;
	width: 42%;
	padding: 46px 0 26px;
	background: #ddd;
}

.my-calendar .calendar-box {
	float: right;
	width: 58%;
	padding-left: 30px;
}

.clicked-date .cal-day {
	font-size: 24px;
}

.clicked-date .cal-date {
	font-size: 130px;
}

.ctr-box {
	padding: 0 16px;
	margin-bottom: 20px;
	font-size: 20px;
}

.ctr-box .btn-cal {
	position: relative;
	float: left;
	width: 25px;
	height: 25px;
	margin-top: 5px;
	font-size: 16px;
	cursor: pointer;
	border: none;
	background: none;
}

.ctr-box .btn-cal:after {
	content: '<';
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	line-height: 25px;
	font-weight: bold;
	font-size: 20px;
}

.ctr-box .btn-cal.next {
	float: right;
}

.ctr-box .btn-cal.next:after {
	content: '>';
}

.cal-table {
	width: 100%;
}

.cal-table th {
	width: 14.2857%;
	padding-bottom: 5px;
	font-size: 16px;
	font-weight: 900;
}

.cal-table td {
	padding: 3px 0;
	height: 50px;
	font-size: 15px;
	vertical-align: middle;
}

.cal-table td.day {
	position: relative;
	cursor: pointer;
}

.cal-table td.today {
	background: #ffd255;
	border-radius: 50%;
	color: #fff;
}

.cal-table td.day-active {
	background: #ff8585;
	border-radius: 50%;
	color: #fff;
}

.cal-table td.has-event:after {
	content: '';
	display: block;
	position: absolute;
	left: 0;
	bottom: 0;
	width: 100%;
	height: 4px;
	background: #FFC107;
}

.my-calendar {
	margin-left: 30%;
}

.select {
	margin-left: 20%;
	border: 5px;
}

.CARD {
}

.price{
	border: 1px solid black;
	height: 25px;
	position: absolute;
	width: 100px;
	border-radius: 5px;
	text-align: right;
	
}

table {
  border-collapse: separate;
  border-spacing: 0 10px;
}

body{
		background-image: url("../images/bgh9.svg");
		background-size:100%;
		background-repeat: no-repeat;
	}

</style>
</head>
<body>
	<%
		String s = request.getParameter("ShowNo");
		
		/* out.println(s); */
	
		if(s != null && s != ""){
			
			int ShowNo = Integer.parseInt(s);
			
			BookingVO bvo = new BookingVO();
			
			BookingDAO dao = new BookingDAO();
			
			ShowVO svo = dao.selectOne(ShowNo);
			
			// ????????? ?????? ???????????? 
			int show_price = dao.ShowPri(ShowNo); 
			//out.println(show_price);
				
	%>
	
	<form action="reservationOk.jsp">
			<jsp:include page="header.jsp" />
		<input type="hidden" name="ShowNo" id="ShowNo" value="<%=ShowNo %>" />
			<div class="container" style="margin-top: 180px; font-family: 'G?????? ?????? TTF'; ">
			<h2>????????????</h2>
			<div class="select">
				<!-- ??????????????? -->
				<img src="<%= svo.getMainImg() %>" alt="???????????????" style="width: 400px; height: 450px; margin-left: 150px;"/>
				<br />
				<br />
				<br />
				<table class="payment">		
					<tr>
						<th style="width: 300px;">????????????</th>
						<td colspan="2"><input type="date" name="book_date" id="book_date"/></td>
					</tr>		
					<tr>
						<th>??????</th>
						<td><select name="pax" id="pax" style="width: 100px; border-radius: 5px;">
								<option value="0">????????????</option>
								<option value="1">1???</option>
								<option value="2">2???</option>
								<option value="3">3???</option>
								<option value="4">4???</option>
								<option value="5">5???</option>
						</select></td>
					</tr>
					<tr>
						<th>?????????</th>
						<td><select name="child" id="child" style="width: 100px; border-radius: 5px;">
								<option value="0">????????????</option>
								<option value="1">1???</option>
								<option value="2">2???</option>
								<option value="3">3???</option>
								<option value="4">4???</option>
								<option value="5">5???</option>
						</select></td>
					</tr>
					<tr>
						<th>??????</th>
						<td><select name="old" id="old" style="width: 100px; border-radius: 5px;">
								<option value="0">????????????</option>
								<option value="1">1???</option>
								<option value="2">2???</option>
								<option value="3">3???</option>
								<option value="4">4???</option>
								<option value="5">5???</option>
						</select></td>
					</tr>
					<tr>
						<th>??????</th>	
						<td class="price"><%= show_price %>???</td>
					</tr>
					<tr>
						<th>?????????</th>	
						<td class="price"><%= Math.round((show_price*(1-10*0.01))/100)*100 %>???</td>
					</tr>
					<tr>
						<th>??????</th>	
						<td class="price"><%= Math.round((show_price*(1-20*0.01))/100)*100 %>???</td>
					</tr>
					<tr>
						<th>????????????</th>
						<td><input type="text" name="cardno1" id="cardno1" style="width: 100px; height: 25px; border-radius: 5px; " maxlength="4" />-</td>
						<td><input type="text" name="cardno2" id="cardno2" style="width: 100px; height: 25px; border-radius: 5px; " maxlength="4" />-</td>
						<td><input type="password" name="cardno3" id="cardno3" style="width: 100px; height: 25px; border-radius: 5px; " maxlength="4" />-</td>
						<td><input type="password" name="cardno4" id="cardno4" style="width: 100px; height: 25px; border-radius: 5px; " maxlength="4" /></td>
					</tr>
					<tr>
						<th>CVC</th>
						<td><input type="text" name="cvc" id="cvc" style="width: 100px; height: 25px; border-radius: 5px;" maxlength="3" /></td>
					</tr>
					<tr>
						<th>????????????</th>
						<td><input type="password" name="cardpw" id="cardpw"
							style="width: 100px; height: 25px; border-radius: 5px; " maxlength="4" /></td>
					</tr>

				</table>
					<input type="hidden" name="book_price" id="book_price" value="<%= bvo.getBook_price() %>" />
					<input type="submit" value="????????????" style="width: 100px; height: 50px; border-radius: 10px; background: black; color: white;
					margin-left: 300px; margin-top: 50px; " /> 
					<input type="reset" value="??????" style="width: 100px; height: 50px; border-radius: 10px; background: black; color: white; 
					 margin-left: 25px;	" />
			</div>
		</div>
	</form>
	<jsp:include page="footer.jsp"></jsp:include>
	
	<%
		}
	%>
	
</body>
</html>