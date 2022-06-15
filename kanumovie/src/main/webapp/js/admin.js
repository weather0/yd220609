let allbtn = document.querySelector('.table-responsive input[type="checkbox"]');


allbtn.addEventListener('click', allcheckbtn);


function allcheckbtn() {
	let allcheckbtn = document.querySelectorAll('.table-responsive input[type="checkbox"]');

	if (allbtn.checked) { //체크되어 있으면
		allcheckbtn.forEach(chk => {
			chk.checked = true;
		})
	} else {
		allcheckbtn.forEach(chk => {
			chk.checked = false;
		})
	}

};


function updateblockcheck() {
	console.log('펑션들어옴')
	var checkBoxArr = [];
	let allcheckbtn = document.querySelectorAll('.table-responsive input[type="checkbox"]');
	allcheckbtn.forEach(chk => {
		if (chk.checked) {
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
	let allcheckbtn = document.querySelectorAll('.table-responsive input[type="checkbox"]');
	allcheckbtn.forEach(chk => {
		if (chk.checked) {
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
			checkBoxArr: checkBoxArr        // folder seq 값을 가지고 있음.
		},
		success: function(result) {
			console.log(result);
		},
		error: function(xhr, status, error) {
			alert(error);
		}
	});



}
















