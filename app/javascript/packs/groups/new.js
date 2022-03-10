document.addEventListener("turbolinks:load", () => {
  const button = document.getElementById("info");
  const text = document.getElementById("info-text");

  button.addEventListener("mouseover", () => {
    text.classList.add("reveal");
  });

  button.addEventListener("mouseleave", () => {
    text.classList.remove("reveal");
  });
});