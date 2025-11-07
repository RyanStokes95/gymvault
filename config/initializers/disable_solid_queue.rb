#Disable Solid Queue entirely in production
if Rails.env.production?
  ENV["SOLID_QUEUE_DISABLED"] = "true"
  Rails.application.config.after_initialize do
    puts "🧩 Solid Queue completely disabled for production"
  end
end
