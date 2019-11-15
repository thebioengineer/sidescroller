


var original_dims;

function doResize(event, el, ui) {
  
    var scale;
    
    scale =   Math.min( 
      ui.body.height / window.innerHeight ,
      ui.body.width / window.innerWidth 
      );
    
    console.log("resize!");
    console.log(ui.body.height / 900);
    console.log(ui.body.width / 900);
  
    el.css({
    transform: "scale(" + scale + ")"
    });
}



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
			
	  var $el = $(".slide_master");
	  var $wrapper = $("body");
		doResize(null,
		  $el,
		  { body: {
		      height: $wrapper.innerHeight(),
		      width: $wrapper.innerWidth()
		    }
		  });
	
	$('.slide_master').on('afterChange', function(event, slick, currentSlide, nextSlide){
    console.log("Viz Me!");
    var slide = $(".slick-current").find(".slide_container");
    slide.css('visibility','visible');
  });
    
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
			
	  var $el = $(".slide_master");
	  var $wrapper = $("body");
		doResize(null,
		  $el,
		  { body: {
		      height: $wrapper.innerHeight(),
		      width: $wrapper.innerWidth()
		    }
		  });
    
}, 200); // can be changed to a lower value - whatever works
});






