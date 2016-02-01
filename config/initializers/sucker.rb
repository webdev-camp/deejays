Rails.application.configure do
  config.active_job.queue_adapter = :sucker_punch
end

Devise::Async.backend = :sucker_punch
