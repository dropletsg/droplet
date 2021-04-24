function copyText(clipboardGroup) {
  let input = clipboardGroup.querySelector('input')
  input.select();
  input.setSelectionRange(0, 99999)
  document.execCommand("copy");
  document.getElementById('copied-text').classList.remove('d-none')
}

export default copyText;
