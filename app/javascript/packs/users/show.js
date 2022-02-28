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
});
