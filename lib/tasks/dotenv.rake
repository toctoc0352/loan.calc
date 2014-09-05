require 'dotenv'

namespace :dotenv do
  desc "Load env"
  task :load do
    Dotenv.load
  end
end
