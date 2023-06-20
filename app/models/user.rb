class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

        def self.ransackable_associations(auth_object = nil)
        []
        end
        def self.ransackable_attributes(auth_object = nil)
        ["username"]
      end
end
