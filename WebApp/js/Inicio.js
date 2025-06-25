  document.querySelectorAll('.navbar-nav .nav-link').forEach(link => {
    link.addEventListener('click', function () {
      const navbarCollapse = document.querySelector('.navbar-collapse');
      const bsCollapse = bootstrap.Collapse.getInstance(navbarCollapse);
      if (bsCollapse && navbarCollapse.classList.contains('show')) {
        bsCollapse.hide();
      }
    });
  });
