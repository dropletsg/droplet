class WorkerNote < ApplicationRecord
  belongs_to :worker

  validates :content, presence: true
end
