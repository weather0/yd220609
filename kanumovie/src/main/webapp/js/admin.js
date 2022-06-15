
function refreshpage(){
		location.reload();
	}
	
let allbtn2 = document.querySelector('.table2 input[type="checkbox"]');
allbtn2.addEventListener('click', allcheckbtn2);

function allcheckbtn2() {
	let allcheckbtn2 = document.querySelectorAll('.table2 input[type="checkbox"]');

	if (allbtn2.checked) { //체크되어 있으면
		allcheckbtn2.forEach(chk => {
			chk.checked = true;
		})
	} else {
		allcheckbtn2.forEach(chk => {
			chk.checked = false;
		})
	}

};

let allbtn1 = document.querySelector('.table1 input[type="checkbox"]');
allbtn1.addEventListener('click', allcheckbtn);

function allcheckbtn() {
	let allcheckbtn1 = document.querySelectorAll('.table1 input[type="checkbox"]');

	if (allbtn1.checked) { //체크되어 있으면
		allcheckbtn1.forEach(chk => {
			chk.checked = true;
		})
	} else {
		allcheckbtn1.forEach(chk => {
			chk.checked = false;
		})
	}

};


function updateblockcheck() {
	console.log('펑션들어옴')
	var checkBoxArr = [];
	let allcheckbtn = document.querySelectorAll('.table-responsive input[type="checkbox"]');
	allcheckbtn.forEach((chk, index) => {
		if (index == 0) {

		} else if (chk.checked) {
			/*checkBoxArr.push(chk.parentElement.parentElement)*/
			chk.parentElement.parentElement.remove();
			checkBoxArr.push(chk.parentElement.parentElement.children[1].innerHTML)
		}
	})
	$.ajax({
		type: "POST",
		url: "updateblockcheck.do",
		data: {
			checkBoxArr: checkBoxArr,
		},
		success: function(result) {
			refreshpage();
			console.log(result);
		},
		error: function(xhr, status, error) {
			alert(error);
		}
	});


}


function updatereportcheck() {

	console.log('취소펑션들어옴')
	var checkBoxArr = [];
	let allcheckbtn = document.querySelectorAll('.table1 input[type="checkbox"]');
	allcheckbtn.forEach((chk, index) => {
		if (index == 0) {

		} else if (chk.checked) {
			/*checkBoxArr.push(chk.parentElement.parentElement)*/
			chk.parentElement.parentElement.remove();
			console.log(chk.parentElement.parentElement.children[1].innerHTML);
			checkBoxArr.push(chk.parentElement.parentElement.children[1].innerHTML)
		}
	})
	for (let i = 0; i < checkBoxArr.length; i++) {
		console.log(checkBoxArr[i]);
	}

	$.ajax({
		type: "POST",
		url: "updatereportcheck.do",
		data: {
			checkBoxArr: checkBoxArr       
		},
		success: function(result) {
			refreshpage();
			console.log(result);
		},
		error: function(xhr, status, error) {
			alert(error);
		}
	});

}

function updateunblockcheck() {
	console.log('updateunblockcheck() 실행');

	console.log('취소펑션들어옴')
	var checkBoxArr = [];
	let allcheckbtn = document.querySelectorAll('.table2 input[type="checkbox"]');
	allcheckbtn.forEach((chk, index) => {
		if (index == 0) {

		} else if (chk.checked) {
			/*checkBoxArr.push(chk.parentElement.parentElement)*/
			chk.parentElement.parentElement.remove();
			console.log(chk.parentElement.parentElement.children[1].innerHTML);
			checkBoxArr.push(chk.parentElement.parentElement.children[1].innerHTML)
		}
	})
	for (let i = 0; i < checkBoxArr.length; i++) {
		console.log(checkBoxArr[i]);
	}

	$.ajax({
		type: "POST",
		url: "updateunblockcheck.do",
		data: {
			checkBoxArr: checkBoxArr        
		},
		success: function(result) {
			refreshpage();
			console.log(result);
		},
		error: function(xhr, status, error) {
			alert(error);
		}
	});


}
















