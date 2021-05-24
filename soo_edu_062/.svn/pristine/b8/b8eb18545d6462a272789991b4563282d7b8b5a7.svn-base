$(document).ready(function() {
	SetMenu();
	SetNav();
});

// 메뉴 활성화
$(document).on('click', '.menu ul li a', function(){
	var pageTitle = $(this).text();
	var notSlide = $(this).closest('ul');

	if($(this).closest('li').find('ul').hasClass('depth') == true){
		$(this).closest('li').find('ul').slideDown();
	} else if($(this).closest('ul').hasClass('depth') != true){
		$('.menu ul li ul li').removeClass('on');
		$('.menu ul li ul').slideUp();
		$(this).closest('li').siblings('li').removeClass('on');
		SetNav();
		localStorage.pageName = pageTitle;
	} else if($(this).closest('ul').hasClass('depth') == true){
		$('.menu ul li ul').not(notSlide).slideUp();
		$('.menu ul li').removeClass('on');
		$(this).closest('li').siblings('li').removeClass('on');
		$('.menu ul li ul li').removeClass('on');
		$(this).closest('ul').closest('li').addClass('on');
		SetNav();
		localStorage.pageName = pageTitle;
	}
	$(this).closest('li').addClass('on');
});

// 메뉴 세팅
function SetMenu() {
	var menuName = localStorage.pageName;
	var thisMenu = $(".menu ul li a:contains("+ menuName +")");

	if(thisMenu.closest('ul').hasClass('depth') == true){
		thisMenu.closest('li').addClass('on');
		thisMenu.closest('.depth').closest('li').addClass('on');
		thisMenu.closest('.depth').css('display','block');
	} else if(thisMenu.closest('li').find('ul').hasClass('depth') == true){
		thisMenu.closest('li').removeClass('on');
	} else {
		thisMenu.closest('li').addClass('on');
	}
}

// 네비게이션 목록
function SetNav() {
	var depth01 = $('.menu > ul > li.on > a').text();
	var depth02 = $('.menu > ul > li > ul > li.on > a').text();

	$('.header span').remove();
	$('.header a').after('<span>' + depth01 + '</span>');
	$('.header span').after('<span>' + depth02 + '</span>');
	$('.header span:empty').remove();
}

// 스토리지 리셋
function menuClear() {
	localStorage.clear();
	if (self.name != 'reload') {
		self.name = 'reload';
		self.location.reload(true);
	}
	else {
		self.name = ''; 
	}
}