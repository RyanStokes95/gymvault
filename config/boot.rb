# Disable Solid Queue completely in production before Rails boots
if ENV["RAILS_ENV"] == "production" || ENV["RACK_ENV"] == "production"
  ENV["SOLID_QUEUE_DISABLED"] = "true"
  puts "🧩 Solid Queue disabled (boot.rb)"
end

ENV["BUNDLE_GEMFILE"] ||= File.expand_path("../Gemfile", __dir__)

require "bundler/setup" # Set up gems listed in the Gemfile.
require "bootsnap/setup" # Speed up boot time by caching expensive operations.
