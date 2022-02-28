document.addEventListener("DOMContentLoaded", () => {
  const button = document.getElementById("new");
  const box = document.getElementById("form-box");
  const veil = document.getElementById("transparent");
  button.addEventListener("click", () => {
    box.classList.remove("hidden");
    veil.classList.remove("hidden");
  });
  veil.addEventListener("click", () => {
    box.classList.add("hidden");
    veil.classList.add("hidden");
  });

  const editButtons = document.getElementsByClassName("edit-btn");
  for(let i=0; i < editButtons.length; i++) {
    editButtons[i].onclick = function(){
      let editBox = document.getElementById(`form-box-edit-${i}`);
      const veil2 = document.getElementById("transparent-edit");
      editBox.classList.remove("hidden");
      veil2.classList.remove("hidden");

      veil2.addEventListener("click", () => {
        veil2.classList.add("hidden");
        editBox.classList.add("hidden");
      });
    }
  }
});
