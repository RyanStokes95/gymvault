# Disable Solid Queue for deployment to Render
if ENV["RAILS_ENV"] == "production" || ENV["RACK_ENV"] == "production"
  ENV["SOLID_QUEUE_DISABLED"] = "true"
  puts "Solid Queue disabled (boot.rb)"
end

ENV["BUNDLE_GEMFILE"] ||= File.expand_path("../Gemfile", __dir__)

require "bundler/setup"
require "bootsnap/setup"
