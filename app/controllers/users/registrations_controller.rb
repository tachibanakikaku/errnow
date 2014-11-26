class Users::RegistrationsController < Devise::RegistrationsController
  def edit
    @new_key = Key.new
    super
  end
end
