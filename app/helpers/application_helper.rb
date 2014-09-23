module ApplicationHelper

  def app_name
    ENV["APP_NAME"] || 'loan.calc'
  end

end
