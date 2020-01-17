class EmployeesController < ApplicationController
    def index
      @employees = Employee.all
    end
    def new
      @employee = Employee.new
    end
  
    def create
      @employee = Employee.new({code: params['employee']['code'], name: params['employee']['name'], role: params['employee']['role'].to_i, level: params['employee']['level'].to_i} )
      if @employee.save
        redirect_to employees_path
      else
        render 'new'
      end
    end
  
    def edit
      @employee = Employee.find(params['id'])
      if @employee.nil?
        redirect_to employees_path
      end
    end
  
    def update
      @employee = Employee.find(params['id'])
      if @employee.nil?
        redirect_to employees_path
      end
      @employee.update({code: params['employee']['code'], name: params['employee']['name'], role: params['employee']['role'], level: params['employee']['level']})
      if @employee.save
        redirect_to employees_path
      else
        render 'edit'
      end
    end
  
    def show
  
    end
  
  end
  