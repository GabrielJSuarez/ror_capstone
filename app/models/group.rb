class Group < ApplicationRecord
  belongs_to :user
  has_many :logs
  has_many :projects, through: :logs
  has_one_attached :group_image
  scope :with_attached_group_image, -> { includes("group_image_attachment": :blob) }

  paginates_per 5
  validates :name, presence: true, length: { minimum: 6 }, uniqueness: { case_sensitive: false }
  validates :group_image, presence: { message: "Need a picture!" }
end
