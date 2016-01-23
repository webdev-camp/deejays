require_relative "../config/environment"

class ImportUsers

  attr_reader :parts

  def initialize
    @lines = File.open("#{Rails.root}/db/raw/group_members.tsv").each_line.to_a
    @lines.shift #header
  end

  def run
    #months = Date::MONTHNAMES.compact
    @lines.each do |line|
      parts = line.split("\t")
      puts "User #{parts[1]}"
      user = User.new(  :name => parts[1] , :email => parts[2] , :added => parts[3] ,
                        :city => parts[4] , :password => "qwertyuiopasdfghjkl")
      user.skip_confirmation!
      puts user.errors.inspect unless user.save
    end
  end
end

ImportUsers.new.run
