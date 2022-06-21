// 별점 매기기 함수 (jQuery)
function rating() {
	let rating = $('.star-rate');
	console.log(rating);
	rating.each(function() {
		let score = $(this).attr('data-rate');
		console.log(score);
		score = parseFloat(score) / 2;
		let numScore = Math.trunc(score);
		let floatScore = score - Math.trunc(score);
		if (floatScore < 0.5) {
			$(this).find('span:nth-child(-n+' + numScore + ')')
				.addClass('checked');
		} else if (floatScore >= 0.5) {
			$(this).find('span:nth-child(-n+' + numScore + ')')
				.addClass('checked');
			$(this).find('span:nth-child(' + (numScore + 1) + ')')
				.addClass('fa-star-half-o');
		}
	})
}

