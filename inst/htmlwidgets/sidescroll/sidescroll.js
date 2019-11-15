$(document).ready(function(){
		$('.slide_master').slick({
			accessibility: true,
			dots: true,
			infinite: false,
			speed: 300,
			slidesToShow: 1,
			centerMode: true,
			variableWidth: true
			});
});

$('.slide_master').on('afterChange', function(event, slick, currentSlide, nextSlide){
   <!-- make slide contents visible -->
   var slide = $(".slick-current").find(".slide_id")
   slide.css('visibility','visible');
});

$(window).resize(function() {
		$('.slide_master').slick("unslick");
		window.setTimeout(function(){
		$('.slide_master').show(); // optionally
		$('.slide_master').slick({
			accessibility: true,
			dots: true,
			infinite: false,
			speed: 300,
			slidesToShow: 1,
			centerMode: true,
			variableWidth: true});
}, 200); // can be changed to a lower value - whatever works
});