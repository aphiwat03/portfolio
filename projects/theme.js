(function () {
  /* ── Navbar scroll effect (light theme) ── */
  const navbar = document.getElementById("navbar");
  if (navbar) {
    window.addEventListener("scroll", () => {
      navbar.classList.toggle("scrolled", window.scrollY > 30);
    }, { passive: true });
  }

  /* ── Scroll-reveal animation ── */
  const observer = new IntersectionObserver(
    entries => entries.forEach(e => { if (e.isIntersecting) e.target.classList.add("active"); }),
    { threshold: 0.05, rootMargin: "0px 0px -50px 0px" }
  );
  document.querySelectorAll(".reveal").forEach(el => observer.observe(el));

  /* ── Mobile menu toggle ── */
  const menuBtn = document.getElementById("menu-btn");
  const mobileMenu = document.getElementById("mobile-menu");
  const menuIcon = document.getElementById("menu-icon");
  const mobileLinks = document.querySelectorAll(".mobile-link");

  if (menuBtn && mobileMenu && menuIcon) {
    function closeMenu() {
      mobileMenu.classList.remove("max-h-64", "opacity-100", "py-4");
      mobileMenu.classList.add("max-h-0", "opacity-0", "py-0");
      menuIcon.classList.remove("rotate-90");
      setTimeout(() => menuIcon.classList.replace("fa-times", "fa-bars"), 150);
    }

    menuBtn.addEventListener("click", () => {
      if (mobileMenu.classList.contains("max-h-0")) {
        mobileMenu.classList.remove("max-h-0", "opacity-0", "py-0");
        mobileMenu.classList.add("max-h-64", "opacity-100", "py-4");
        menuIcon.classList.add("rotate-90");
        setTimeout(() => menuIcon.classList.replace("fa-bars", "fa-times"), 150);
      } else {
        closeMenu();
      }
    });

    mobileLinks.forEach(link => link.addEventListener("click", closeMenu));
  }
})();
