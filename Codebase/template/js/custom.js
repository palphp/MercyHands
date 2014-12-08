var docHeight = $(document).height();
var winHeight = $(window).height();
$("#loginPage").css('height', winHeight-130);
$("#loginPage form").css('margin-top', winHeight-480);
$("#registerPage").css('height', winHeight-130);
$("#registerPage form").css('margin-top', winHeight-480);
/*
if($('.container').height() < winHeight){
	$('footer').css('position', 'absolute');
	$('footer').css('bottom', '0');
}
*/
$(document).ready(function(){
	$("#addSlide").click(function(){
		$("#Slide").append('<div class="row"><div class="slideForm left"><div class="form-group"><label>Image</label><input type="text" class="form-control" name="campTitle[]" placeholder="Image title"></div></div><div class="slideForm right"><div class="form-group"><label>Slide Image</label><input type="file" name="campSlide[]"></div></div><a class="delete"><i class="fa fa-times"></i></a></div>');
	});
	$(".delete").click(function(){
		alert(442);
		$(this).parent().remove().hide('slow');
	});
});