import { Controller } from "stimulus"

export default class extends Controller {
  // filesTarget is going to contain the list of input elements we've added
  // files to - in other words, these are the input elements that we're going
  // to submit.
  static targets = ['verification', 'checkbox', 'select']

  override() {
    if (this.checkboxTarget.checked) {
      this.verificationTarget.classList.add('border-success')
    }
  }

  selectAll() {
    console.log('checked')
    this.selectTargets.forEach(checkbox => {
      checkbox.checked = !checkbox.checked
    })
  }

}
