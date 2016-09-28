require 'support/helpers/session_helpers'
require 'support/helpers/song_helpers'
RSpec.configure do |config|
  config.include Features::SessionHelpers, type: :feature
  config.include Features::SongHelpers, type: :feature
end
