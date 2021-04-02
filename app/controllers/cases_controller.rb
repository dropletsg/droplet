class CasesController < ApplicationController
  before_action :set_case, only: %i[show edit update]

  def index
    @cases = Case.all
  end

  def show
    @worker = @case.worker

    @url = Rails.env.development? ? "https://google.com" : case_url(@case)
    @facebook_url = "https://www.facebook.com/plugins/share_button.php?href=#{@url}&layout=button&size=large&appId=321172835013412&width=77&height=28"
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
    if @case.update
      redirect_to cases_path, notice: "Case updated successfully."
    end
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
