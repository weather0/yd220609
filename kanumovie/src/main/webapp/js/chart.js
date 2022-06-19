
let usercount = [];
let PreferredGenreCount = [];
let PreferredGenreName = [];
let weeklyVisit = []

$(function() {
	$.ajax({
		url: "analyticsWeeklyVisit.do",
		type: "POST",
		dataType: "json",
		success: function(data) {

			data.forEach(elem => {
				weeklyVisit.push(elem);
			});

		},
		error: function(error) {
			console.log(error);
		}


	})
});

$(function() {
	$.ajax({
		url: "selectUsersPreferredGenre.do",
		type: "POST",
		dataType: "json",
		success: function(data) {
			/*console.log(data)*/
			data.forEach((ele) => {
				PreferredGenreCount.push(String(ele.genreCount));
				PreferredGenreName.push(ele.name);
			})
			createChart2(PreferredGenreName, PreferredGenreCount);

			for (let i = 0; i < PreferredGenreCount.length; i++) {
				console.log(PreferredGenreCount[i]);
			}
		},
		error: function() {

		}
	});
});

$(function() {
	$.ajax({
		type: 'POST',
		url: 'analyticssignupdata.do',
		dataType: 'text',
		success: function(result) {
			//	console.log(result);
			let str = result.split(',');
			//	console.log(str);
			//	console.log(str.length);
			str.forEach((elem) => {
				usercount.push(elem);
			})


			/* 날짜 객체 받아서 문자열로 리턴하는 함수 */
			function getDateStr(myDate) {
				return (
					// myDate.getFullYear() +
					// "-" +
					myDate.getMonth() + 1 + "/" + myDate.getDate()
				);
			}
			//오늘 날짜 받아서 일주일전 날짜구하는 함수
			function lastWeek(i) {
				var d = new Date();
				var dayOfMonth = d.getDate();
				d.setDate(dayOfMonth - i);
				return getDateStr(d);
			}

			let weeks = [];
			for (let i = 6; i >= 0; i--) {
				weeks.push(lastWeek(i));
			}
			createChart(usercount, weeks);
		},
		error: function(err) {
			console.log(err)
		}
	});
});




function createChart2(PreferredGenreName, PreferredGenreCount) {
	const ctx = document.getElementById("myChart").getContext("2d");
	const myChart = new Chart(ctx, {
		type: "bar",
		data: {
			labels: PreferredGenreName,
			datasets: [
				{
					label: "선호 장르 순위",
					data: PreferredGenreCount,
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
				/*{
					label: PreferredGenreName[1],
					data: PreferredGenreCount[1],
					backgroundColor: "rgba(54, 162, 235, 0.2)",
					borderColor: "rgba(54, 162, 235, 1)",
					borderWidth: 1,

				},
				{
					label: PreferredGenreName[2],
					data: PreferredGenreCount[2],
					backgroundColor: "rgba(255, 206, 86, 0.2)",
					borderColor: "rgba(255, 206, 86, 1)",
					borderWidth: 1,
				},
				{
					label: PreferredGenreName[3],
					data: PreferredGenreCount[3],
					backgroundColor: "rgba(75, 192, 192, 0.2)",
					borderColor: "rgba(75, 192, 192, 1)",
					borderWidth: 1,
				},
				{
					label: PreferredGenreName[4],
					data: PreferredGenreCount[4],
					backgroundColor: "rgba(153, 102, 255, 0.2)",
					borderColor: "rgba(153, 102, 255, 1)",
					borderWidth: 1,
				},*/

			],
		},
		options: {
			plugins: {
				title: {
					display: true,
					text: "유저 선호 장르",
					font: {
						size: 16,
					},
				},
				legend: {
					labels: {
						font: {
							size: 16,
						},
					},
				},
			},
			scales: {
				x: {
					ticks: {
						font: {
							size: 16,
						},
					},
				},
				y: {
					beginAtZero: true,
					ticks: {
						font: {
							size: 16,
							family: "vazir",
						},
					},
				},
			},
		},
	});

};

//회원가입 현황 차트 
function createChart(usercount, weeks) {

	const ctx2 = document.getElementById("myChart2").getContext("2d");
	const myChart2 = new Chart(ctx2, {
		type: "line",
		data: {
			labels: weeks,
			datasets: [
				{
					label: "회원가입현황",
					data: usercount,
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
				}, {
					label: "방문자 현황",
					data: weeklyVisit,
					backgroundColor: [
						"rgba(153, 102, 255, 0.2)",
					],
					borderColor: [
						"rgba(153, 102, 255, 1)",
					],
					type: 'bar',
					borderWidth: 1,
				},

			],
		},
		options: {
			plugins: {
				title: {
					display: true,
					text: "회원가입 현황",
					font: {
						size: 16,
					},
				},
				legend: {
					labels: {
						font: {
							size: 16,
						},
					},
				},
			},
			scales: {
				x: {
					ticks: {
						font: {
							size: 16,
						},
					},
				},
				y: {
					beginAtZero: true,
					ticks: {
						font: {
							size: 16,
							family: "vazir",
						},
					},
				},
			},
		},
	});

}