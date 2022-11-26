$(document).on("turbolinks:load", function() {
  // 新規投稿フォームの表示
  const formBox = $("#formBox");

  $('#newPost').click(function() {
    formBox.addClass("active");
  });
  formBox.on("click", function(e) {
    if (e.target.closest(".modal") === null) {
      formBox.removeClass("active");
    }
  });

  
  // 編集フォームの表示
  const editButtons = document.getElementsByClassName("editButton");
  for (let i = 0; i < editButtons.length; i++) {
    editButtons[i].onclick = function () {
      let editBox = document.getElementById(`editPost${i}`);
      editBox.classList.add("active");
      
      editBox.addEventListener("click", (e) => {
        if (e.target.closest(".modal") === null) {
          editBox.classList.remove("active");
        }
      });
    };
  }
  
  // 招待フォームの表示
  const inviteBox = $("#inviteBox");

  $("#inviteButton").click(function() {
    inviteBox.addClass("active");
  });
  inviteBox.on("click", function(e) {
    if (e.target.closest(".modal") === null) {
      inviteBox.removeClass("active");
    }
  });

  // プロフィール画像の拡大表示
  const imageLarge = $("#image-large");

  $("#image-icon").click(function() {
    imageLarge.addClass("active");
  });
  imageLarge.on("click", function(e) {
    if (e.target.closest(".modal") === null) {
      imageLarge.addClass("deactivate");
      imageLarge.delay(200).queue(function(){
        imageLarge.removeClass("active deactivate").dequeue();
      });
    }
  });
  
});
