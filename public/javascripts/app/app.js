(function() {
  var refresh_data, render_all, v;

  jQuery.timeago.settings.strings = {
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
  };

  v = new StoplightView({
    model: Projects
  });

  refresh_data = function() {
    return Projects.fetch({
      success: function() {
        return v.render();
      }
    });
  };

  render_all = function() {
    var p;
    p = Projects.first();
    $('body').append(v.el);
    v.render();
    return setInterval(refresh_data, 5 * 1000);
  };

  Projects.fetch({
    success: render_all
  });

}).call(this);
