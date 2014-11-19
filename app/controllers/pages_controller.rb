class PagesController < ApplicationController
  include ApiAuth

  before_action :authenticate

  def show
  end

end
