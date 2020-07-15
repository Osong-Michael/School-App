class Course < ApplicationRecord
  validates :course_code, presence: true, length: {minimum:3, maximum:7}
  validates :name, presence: true, length: {minimum:5, maximum:35}
  validates :description, presence: true, length: {minimum:15, maximum:300}
end