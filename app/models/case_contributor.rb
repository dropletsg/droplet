class CaseContributor < ApplicationRecord
  validates :name, :email, :case_id, presence: true
  belongs_to :case
  has_many :case_comments
end
