class Training < ApplicationRecord
  belongs_to :user
  has_many :weigths
  has_many :routines
  has_many :users
  accepts_nested_attributes_for :routines
end
