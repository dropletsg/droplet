class CasesController < ApplicationController
  before_action :set_case, only: %i[show edit update]

  def index
    @cases = Case.all
  end

  def show
    if Rails.env.development?
      @facebook_url = "https://www.facebook.com/plugins/share_button.php?href=https%3A%2F%2Fgoogle.com&layout=button&size=large&appId=321172835013412&width=77&height=28"
    else
      @facebook_url = "https://www.facebook.com/plugins/share_button.php?href=#{case_url(@case)}&layout=button&size=large&appId=321172835013412&width=77&height=28"
    end

    if Rails.env.development?
      @telegram_url = "https://google.com"
    else
      @telegram_url = case_url(@case)
    end
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
