ENV["RAILS_ENV"] ||= "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/pride'

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!
  include FactoryGirl::Syntax::Methods

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  # fixtures :all

  # Add more helper methods to be used by all tests here...

  def login_as(role)
    user = FactoryGirl.create(
      :user,
      person: FactoryGirl.create(:person),
      role: role.to_s
    )
    session[:user_id] = user.id
    user
  end

  def sign_in(user)
    post "/session", user: { email: user.email, password: user.password }
  end
end
