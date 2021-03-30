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
static targets = ['callCheck', 'frontIdCheck', 'backIdCheck',
                  'selfieCheck', 'idTypeCheck', 'validIdCheck',
                  'payNowCheck', 'qrCodeCheck', 'claimCheck',
                  'verdictCheck']

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

  validId() {
    this.checkSection(this.validIdCheckTarget)
  }

  payNow(e) {
    if (e.target.value.length < 10) {
      this.clearSection(this.payNowCheckTarget);
    } else {
      this.payNowCheckTarget.classList.remove('fa-times-circle');
      this.payNowCheckTarget.classList.add('fa-check-circle');
      this.payNowCheckTarget.parentNode.parentNode.classList.add('green');
    }
  }

  qrCode() {
    this.checkSection(this.qrCodeCheckTarget);
  }

  claim() {
    this.checkSection(this.claimCheckTarget);
  }

  claimVerdict(e) {
    console.log(e.target.value);
    if (e.target.value == '') {
      this.clearSection(this.verdictCheckTarget);
    } else {
      this.verdictCheckTarget.classList.remove('fa-times-circle');
      this.verdictCheckTarget.classList.add('fa-check-circle');
      this.verdictCheckTarget.parentNode.parentNode.classList.add('green');
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
