document.addEventListener("turbolinks:load", () => {
  // 新規投稿フォームの表示
  const newPostButton = document.getElementById("newPost");
  const box = document.getElementById("formBox");

  newPostButton.addEventListener("click", () => {
    box.classList.add("active");
  });
  box.addEventListener("click", (e) => {
    if (e.target.closest(".modal") === null) {
      box.classList.remove("active");
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
  const inviteButton = document.getElementsById("inviteButton");
  const inviteBox = document.getElementById("inviteBox");

  inviteButton.addEventListener("click", () => {
    inviteBox.classList.add("active");
  });
  inviteBox.addEventListener("click", (e) => {
    if (e.target.closest(".modal") === null) {
      inviteBox.classList.remove("active");
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
