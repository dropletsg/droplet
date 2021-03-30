// Visit The Stimulus Handbook for more details
// https://stimulusjs.org/handbook/introduction
//
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from "stimulus"

export default class extends Controller {
static targets = ['callCheck']

  connect() {
    console.log('Hello, Stimulus!')
  }

  callWorker() {
    this.callCheckTarget.classList.toggle('fa-times-circle');
    this.callCheckTarget.classList.toggle('fa-check-circle');
    this.callCheckTarget.parentNode.parentNode.classList.toggle('green');
  }
}
