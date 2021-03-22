class Case < ApplicationRecord
  belongs_to :worker
  belongs_to :coordinator
  belongs_to :user
end
