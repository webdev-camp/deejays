# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

require_relative "config/environment"

desc 'Fix song links'
task :fix_links do
  Song.all.each do |song|
    index = song.info.index("http")
    next if index == nil
    parts = song.info.split
    parts.dup.each_with_index do |part , ind |
      index = part.index("http")
      next if index.nil?
      song.link = part.strip
      parts.delete_at(ind)
      song.info = parts.join(" ")
      song.save
      puts song.link
      break
    end
  end
end

desc 'Fix song date around jesus'
task :fix_dates do
  Song.all.each do |song|
    date = song.date_added
    next unless date
    if date.year < 30
      date += 2000.years
      song.date_added = date
      song.save!
      puts date
    end
    if date.year > 2020
      song.date_added = nil
      song.save!
      puts date
    end
  end
end
