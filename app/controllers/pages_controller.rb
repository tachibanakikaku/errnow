class PagesController < ApplicationController
  include ApiAuth

  skip_before_filter :authenticate_user!, only: [ :show ]

  before_action :api_authenticate, only: [ :show ]

  before_action :set_page, only: [ :show, :edit, :destroy ]

  def show
    render text: @page.content
  end

  def new
    @appl = Application.find(params[:application_id])
    @page = Page.new(application: @appl)
  end

  def edit
  end

  def create
    @page = Page.new(page_params)
    @page.application = Application.find(params[:application_id])

    respond_to do |format|
      if @page.save
        format.html { redirect_to @page.application, notice: 'ページが作成されました' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    @page = Page.find(params[:page_id])
    respond_to do |format|
      if @page.update(page_params)
        format.html { redirect_to @page.application, notice: 'ページが更新されました' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    appl = @page.application
    @page.destroy
    respond_to do |format|
      format.html { redirect_to appl, notice: 'ページが削除されました' }
    end
  end

  private
    def set_page
      @page = Page.find_by_application_id_and_status_code(params[:application_id], params[:status_code])
    end

    def page_params
      params.require(:page).permit(:status_code, :content, :application_id, :comment)
    end
  
end
