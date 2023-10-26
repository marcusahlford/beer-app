import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {}

  submit(event) {
    clearTimeout(this.constructor.debounceTimer);

    this.constructor.debounceTimer = setTimeout(() => {
      this.element.requestSubmit();
    }, 200);
  }
}
