class Student < ApplicationRecord
  before_save { self.email = email.downcase}
  has_secure_password
  validates :name, presence: true,
                  uniqueness: { case_sensitive: false },
                  length: {minimum: 3, maximum: 25}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    length: {maximum: 105},
                    format: { with: VALID_EMAIL_REGEX }
  has_many :student_courses
  has_many :courses, through: :student_courses
end