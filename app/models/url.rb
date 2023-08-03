class Url < ApplicationRecord
  has_many :tags, dependent: :destroy

  validates :link, presence: true, uniqueness: true
end