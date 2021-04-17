class CaseContributorsController < ApplicationController
  def new
    @case_contributor = CaseContributor.new
  end

  def create
    @case_contributor = CaseContributor.new(case_contributor_params.merge({ case_id: params[:case_id] }))
    @case_contributor.save!
    redirect_to active_cases_path(@case_contributor.case)
  end

  private

  def case_contributor_params
    params.require(:case_contributor).permit(:name, :email)
  end

end
