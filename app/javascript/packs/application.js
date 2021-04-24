// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"


Rails.start()
Turbolinks.start()
ActiveStorage.start()


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import 'jquery'
import 'popper.js'
import "bootstrap"
import "controllers"


// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';
// import fetchWithToken from "../utils/fetch_with_token";
import { initSweetalert } from '../plugins/init_sweetalert';
import highlightRow from "../plugins/checklist";
import activeCasesModal from "../plugins/active_cases_modal";


document.addEventListener('turbolinks:load', () => {
  if(document.querySelector('.case-verification')) {
    highlightRow();
  }

  if(document.querySelectorAll('.modalBtn')) {
    activeCasesModal();
  }

  initSweetalert('#sweet-alert-telegram', {
    text: "Are you sure you want to post to Telegram?",
    buttons: {cancel: "Back", approve: "Yes"}},(value) => {
      if (value) {
        const link = document.querySelector('.post-button');
        console.log(value)
        link.click();
      }
  });

});

