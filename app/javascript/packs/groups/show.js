$(document).on("turbolinks:load", function() {
  // メニューから選択すると自動スクロールで遷移する機能
  $('#memberList li a[href*="#"]').click(function () {
    var elmHash = $(this).attr("href");
    var pos = $(elmHash).offset().top - 75;
    $("body,html").animate({ scrollTop: pos }, 500);
    return false;
  });
});