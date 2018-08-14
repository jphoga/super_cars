function initUpdateNavbarOnScroll() {
  const navbar = document.querySelector('.navbar-wagon');
  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= window.innerHeight) {
        navbar.classList.add('navbar-wagon-colored');
      } else {
        navbar.classList.remove('navbar-wagon-colored');
      }
    });
  }
}

export { initUpdateNavbarOnScroll };
