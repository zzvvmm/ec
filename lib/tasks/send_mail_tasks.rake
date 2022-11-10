desc "send week summary"
task week_summary: :enviroment do
  AdminMailer.week_summary.deliver!
end
