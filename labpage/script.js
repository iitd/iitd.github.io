document.getElementById("year").textContent = new Date().getFullYear();

const cards = document.querySelectorAll(".member-card");
cards.forEach((card) => {
  card.addEventListener("mousemove", (event) => {
    const rect = card.getBoundingClientRect();
    const x = (event.clientX - rect.left) / rect.width - 0.5;
    const y = (event.clientY - rect.top) / rect.height - 0.5;
    card.style.transform = `translateY(-5px) rotateX(${-y * 2}deg) rotateY(${x * 2}deg)`;
  });
  card.addEventListener("mouseleave", () => { card.style.transform = ""; });
});
