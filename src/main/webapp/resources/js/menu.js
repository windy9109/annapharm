/**
 * 
 */
 
 
 $(document).ready(function(){
    $(".main>li").mouseover(function(){
        $(this).children(".main_sub").stop().slideDown(200);
    });
    $(".main>li").mouseleave(function(){
        $(this).children(".main_sub").stop().slideUp(200);
    });
});



