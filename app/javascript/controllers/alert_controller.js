import { Controller } from "@hotwired/stimulus"
import { Alert } from "bootstrap"

export default class extends Controller {
  connect() {
    this.alert = new Alert(this.element)

    setTimeout(() => {
      this.element.classList.add('fade-out')
      this.element.classList.add('d-none')
    }, 1000);
  }
}
