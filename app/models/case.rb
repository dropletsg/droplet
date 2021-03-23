class Case < ApplicationRecord
  belongs_to :worker
  belongs_to :coordinator
  belongs_to :user
  has_many :payments
  has_many :case_notes
end
