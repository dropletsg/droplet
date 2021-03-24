class CasesController < ApplicationController
  before_action :set_case, only: %i[edit]

  def index
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
    redirect_to cases_path, notice: "Case updated successfully." if @case.update(case_params)
  end

  private

  def case_params
    params.require(:case).permit(:worker_id, :coordinator_id, :title, :story_summary, :story, :start_date, :end_date,
                                 :target_amount, :payment_reference, :status, :category,
                                 :admin_approved, :paid_proof, :files)
  end

  def set_case
    @case = Case.find(params[:id])
  end
end
