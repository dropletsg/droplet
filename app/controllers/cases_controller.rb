class CasesController < ApplicationController
  before_action :set_case, only: %i[show edit update shortlist list]

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
    return unless @case.update(case_update_params)

    redirect_to @case, notice: "Case updated successfully."
  end

  def list
    @case.update(status: 'to be listed')
    redirect_to @case, notice: "Case approved to be listed."
  end

  private

  def case_params
    params.require(:case).permit(:worker_id, :coordinator_id, :title, :story_summary, :story, :start_date, :end_date,
                                 :target_amount, :payment_reference, :status, :category,
                                 :admin_approved, :paid_proof, :files)
  end

  def case_update_params
    params.require(:case).permit(:call_done, :paid_proof, files: [], worker_attributes: [:photo_id_front, :photo_id_back, :id_selfie, :id_type, :id_valid, :payment_link, :payment_qr])
  end

  def set_case
    @case = Case.find(params[:id])
  end

  def verification_completed?

    @case = set_case
    @case.call_done && @case.worker.photo_id_front.attached? && @case.worker.photo_id_back.attached? &&
    @case.worker.id_selfie.attached? && @case.worker.id_type.present? && @case.worker.id_valid && @case.worker.payment_link.present? &&
    @case.worker.payment_qr.attached? && @case.files.attached? && @case.paid_proof.attached?

  end
end
