document.addEventListener('DOMContentLoaded', function () {
  var select = document.getElementById('theme-select');
  if (!select) return;

  var stored;
  try {
    stored = localStorage.getItem('theme');
  } catch (e) {}
  select.value = (stored === 'light' || stored === 'dark') ? stored : 'system';

  select.addEventListener('change', function () {
    var value = select.value;
    if (value === 'light' || value === 'dark') {
      document.documentElement.setAttribute('data-theme', value);
      try {
        localStorage.setItem('theme', value);
      } catch (e) {}
    } else {
      document.documentElement.removeAttribute('data-theme');
      try {
        localStorage.removeItem('theme');
      } catch (e) {}
    }
  });
});
