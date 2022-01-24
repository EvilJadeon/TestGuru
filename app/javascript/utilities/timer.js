document.addEventListener('turbolinks:load', function() {
  var total_time = document.getElementById('minutes').innerHTML
  var min = total_time - 1
  var sec = 59


  setTimeout(timer, 1000)
  function timer() {
    sec--
    localStorage.setItem('seconds', sec)

    document.getElementById('minutes').innerHTML = localStorage.getItem('minutes')
    document.getElementById('seconds').innerHTML = localStorage.getItem('seconds')

    
    if (min == 0 && sec == 0) {
      document.forms['complete-form'].submit()
    } else {
      if (sec == 0) {
        min--
        sec = 59
        localStorage.setItem('minutes', min)
        localStorage.setItem('seconds', sec)
      } else {
        setTimeout(timer, 1000)
        localStorage.setItem('minutes', min)
        localStorage.setItem('seconds', sec)
      }
    }
  }
})
