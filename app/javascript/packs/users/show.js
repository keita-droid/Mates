document.addEventListener("turbolinks:load", () => {
  const button = document.getElementById("new");
  const box = document.getElementById("form-box");
  const veil = document.getElementById("transparent");
  button.addEventListener("click", () => {
    box.classList.add("reveal");
    veil.classList.add("reveal");
  });
  veil.addEventListener("click", () => {
    box.classList.remove("reveal");
    veil.classList.remove("reveal");
  });

  const editButtons = document.getElementsByClassName("edit-btn");
  for (let i = 0; i < editButtons.length; i++) {
    editButtons[i].onclick = function () {
      let editBox = document.getElementById(`form-box-edit-${i}`);
      const veil2 = document.getElementById("transparent-edit");
      editBox.classList.add("reveal");
      veil2.classList.add("reveal");

      veil2.addEventListener("click", () => {
        veil2.classList.remove("reveal");
        editBox.classList.remove("reveal");
      });
    };
  }

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
