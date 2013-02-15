require_relative '../../db/config'

class Student < ActiveRecord::Base
  validates :email, :uniqueness => true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
  validate :young_age
  validates_format_of :phone, :with => /(\(?\d{3}\)?)[\s-](\d{3}[\s-]\d{4})\s?(x\d{4})?/, :on => :create

 def name
   first_name+ ' ' +last_name
 end

 def age
   age = Date.today.year - birthday.year - 1
 end

 def young_age
  if Date.today.year - birthday.year - 1 < 5
    errors.add(:birthday, "This to young")
  end
 end
end


#Add validations to the Student model so that a
#student cannot be saved unless the following
#requirements are met:




=begin

Email addresses must contain at least one @ character and one .
character, with at least one character before the @, one character
between the @ and first ., and at least two characters after the
final ..
Email addresses must be unique across all students.
Students must be at least 5 years old.

=end

# implement your Student model here
# To find a specific row in the student table, do this:
# student = Student.find(1)  (this finds row 1)
# student.last_name   (returns the last name from row 1)
