class Users::KeysController < ApplicationController

  before_action :set_new_key

  def create
    key = new_key.generate
    respond_to do |format|
      if key.save
        format.js { render 'keys/list' }
      end
    end
  end

  def destroy
    key = current_user.keys.find(params[:id])
    key.destroy
    respond_to do |format|
      format.js { render 'keys/list' }
    end
  end
 
  private

  def set_new_key
    @new_key = new_key
  end

  def new_key
    Key.new({ user: current_user })
  end

end
