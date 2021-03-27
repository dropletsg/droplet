class CasesController < ApplicationController
  before_action :set_case, only: %i[show edit update]

  def index
    @cases = policy_scope(Case).order(created_at: :desc)
  end

  def show
    authorize @case
  end

  def new
    @case = Case.new
    authorize @case
  end

  def create
    @case = Case.new(case_params)
    @case.user = current_user
    authorize @case
    if @case.save!
      redirect_to cases_path, notice: "Case is created successfully."
    else
      render :new
      flash[:alert] = "Case not created."
    end


  end

  def edit
    authorize @case
  end

  def update
    redirect_to cases_path, notice: "Case updated successfully." if @case.update(case_params)
    authorize @case
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
