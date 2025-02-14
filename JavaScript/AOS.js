document.addEventListener("DOMContentLoaded", function() {
    // Initialize AOS
    AOS.init({
        duration: 800,  // Faster animations
        once: false,  // Re-animate when scrolling up
        mirror: true,
    });

    // ScrollSpy Functionality
    let sections = document.querySelectorAll("section");
    let navLinks = document.querySelectorAll(".nav-links"); 

    window.addEventListener("scroll", () => {
        let scrollY = window.scrollY;

        sections.forEach((section) => {
            let sectionTop = section.offsetTop - 80; // Adjusted for navbar height
            let sectionHeight = section.clientHeight;
            let sectionId = section.getAttribute("id");

            if (scrollY >= sectionTop && scrollY < sectionTop + sectionHeight) {
                navLinks.forEach((link) => link.classList.remove("active"));

                let activeLink = document.querySelector(`.nav-links[href="#${sectionId}"]`);
                if (activeLink) {
                    activeLink.classList.add("active");
                }
            }
        });
    });
});