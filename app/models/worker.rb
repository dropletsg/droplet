class Worker < ApplicationRecord
  has_many :cases
  has_many :case_notes
end
