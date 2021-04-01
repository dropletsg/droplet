const highlightRow = () => {
    const row = document.querySelectorAll(".case-completed");
    row.forEach((element) => {
        if (element.dataset.completed.toLowerCase() == 'true'){
            element.classList.add("green");
        }
    });
}

export default highlightRow;