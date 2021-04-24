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

  private

  def case_comment_params
    params.require(:case_comment).permit(:content)
  end
end
