class CourseRegistrationDetail < ApplicationRecord
  belongs_to :course
  has_many :course_registration_detail_values
  accepts_nested_attributes_for :course_registration_detail_values 
end
