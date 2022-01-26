document.addEventListener('turbolinks:load', function() {
  var form = document.getElementById('navform')
  var remaining_time = form.dataset.differenceTime
  var min = Math.floor(remaining_time / 60)
  var sec = remaining_time % 60

  document.getElementById('seconds').innerHTML = sec
  document.getElementById('minutes').innerHTML = min

  setTimeout(timer, 1000)
  function timer() {
    sec--

    document.getElementById('seconds').innerHTML = sec

    if (min == 0 && sec == 0) {
      document.forms['navform'].submit()
    }
    
    if (sec == 0) {
      min--
      document.getElementById('minutes').innerHTML = min
      sec = 59
    } else {
      setTimeout(timer, 1000)
    }
  }
})
