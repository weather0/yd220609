<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.chartlist {
	width: 90%;
	margin: 0 auto;
	margin-top: 30px;
	display: flex;
}

.chart1 {
	width: 50%;
	height: 700px;
}

.chart2 {
	width: 50%;
	height: 700px;
}
</style>

<script
	src="https://cdn.jsdelivr.net/npm/chart.js@3.5.1/dist/chart.min.js"></script>
</head>
<body>
	<div class="chartlist">
		<div class="chart1">
			<!--차트가 그려질 부분-->
			<canvas id="myChart"></canvas>
		</div>
		<div class="chart2">
			<!--차트가 그려질 부분-->
			<canvas id="myChart2"></canvas>
		</div>
	</div>
    
    <script src="js/chart.js?ver=1"></script>
</body>
</html>