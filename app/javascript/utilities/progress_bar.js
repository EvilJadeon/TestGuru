document.addEventListener('turbolinks:load', function () {
  let progressBar = document.querySelector('.progressbar')

  if (progressBar) {
    let currentQuestionNumber = progressBar.dataset.currentQuestionNumber
    let totalQuestions = progressBar.dataset.totalQuestions
    let progress = Math.round(currentQuestionNumber / totalQuestions * 100)

    progressBar.style.width = progress + '%'
    progressBar.innerHTML = progress + '%'
  }
})
