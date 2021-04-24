class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  EMAILS_ALLOWED = %w[yuanming.lee91@gmail.com jasonleewkd@gmail.com jaelyn.sng@gmail.com jiiayenn.lee@gmail.com migrantmutualaid@gmail.com]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cases
  has_one_attached :profile_photo

  validates_format_of :email, with: Regexp.union(EMAILS_ALLOWED)
end
