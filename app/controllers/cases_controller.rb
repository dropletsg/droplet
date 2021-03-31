class CasesController < ApplicationController
  before_action :set_case, only: %i[show edit update]

  def index
    @cases = Case.all
  end

  def show
    @worker = @case.worker
  end

  def new
    @case = Case.new
  end

  def create
    @case = Case.new(case_params)
    @case.user = current_user

    if @case.save!
      redirect_to cases_path, notice: "Case is created successfully."
    else
      render :new
      flash[:alert] = "Case not created."
    end
  end

  def edit; end

  def update
    # raise
    if @case.update(case_update_params)
      redirect_to @case, notice: "Case updated successfully."
    else
      render :show
      # TODO
    end
  end

  private

  def case_params
    params.require(:case).permit(:worker_id, :coordinator_id, :title, :story_summary, :story, :start_date, :end_date,
                                 :target_amount, :payment_reference, :status, :category,
                                 :admin_approved, :paid_proof, :files)
  end

  def case_update_params
    params.require(:case).permit(:paid_proof, files: [], worker_attributes: [:photo_id_front, :photo_id_back, :id_selfie, :id_type, :id_valid, :payment_link, :payment_qr])
  end

  def set_case
    @case = Case.find(params[:id])
  end
end
