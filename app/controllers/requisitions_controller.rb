class RequisitionsController < ApplicationController

  def new
    @requisition = Requisition.new
  end

  def create
    @requisition = current_user.requisitions.build(requisition_params)
    if @requisition.save
      redirect_to requisitions_path
    else
      render :new
    end
  end

  def index
    @requisitions = current_user.requisitions
  end

  def show
    @requisition = Requisition.where(user_id: current_user.id, id: params[:id]).first
  end

  def edit
    @requisition = Requisition.where(user_id: current_user.id, id: params[:id]).first
  end

  def update
    @requisition = Requisition.where(user_id: current_user.id, id: params[:id]).first
    if @requisition.update(requisition_params)
      flash[:notice] = 'Changes saved'
      redirect_to @requisition
    else
      render :edit
    end
  end

  private

  def requisition_params
    params.require(:requisition).permit(
      :income,
      :address_years,
      :company_years,
      :marital_status,
      :requested_amount,
      :payment_terms,
      :bank,
      :comment,
      :company_name,
      :company_phone_number,
      :dependents_number,
      :company_position,
      :has_sgmm,
      :has_imss,
      :has_car
    )
  end

end
