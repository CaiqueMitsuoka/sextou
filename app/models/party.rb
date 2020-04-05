class Party < ApplicationRecord
  extend FriendlyId
  belongs_to :user

  friendly_id :name, :use => :slugged
end
