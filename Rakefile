#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Karmaville::Application.load_tasks

namespace :db do
  desc "update current total on user model"
  task :update_user_total => :environment do
    total = User.count
    iterator = 0
    User.all.each do |user|
      user.update_attribute(:total, user.calculate_total_karma)
      iterator += 1
      puts "#{iterator}/#{total}" if iterator % 100 == 0
    end
  end
end