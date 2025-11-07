if ENV["SOLID_CABLE_DISABLED"] == "true"
  Rails.application.config.skip_solid_cable = true
  puts "Solid Cable disabled for this environment"
end