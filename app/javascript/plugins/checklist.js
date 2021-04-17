const highlightRow = () => {
  const row = document.querySelectorAll("[data-completed]");
  row.forEach((element) => {
      if (element.dataset.completed.toLowerCase() == 'true'){
          element.classList.add("green");
      } else {
        element.querySelector(".case-verification-row").classList.add("icon-grey")
      }
  });
}

export default highlightRow;
