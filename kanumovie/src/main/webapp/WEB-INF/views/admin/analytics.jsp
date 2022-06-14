<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.h1color {

	color:white;
}
</style>


<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
</head>
<body>

<div style="width: 800px; height: 800px;">
	<!--차트가 그려질 부분-->
	<canvas id="myChart"></canvas>
</div>

<div style="width: 800px; height: 300px;">

<canvas id="mychart2"></canvas>
</div>

<script type="text/javascript">


let context = document.getElementById('myChart').getContext('2d');
let myChart = new Chart(context, {
	 type: 'line',
	    data:  { // 차트에 들어갈 데이터
            labels: [
                //x 축
                '액션','호러','로맨스','무협','주호쨩','임경쨩'
            ],datasets: [
                { //데이터
                    label: '라벨차트제목',//차트 제목
                    fill: true, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                    data: [
                        100,19,25,20,23,26 //x축 label에 대응되는 데이터 값
                    ],
                    backgroundColor: [
                        //색상
                        'rgba(255, 99, 132, 0.6)',
                        'rgba(54, 162, 235, 0.6)',
                        'rgba(255, 206, 86, 0.6)',
                        'rgba(75, 192, 192, 0.6)',
                        'rgba(153, 102, 255, 0.6)',
                        'rgba(255, 159, 64, 0.6)'
                    ],
                    borderColor: [
                        //경계선 색상
                        'rgba(255, 99, 132, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(153, 102, 255, 1)',
                        'rgba(255, 159, 64, 1)'
                    ],
                    borderWidth: 1 //경계선 굵기
                } 
            ]
        },
	    options: {
	        plugins: {
	            title: {
	                display: true,
	                text: 'Custom Chart Title',
	                	 padding: {
	                         top: 100,
	                         bottom: 10
	                     }
	            }
	        }
	    }
});


           /*  var context = document
                .getElementById('myChart')
                .getContext('2d');
            var myChart = new Chart(context, {
                type: 'bar', // 차트의 형태
                data: { // 차트에 들어갈 데이터
                    labels: [
                        //x 축
                        '액션','호러','로맨스','무협','주호쨩','임경쨩'
                    ],
                    datasets: [
                        { //데이터
                            label: '라벨차트제목',//차트 제목
                            fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                            data: [
                                100,19,25,20,23,26 //x축 label에 대응되는 데이터 값
                            ],
                            backgroundColor: [
                                //색상
                                'rgba(255, 99, 132, 0.6)',
                                'rgba(54, 162, 235, 0.6)',
                                'rgba(255, 206, 86, 0.6)',
                                'rgba(75, 192, 192, 0.6)',
                                'rgba(153, 102, 255, 0.6)',
                                'rgba(255, 159, 64, 0.6)'
                            ],
                            borderColor: [
                                //경계선 색상
                                'rgba(255, 99, 132, 1)',
                                'rgba(54, 162, 235, 1)',
                                'rgba(255, 206, 86, 1)',
                                'rgba(75, 192, 192, 1)',
                                'rgba(153, 102, 255, 1)',
                                'rgba(255, 159, 64, 1)'
                            ],
                            borderWidth: 1 //경계선 굵기
                        } 
                    ]
                },
                options: {
                	
                    scales: {
                        yAxes: [
                            {
                                ticks: {
                                    beginAtZero: true
                                }
                            }
                        ]
                    }
                }
            });
             */
           
        </script>
</body>
</html>