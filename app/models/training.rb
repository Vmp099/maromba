class Training < ApplicationRecord
  belongs_to :user
  has_many :weigths
  has_many :users
end
