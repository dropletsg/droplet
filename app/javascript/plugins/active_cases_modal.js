const activeCasesModal = () => {
  document.querySelectorAll('.modalBtn').forEach(e=>{
    e.addEventListener('click', el => {
      var case_id = el.target.dataset.id
      var form = document.querySelector('.card-body > form')
      form.insertAdjacentHTML('beforeend', `<input type="hidden" name="case_id" value="${case_id}">`)
    })
  })
}

export default activeCasesModal;
