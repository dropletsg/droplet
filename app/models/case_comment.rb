class CaseComment < ApplicationRecord
  belongs_to :case
  belongs_to :case_contributor
end
