class CaseCommentsController < ApplicationController
  def new
    @case = Case.find(params[:case_id])
    @case_comment = CaseComment.new
  end

  def create
    @case_comment = CaseComment.new(case_comment_params)
    @case = Case.find(params[:case_id])
    @case_comment.case = @case
    @case_comment.save!
  end

  def destroy
    CaseComment.find(params[:comment_id]).update(is_soft_deleted: true)
    redirect_to active_case_path(params[:case_id])
  end

  private

  def case_comment_params
    params.require(:case_comment).permit(:content, :is_soft_deleted)
  end
end
