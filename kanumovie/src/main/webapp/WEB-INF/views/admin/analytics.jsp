<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.chartlist {
	width: 80%;
	margin: 0 auto;
	margin-top: 30px;
	display: flex;
}

.chart1 {
	width: 50%;
	height: 600px;
}

.chart2 {
	width: 50%;
	height: 600px;
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
	<script>
      const ctx = document.getElementById("myChart").getContext("2d");
      const myChart = new Chart(ctx, {
        type: "bar",
        data: {
          labels: ["액션", "로맨스", "호러", "Green", "Purple", "Orange"],
          datasets: [
            {
              label: "# of Votes",
              data: [12, 19, 3, 5, 2, 3],
              backgroundColor: [
                "rgba(255, 99, 132, 0.2)",
                "rgba(54, 162, 235, 0.2)",
                "rgba(255, 206, 86, 0.2)",
                "rgba(75, 192, 192, 0.2)",
                "rgba(153, 102, 255, 0.2)",
                "rgba(255, 159, 64, 0.2)",
              ],
              borderColor: [
                "rgba(255, 99, 132, 1)",
                "rgba(54, 162, 235, 1)",
                "rgba(255, 206, 86, 1)",
                "rgba(75, 192, 192, 1)",
                "rgba(153, 102, 255, 1)",
                "rgba(255, 159, 64, 1)",
              ],
              borderWidth: 1,
            },
          ],
        },
        options: {
          plugins: {
            title: {
              display: true,
              text: "유저 선호 장르",
              font: {
                size: 20,
              },
            },
            legend: {
              labels: {
                font: {
                  size: 20,
                },
              },
            },
          },
          scales: {
            x: {
              ticks: {
                font: {
                  size: 20,
                },
              },
            },
            y: {
              beginAtZero: true,
              ticks: {
                font: {
                  size: 20,
                  family: "vazir",
                },
              },
            },
          },
        },
      });

      const ctx2 = document.getElementById("myChart2").getContext("2d");
      const myChart2 = new Chart(ctx2, {
        type: "line",
        data: {
          labels: ["Red", "Blue", "Yellow", "Green", "Purple", "Orange"],
          datasets: [
            {
              label: "# of Votes",
              data: [12, 19, 3, 5, 2, 3],
              backgroundColor: [
                "rgba(255, 99, 132, 0.2)",
                "rgba(54, 162, 235, 0.2)",
                "rgba(255, 206, 86, 0.2)",
                "rgba(75, 192, 192, 0.2)",
                "rgba(153, 102, 255, 0.2)",
                "rgba(255, 159, 64, 0.2)",
              ],
              borderColor: [
                "rgba(255, 99, 132, 1)",
                "rgba(54, 162, 235, 1)",
                "rgba(255, 206, 86, 1)",
                "rgba(75, 192, 192, 1)",
                "rgba(153, 102, 255, 1)",
                "rgba(255, 159, 64, 1)",
              ],
              borderWidth: 1,
            },
          ],
        },
        options: {
          plugins: {
            title: {
              display: true,
              text: "Chart Title",
              font: {
                size: 20,
              },
            },
            legend: {
              labels: {
                font: {
                  size: 20,
                },
              },
            },
          },
          scales: {
            x: {
              ticks: {
                font: {
                  size: 20,
                },
              },
            },
            y: {
              beginAtZero: true,
              ticks: {
                font: {
                  size: 20,
                  family: "vazir",
                },
              },
            },
          },
        },
      });
    </script>
</body>
</html>