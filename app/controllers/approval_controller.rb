class ApprovalController < ApplicationController
  before_filter :authenticate_user!
  before_filter do 
    redirect_to home_path unless user_signed_in? && current_user.admin?
  end

  def approved
    @pins = Pin.where(approved: true).order("created_at desc")
  end

  def index
    @pins = Pin.where(approved: [false, nil]).order("created_at desc")
  end

  def edit
    @pin = Pin.find(params[:id])
    # redirect_to approval_path
  end

  def show
    @pin = Pin.find(params[:id])
  end

  def update
    @pin = Pin.find(params[:id])

    respond_to do |format|
      if @pin.update_attributes(params[:pin])
        format.html { redirect_to approval_index_path, notice: 'Approved' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pin.errors, status: :unprocessable_entity }
      end
    end
  end

end
