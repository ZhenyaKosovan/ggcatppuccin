(function () {
  'use strict';

  const storageKey = 'theme';

  const getStoredTheme = () => localStorage.getItem(storageKey);
  const setStoredTheme = theme => localStorage.setItem(storageKey, theme);

  const getPreferredTheme = () => {
    const storedTheme = getStoredTheme();
    if (storedTheme === 'light' || storedTheme === 'dark') {
      return storedTheme;
    }
    return window.matchMedia('(prefers-color-scheme: dark)').matches ? 'dark' : 'light';
  };

  const applyTheme = theme => {
    document.documentElement.setAttribute('data-bs-theme', theme);
    document.querySelectorAll('nav.navbar').forEach(nav => {
      nav.setAttribute('data-bs-theme', theme);
    });
  };

  const addToggle = () => {
    if (document.querySelector('#dropdown-lightswitch')) {
      return;
    }

    const navLists = document.querySelectorAll('nav .navbar-nav');
    if (!navLists.length) {
      return;
    }

    const navList = navLists[navLists.length - 1];
    const item = document.createElement('li');
    item.className = 'nav-item dropdown';
    item.innerHTML = [
      '<button class="nav-link dropdown-toggle" id="dropdown-lightswitch" type="button"',
      '  data-bs-toggle="dropdown" aria-expanded="false" aria-label="Toggle theme">',
      '  <span class="fa fa-moon"></span>',
      '</button>',
      '<ul class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdown-lightswitch">',
      '  <li>',
      '    <button type="button" class="dropdown-item d-flex align-items-center" data-bs-theme-value="light">',
      '      <span class="fa fa-sun me-2"></span>Latte',
      '    </button>',
      '  </li>',
      '  <li>',
      '    <button type="button" class="dropdown-item d-flex align-items-center" data-bs-theme-value="dark">',
      '      <span class="fa fa-moon me-2"></span>Mocha',
      '    </button>',
      '  </li>',
      '</ul>'
    ].join('');
    navList.appendChild(item);
  };

  const setActiveTheme = (theme, focus) => {
    document.querySelectorAll('[data-bs-theme-value]').forEach(button => {
      const buttonTheme = button.getAttribute('data-bs-theme-value');
      const isActive = buttonTheme === theme;
      button.classList.toggle('active', isActive);
      button.setAttribute('aria-pressed', isActive);
    });

    const switcher = document.querySelector('#dropdown-lightswitch');
    if (!switcher) {
      return;
    }

    const activeIcon = document.querySelector('[data-bs-theme-value="' + theme + '"] span');
    if (activeIcon) {
      switcher.querySelector('span').className = activeIcon.className;
    }

    if (focus) {
      switcher.focus();
    }
  };

  const init = () => {
    addToggle();
    const theme = getPreferredTheme();
    applyTheme(theme);
    setActiveTheme(theme);

    document.querySelectorAll('[data-bs-theme-value]').forEach(button => {
      button.addEventListener('click', () => {
        const newTheme = button.getAttribute('data-bs-theme-value');
        applyTheme(newTheme);
        setStoredTheme(newTheme);
        setActiveTheme(newTheme, true);
      });
    });
  };

  applyTheme(getPreferredTheme());

  window.matchMedia('(prefers-color-scheme: dark)').addEventListener('change', () => {
    const storedTheme = getStoredTheme();
    if (storedTheme !== 'light' && storedTheme !== 'dark') {
      const theme = getPreferredTheme();
      applyTheme(theme);
      setActiveTheme(theme);
    }
  });

  window.addEventListener('DOMContentLoaded', init);
})();
