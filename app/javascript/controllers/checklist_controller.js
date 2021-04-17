import { Controller } from "stimulus"

export default class extends Controller {
  // filesTarget is going to contain the list of input elements we've added
  // files to - in other words, these are the input elements that we're going
  // to submit.
  static targets = ['verification', 'checkbox']

  override() {
    this.verificationTarget.classList.toggle('border-success')
  }

}
