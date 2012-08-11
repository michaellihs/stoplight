jQuery.timeago.settings.strings =
  prefixAgo: null,
  prefixFromNow: null,
  suffixAgo: null,
  suffixFromNow: null,
  seconds: "sec",
  minute: "1 min",
  minutes: "%d mins",
  hour: "1 hr",
  hours: "%d hrs",
  day: "1 day",
  days: "%d days",
  month: "1 mo",
  months: "%d mo",
  year: "1 year",
  years: "%d yrs"

v = new StoplightView(model:Projects)

refresh_data = ()->
  Projects.fetch success: ()->
    v.render()

render_all = ()->
  p = Projects.first()
  $('body').append(v.el)
  v.render()
  setInterval refresh_data, 5*1000

Projects.fetch success: render_all
