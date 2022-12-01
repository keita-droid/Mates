$(document).on("turbolinks:load", function() {
  // アコーディオンをクリックした時
  $(".question").on('click', function(){
    const findElm = $(this).next(".box");
    $(findElm).slideToggle();

    if($(this).hasClass("close")) {
      $(this).removeClass("close");
    } else {
      $(this).addClass("close");
    }
  });
});