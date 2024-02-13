function validateForm() {
    // Validazione del form
    var name = document.getElementById('name').value;
    var email = document.getElementById('email').value;
    var message = document.getElementById('message').value;

    // Abilita il pulsante di invio solo se tutti i campi sono compilati
    if (name && email && message) {
      document.getElementById('submitBtn').removeAttribute('disabled');
      return true;
    } else {
      alert('Please fill in all required fields.');
      return false;
    }
  }