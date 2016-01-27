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
      break
    end
  end
end
