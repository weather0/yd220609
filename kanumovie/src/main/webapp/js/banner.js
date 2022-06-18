

//배너 수정 메소드
function updatebanner(bid) {
/*	
	console.log('업데이트베너메소드');
	console.log(bid)
	let btitle =document.getElementById('btitle').innerText;
	let bcontent =document.getElementById('bcontent').innerText;
	let genrename=document.getElementById('genrename').innerText;  */

	
	$.ajax({
		type: "POST",
		url: "bannerupdateform.do",
		data: {
			"bid":bid,"btitle":btitle, "bcontent":bcontent, "genrename":genrename,
		},
		success: function(result) {
			console.log(result);
			location.replace("bannerupdateform.do")
			
		},
		error: function(xhr, status, error) {
			alert(error);
		}
	});

}


//배너 삭제 메소드
function deletebanner(id) {
	console.log('deletebanner메소드 ')
	console.log(id);
	
	$.ajax({
		type: "POST",
		url: "deletebanner.do",
		data: {
			"bid": id,
		},
		success: function(result) {
			console.log(result);
		},
		error: function(xhr, status, error) {
			alert(error);
		}
	});
	
}
/*
//옵션값 선택 
let select = document.getElementById('floatingSelect');
let len = select.length;
console.log(len);

*/

