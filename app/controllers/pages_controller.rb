class PagesController < ApplicationController
  include ApiAuth

  before_action :authenticate, only: [ :show ]

  def show
  end

  def new
    appl = Application.find(params[:application_id])
    @page = Page.new(application: appl)
  end

end
