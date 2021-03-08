class ApplicationJob < ActiveJob::Base
  include ActiveJob::Locking::Serialized

  # Prevent concurrent execution of jobs for the same host
  # (ie revert and create snapshot)
  def lock_key(*args)
    self.arguments.first
  end

  def perform(*args)
    logger.warn "#{self.class.name}: #{self.arguments.first} : START"
    sleep 3
    logger.warn "#{self.class.name}: #{self.arguments.first} : END"
  end

end
