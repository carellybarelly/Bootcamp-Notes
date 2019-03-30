require "employee"

class Startup
    attr_reader :name, :funding, :salaries, :employees
    # set our instance variables
    def initialize(name, funding, salaries)
        @name = name 
        @funding = funding 
        @salaries = salaries
        @employees = []
    end

    def valid_title?(title)
        @salaries.has_key?(title)
    end 

    def >(other_startup) 
        self.funding > other_startup.funding 
    end 

    def hire(employee_name, title)
        if self.valid_title?(title)
        @employees << Employee.new(employee_name, title)
        else 
            # you can just write raise, but best practice is to actually
            # type a string after raise
            raise "title is invalid!"
        end 
    end
    
    def size 
        @employees.length
    end 

    def pay_employee(employee)
        money_owed = @salaries(employee.title)
        if @funding >= money_owed
            employee.pay(money_owed)
        else
            raise "not enough funding!"
        end 
    end 

    def payday
        @employees.each do |employee|
            self.pay_employee(employee)
        end 
    end 

    def average_salary
        sum = 0
        @employees.each do |employee|
            sum += @salaries[employee.title]
        end
        
        sum / (@employees.length * 1.0)
    end
    
    def close
        @employees = []
        @funding = 0
    end 

    def acquire(startup)
        # add funding 
        # self.funding is a getter in our code
        # in order to change funding, we need to reference 
        # @funding directly 
        @funding += startup.funding 
        
        # merge salaries together 
        startup.salaries.each do |title, salary|
            if !@salaries.has_key?(title)
                @salaries[title] = amount
            end 
        end
        
        # hire the other employees 
        @employees += startup.employees

        # 
    end    
end