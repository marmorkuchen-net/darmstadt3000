class Production < ActiveRecord::Base

  has_many :events, dependent: :destroy
  belongs_to :user

  accepts_nested_attributes_for :events, reject_if: :all_blank, allow_destroy: true

  validates :title, presence: true, length: { minimum: 5 }

  mount_uploaders :images, ImageUploader

end
