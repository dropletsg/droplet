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
static targets = ['callCheck', 'frontIdCheck', 'backIdCheck', 'selfieCheck', 'idTypeCheck']

  connect() {
    console.log('Hello, Stimulus!')
  }

  callWorker() {
    this.checkSection(this.callCheckTarget);
  }

  frontId() {
    this.checkSection(this.frontIdCheckTarget);
  }

  backId() {
    this.checkSection(this.backIdCheckTarget)
  }

  selfie() {
    this.checkSection(this.selfieCheckTarget)
  }

  idType(e) {
    if (e.target.value == '') {
      this.clearSection(this.idTypeCheckTarget);
    } else {
      this.idTypeCheckTarget.classList.remove('fa-times-circle');
      this.idTypeCheckTarget.classList.add('fa-check-circle');
      this.idTypeCheckTarget.parentNode.parentNode.classList.add('green');
    }
  }

  clearSection(element) {
    element.classList.add('fa-times-circle');
    element.classList.remove('fa-check-circle');
    element.parentNode.parentNode.classList.remove('green');
  }

  checkSection(element) {
    element.classList.toggle('fa-times-circle');
    element.classList.toggle('fa-check-circle');
    element.parentNode.parentNode.classList.toggle('green');
  }


}
