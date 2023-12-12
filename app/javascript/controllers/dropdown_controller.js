import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dropdown"
export default class extends Controller {
static targets = ['menu'];

  connect() {
    this.hideMenu();
  }

  toggleMenu() {
    if (this.menuTarget.classList.contains('hidden')) {
      this.showMenu();
    } else {
      this.hideMenu();
    }
  }

  showMenu() {
    this.menuTarget.classList.remove('transition', 'ease-in', 'duration-75', 'transform', 'opacity-0', 'scale-95');
    this.menuTarget.classList.add('transition', 'ease-out', 'duration-100', 'transform', 'opacity-100', 'scale-100');
    this.menuTarget.classList.remove('hidden');
  }

  hideMenu() {
    this.menuTarget.classList.remove('transition', 'ease-out', 'duration-100', 'transform', 'opacity-100', 'scale-100');
    this.menuTarget.classList.add('transition', 'ease-in', 'duration-75', 'transform', 'opacity-0', 'scale-95');
    this.menuTarget.classList.add('hidden');
  }
}
