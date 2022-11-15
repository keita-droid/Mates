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
  

  const editGroupsBtn =document.getElementById('edit-groups');
  const withdrawBtns = document.getElementsByClassName("withdraw-btn");
  editGroupsBtn.addEventListener('click', () => {
    if(withdrawBtns[0].classList.contains("reveal")) {
      for (let i=0; i< withdrawBtns.length; i++) {
        withdrawBtns[i].classList.remove("reveal");
      }
      editGroupsBtn.innerHTML = "[編集]"
    } else {
      for (let i = 0; i < withdrawBtns.length; i++) {
        withdrawBtns[i].classList.add("reveal");
      }
      editGroupsBtn.innerHTML = "[完了]"
    }
  });
});
