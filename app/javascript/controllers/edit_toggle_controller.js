import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="edit-toggle"
export default class extends Controller {
  connect() {
  }
  toggle(){
    const form = document.getElementById('form-without-input'); 
    const input = document.getElementById('form-with-input');

    if (form.classList.contains('hidden')) {
      form.classList.remove('hidden');
      input.classList.add('hidden');
    } else {
      form.classList.add('hidden');
      input.classList.remove('hidden');
    }
  }
}
