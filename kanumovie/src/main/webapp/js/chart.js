
let usercount = [];
let PreferredGenreCount = [];
let PreferredGenreName = [];


$(function() {
	$.ajax({
		url: "selectUsersPreferredGenre.do",
		type: "POST",
		dataType: "json",
		success: function(data) {
			console.log(data)
			data.forEach((ele) => {
				PreferredGenreName.push(ele.name);
				PreferredGenreCount.push(ele.genreCount);
			})

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
		},
		error: function(err) {
			console.log(err)
		}
	});
});






const ctx = document.getElementById("myChart").getContext("2d");
const myChart = new Chart(ctx, {
	type: "bar",
	data: {
		labels: PreferredGenreName,
		datasets: [
			{
				label: "# of Votes",
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



//회원가입 현황 차트 

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

const ctx2 = document.getElementById("myChart2").getContext("2d");
const myChart2 = new Chart(ctx2, {
	type: "line",
	data: {
		labels: weeks,
		datasets: [
			{
				label: "# of Votes",
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
			},
		],
	},
	options: {
		plugins: {
			title: {
				display: true,
				text: "회원가입 현황",
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