/* Contact form — feedback succès sans rechargement */
const form    = document.getElementById('contactForm');
const success = document.getElementById('formSuccess');

form?.addEventListener('submit', async (e) => {
  e.preventDefault();
  const btn = form.querySelector('[type="submit"]');
  btn.textContent = 'Envoi…';
  btn.disabled = true;

  try {
    const res = await fetch(form.action, {
      method: 'POST',
      body: new FormData(form),
      headers: { Accept: 'application/json' },
    });
    if (res.ok) {
      form.reset();
      success.hidden = false;
      success.scrollIntoView({ behavior: 'smooth', block: 'nearest' });
    } else {
      btn.textContent = 'Erreur — réessayer';
      btn.disabled = false;
    }
  } catch {
    btn.textContent = 'Erreur — réessayer';
    btn.disabled = false;
  }
});
