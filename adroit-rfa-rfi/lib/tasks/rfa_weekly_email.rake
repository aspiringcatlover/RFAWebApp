desc "Send weekly RFA open cases to users"

task :rfa_weekly_email => :environment do

    puts "Sending emailing to users about open RFA cases"
    @users = User.all
    @users.each do |user|
        UserMailer.rfa_open_cases_email(user).deliver_now
    end


end
