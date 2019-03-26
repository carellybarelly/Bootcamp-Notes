class Bootcamp
  # define the instance variables
  def initialize(name, slogan, student_capacity)
    @name = name
    @slogan = slogan
    @student_capacity = student_capacity
    @teachers = []
    @students = []
    @grades = Hash.new { |hash, key| hash[key] = [] }
  end

  # write the getter methods
  def name
    @name
  end 

  def slogan
    @slogan
  end 
  
  def teachers
    @teachers
  end

  def students
    @students
  end

  # define the instance methods
  def hire(teacher)
    @teachers << teacher
  end

  def enroll(student)
    if @students.length < @student_capacity 
        @students << student 
        return true
    else
        return false
    end
  end 

  def enrolled?(student)
    @students.include?(student)
  end 

  def student_to_teacher_ratio
    return @students.length / @teachers.length
  end 

  def add_grade(student, grade)
    if enrolled?(student)
        @grades[student] << grade
        return true
    else
        return false
    end
  end

  def num_grades(student)
    return @grades[student].length
  end
  
  def average_grade(student)
    if enrolled?(student) && num_grades(student) > 0
      sum = @grades[student].inject(0) { |accum, ele| accum + ele } 
      return (sum / num_grades(student))
    else
      return nil
    end
  end
end

# NOTE: look into why sum is not an instance method on an array