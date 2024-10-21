const track = document.querySelector('.carousel-track');
const prevBtn = document.querySelector('.prev-btn');
const nextBtn = document.querySelector('.next-btn');

let position = 0;
const cardWidth = 340; // Adjust card width + margin

nextBtn.addEventListener('click', () => {
    const totalWidth = track.scrollWidth - track.clientWidth;
    if (position < totalWidth) {
        position += cardWidth;
        track.style.transform = `translateX(-${position}px)`;
    }
});

prevBtn.addEventListener('click', () => {
    if (position > 0) {
        position -= cardWidth;
        track.style.transform = `translateX(-${position}px)`;
    }
});
