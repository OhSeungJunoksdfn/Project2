$(function() {
	const urlParams = new URLSearchParams(window.location.search);
	const type = urlParams.get('type');

	$(".tablink").each(function() {
		const text = $(this).text().trim();

		if (text === type || (!type && text === "전체")) {
			$(this).addClass("active");
		}
	});
});
const changeType = (type) => {
	location.href="../member/list.do?type="+type
} 