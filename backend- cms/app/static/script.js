// Get references to DOM elements
const navToggle = document.querySelector('.nav-toggle');
const navMenu = document.querySelector('.nav-menu');

// Add click event listener to the navigation toggle
navToggle.addEventListener('click', () => {
  navMenu.classList.toggle('active');
});

// Close the navigation menu when a menu item is clicked (for small screens)
const navItems = document.querySelectorAll('.nav-item');
navItems.forEach(item => {
  item.addEventListener('click', () => {
    navMenu.classList.remove('active');
  });
});
