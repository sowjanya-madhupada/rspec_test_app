class UserCreatedJob < ActiveJob::Base
  queue_as :default

  def perform(user)
    UserMailer.user_created(user).deliver_now
  end
end
