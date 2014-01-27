Number.prototype.toHHMMSS = ->
  sec_num = parseInt(this / 1000,10)
  hours   = Math.floor(sec_num / 3600)
  minutes = Math.floor((sec_num - (hours * 3600)) / 60)
  seconds = sec_num - (hours * 3600) - (minutes * 60)
  
  if (hours   < 10) then hours   = "0"+hours
  if (minutes < 10) then minutes = "0"+minutes
  if (seconds < 10) then seconds = "0"+seconds
  hours+':'+minutes+':'+seconds

window.Timer = {}

Timer.iterateTimer = (e)->
  $this = $(e)
  since = new Date($this.data('since'))
  now   = new Date()
  diff  = now - since
  $this.text(diff.toHHMMSS())
  