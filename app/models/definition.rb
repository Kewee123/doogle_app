class Definition < ApplicationRecord
  belongs_to :word
  validates :content, presence: true
end
