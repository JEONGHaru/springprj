function login() {
	alert('ログインしてください');
}

$(document)
	.on(
		'click',
		"#like",
		function() {
			let imageID = $(this).attr('idx');
			let userID = $("#user").val();
			let likeCount = parseInt($("#count" + imageID).text());
			if ($(this).children('i').attr('class') == 'fa-regular fa-heart p-1') {
				$
					.ajax(
						{
							type: "POST",
							url: "/album/likeAdd",
							data: "imageID=" + imageID
								+ "&userID=" + userID,
							contentType: "application/x-www-form-urlencoded"
						})
					.done(
						function(data) {
							if (data === '-1') {
								alert('いいねは一回しかできません');
								history.back();
							} else {
								parseInt($(
									"#count" + imageID)
									.text(likeCount + 1));
								parseInt($(
									"#mCount" + imageID)
									.text(likeCount + 1));

								$("#heart" + imageID)
									.attr('class',
										'fa-solid fa-heart p-1');
								$("#mHeart" + imageID)
									.attr('class',
										'fa-solid fa-heart p-1');
							}
						})

			} else if ($(this).children('i').attr('class') == 'fa-solid fa-heart p-1') {
				$
					.ajax(
						{
							type: "POST",
							url: "/album/likeCancel",
							data: "imageID=" + imageID
								+ "&userID=" + userID,
							contentType: "application/x-www-form-urlencoded"
						})
					.done(
						function(data) {
							if (data == '-1') {
								alert('いいねキャンセルは一回しかできません');
								history.back();
							} else {

								parseInt($(
									"#count" + imageID)
									.text(likeCount - 1))
								parseInt($(
									"#mCount" + imageID)
									.text(likeCount - 1))

								$("#heart" + imageID)
									.attr('class',
										'fa-regular fa-heart p-1');
								$("#mHeart" + imageID)
									.attr('class',
										'fa-regular fa-heart p-1');
							}

						})
			}
		});