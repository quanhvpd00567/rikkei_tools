class HomeController < ApplicationController
  def index
    @projects = Project.all
    @employees = Employee.all
    @year = params[:year].present? ? params[:year] : Time.now.year
    @workByYear = Work.where({year: @year})
    @work = Work.new
  end

  def update
    year = 2020
    @employees = Employee.all
    @employees.each do |emp|
      row_emp = params["emp_#{emp.id}"]
      if row_emp.present?
        (1..12).each do |month|
        # if row_emp["month_#{month}"].present?
          dataProject = row_emp["month_#{month}"].present? ? row_emp["month_#{month}"] : nil
          work = Work.where({month: month, employee_id: emp.id, year: year }).first
          if work.present?
            work.project_id = dataProject
          else
            work = Work.new({month: month, employee_id: emp.id, year: year, project_id: row_emp["month_#{month}"]})
          end
          work.save
        # end
       end
      end
    end
    redirect_to home_path(year: year)
  end

  def search
    @roles = Employee.roles
    @levels = Employee.levels
    @projects = Project.all
    @code = params[:code].present? ? params[:code].to_i : nil
    @year = params[:year].present? ? params[:year] : Time.now.year
    @role = params[:role].present? ? params[:role].to_i : nil
    @level = params[:level].present? ? params[:level].to_i : nil
    @fromMonth = params[:fromMonth].present? ? params[:fromMonth].to_i : 1 
    @toMonth = params[:toMonth].present? ? params[:toMonth].to_i : 12
    @project = params[:project].present? ? params[:project].to_i : nil

    
    # search employee
    employees = Employee.all
    # employees = employees.where(code: @code) if @code.present?
    employees = employees.where(role: @role) if @role.present?
    employees = employees.where(level: @level) if @level.present?

    emp_id = employees.pluck(:id)
    
    # search work 
    if emp_id.first.present?
      work = Work.where(year: @year)
      work = work.where('employee_id IN (?) ', emp_id)
      work = work.where('month BETWEEN ? AND ?', @fromMonth, @toMonth) if @fromMonth && @toMonth
      work = work.where(project_id: @project)
    end
    emp_ids = work.pluck(:employee_id)

    @employees = Employee.where("id IN (?)", emp_ids)
    
    @workByYear = work
  end

end
