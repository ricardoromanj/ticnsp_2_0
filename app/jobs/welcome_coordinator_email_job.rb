class WelcomeCoordinatorEmailJob
  include SuckerPunch::Job

  def perform(user, temp_password)
    CoordinatorMailer.welcome_coordinator(user, temp_password).deliver
  end
end
