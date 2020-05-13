# frozen_string_literal: true
class User < ApplicationRecord
  devise :database_authenticatable,
         :recoverable,
         :rememberable,
         :validatable

  belongs_to :hospital, optional: true

  enum role: {
    user: 1,
    admin: 2,
  }

  validates :role, presence: true
end
