document.addEventListener("DOMContentLoaded", () => {
  const button = document.getElementById("info-btn");
  const text = document.getElementById("info-text");

  button.addEventListener("mouseover", () => {
    text.classList.add("reveal");
  });

  button.addEventListener("mouseleave", () => {
    text.classList.remove("reveal");
  });
});