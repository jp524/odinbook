import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { with: String }
  static classes = [ "disabled" ]

  connect() {
    this.element.dataset['action'] = 'submit->disable#disableForm'

    if (!this.hasWithValue) {
      this.withValue = "Processing..."
    }
  }

  disableForm() {
    this.submitButtons().forEach(button => {
      button.value = this.withValue
      button.classList.add(this.disabledClass)
    })
  }

  submitButtons() {
    return this.element.querySelectorAll("input[type='submit']")
  }
}
