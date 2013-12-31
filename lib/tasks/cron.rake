namespace :cron do
  task :dev => :environment do
    me = SiteController.new
    me = me.task
    puts me
  
  end
end
