class CasesController < ApplicationController
  before_action :set_case, only: %i[show edit update shortlist list delete_attachment ]

  def index
    @cases = Case.all
  end

  def show
    @worker = @case.worker
    @url = Rails.env.development? ? "https://google.com" : active_cases_url
    @facebook_url = "https://www.facebook.com/plugins/share_button.php?href=#{@url}&layout=button&size=large&appId=321172835013412&width=77&height=28"
    
    @emails = @case.case_contributors.map(&:email)
  end

  def new
    @case = Case.new
  end

  def create
    @case = Case.new(case_params)
    @case.user = current_user

    if @case.valid?
      @case.save!
      redirect_to @case, notice: "Case has been created successfully."
    else
      render :new
    end
  end

  def edit; end

  def update
    if @case.update(case_update_params.merge({
      status: params[:case][:status] || @case.status
    }))
      redirect_to @case, notice: "Case updated successfully."
    else
      render :edit
    end
  end

  def delete_attachment
    @attachment = ActiveStorage::Attachment.find(params[:delete_attachment_id])
    @attachment.purge

    redirect_to @case, notice: "File has been deleted"
  end

  def cases_roundup_telegram
    selected_cases = params[:select_case]
    cases_id = selected_cases.map(&:to_i)
    @display_messages = ["<div>For more details, please visit: #{root_url}</div>"]
    cases_id.each do |id|
      case_id = Case.find(id)
      @display_messages << "<div><b>#{case_id.worker.alias}</b> <i>(Case Ref ##{id})</i> - #{case_id.story_summary}</div><div>🎯 Target: #{case_id.target_amount.format}</div><div>📌 End Date: #{case_id.end_date.strftime("%d %b %Y")}</div>"
    end
    @display_msg = @display_messages.join("<div><br></div>")
  end

  private

  def case_params
    params.require(:case).permit(:worker_id, :coordinator_id, :title, :story_summary, :story, :start_date, :end_date,
                                 :target_amount, :payment_reference, :status, :category,
                                 :admin_approved, :paid_proof, files: [])
  end

  def case_update_params
    params.require(:case).permit(:worker_id, :coordinator_id, :title, :story_summary, :story, :start_date, :end_date,
                                 :target_amount, :payment_reference, :status, :category,
                                 :admin_approved, :call_done, :paid_proof, files: [],
                                 worker_attributes: [:photo_id_front, :photo_id_back, :id_selfie, :id_type, :id_valid, :payment_link, :payment_qr])
  end

  def set_case
    @case = Case.find(params[:id])
  end

  
end
