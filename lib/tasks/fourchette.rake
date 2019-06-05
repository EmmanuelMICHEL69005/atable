require 'rest-client'
require 'json'

namespace :fourchette do
  desc "scrap lafourchette"
  task reservations: :environment do
    LafourchetteScrapper.run
  end
end

