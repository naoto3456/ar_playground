# if you have not installed the needed gems, please do the following:
# gem install sqlite3
# gem install activerecord

require "sqlite3"
require "active_record"

# this line configures ActiveRecord to connect to a sqlite3 database in the same folder named "students.sqlite3"
ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :database => "./students.sqlite3")

# This sets up ActiveRecord to use Ruby OOP with SQL data
class Student < ActiveRecord::Base
end

####################################
# Write your test code here

# 1. Create a new student usinı new and save
# student = Student.new(name: "Harry Potter", email: "harry@example.com", age: 18)
# student.save
# puts '### New, Save ###'
# p student

# 2. Create a new student using create
# student2 = Student.create(name: "Harry Potter", email: "harry2@example.com", age: 18)
# puts '### Create ###'
# p student2
# => #<Student id: 22, name: "Harry Potter", email: "harry2@example.com", age: 18, created_at: "2017-04-05 04:16:43", updated_at: "2017-04-05 04:16:43">


# 3. Select all students
# pay attention to the object that is returned to you, is it a Student object or Active Record relation object?
p Student.all
p Student.count
# Why can't you do Student.name or Student.email?


# 4. Select the first student
# pay attention to the object that is returned to you, is it a Student object or Active Record relation object?
p Student.all.first
p Student.all.first.class
# 5. Select the last student
# pay attention to the object that is returned to you, is it a Student object or Active Record relation object?
p Student.all.last

# 6. Use each to iterate through the #<ActiveRecord::Relation> object to display the name of each student
 Student.all.each do |student| 
 	p student.name 
 end

# 7. Find student by the name Dr. Lois Pfeff using where.
# pay attention to the object that is returned to you, is it the Student object or Active Record relation object?
p student = Student.where(name: "Dr. Lois Pfeff")
# What will the following return to you? (remember to comment out the code!)
# p student.id
# p student.name
# p student.email
# p student.age
# we need to use "student.first" or "student[0]"


# 8. Find student by name using find_by
# pay attention to the object that is returned to you, is it the Student object or Active Record relation object?
student = Student.find_by(name: "Dr. Lois Pfeff")
# What will the following return to you?
p student.id
p student.name
p student.email
p student.age

# Do research on the difference between "where" and "find_by".
# returned object type is different.

# 9. Find the student with id = 7 using find and find_by
p Student.find(7)
p Student.find_by(id: 7)
# same

# pay attention to the object that is returned to you, is it the User object or Active Record relation object?
# 10. Update information for student with id = 5 using student.email and save. Change the student's email to elsie@example.com
student = Student.find(5)
p student
student.email = "elsie@example.com"
student.save
p student

# 11. Now use update to update this student's age to 21.
student.update(age: 21)
p student

# 12. Delete student with id 21 using delete
student = Student.find(21)
student.destroy
p Student.all.count
# 13. Delete student with id 22 using destroy
tudent = Student.find(22)
student.destroy
p Student.all.count