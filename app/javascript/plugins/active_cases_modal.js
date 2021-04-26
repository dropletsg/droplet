const activeCasesModal = () => {
  document.querySelectorAll('.modalBtn').forEach(e=>{
    e.addEventListener('click', el => {
      var caseId = el.target.dataset.id
      var form = document.querySelector('.card-body > form')
      form.insertAdjacentHTML('beforeend', `<input type="hidden" name="case_id" value="${caseId}">`)

      var caseTitle = el.target.dataset.title
      var modalTitle = document.getElementById('exampleModalLongTitle')
      modalTitle.innerText = `Contribute to ${caseTitle}`
    })
  })
}

export default activeCasesModal;
