class EmployeesController < ApplicationController

    def destroy
        employee = Employee.find(params[:id])
        company_id = employee.company.id
        employee.destroy
        redirect_to company_path(company_id)
    end


    def create
        @employee = Employee.new(employee_params(:name, :company_id ))
        company = params[:employee][:company_id]
        if @employee.save
            flash[:success] = "Employee has been hired!!!!"
            redirect_to company_path(company)
        else 
            flash[:errors] = @employee.errors.full_messages
            redirect_to company_path(company)
        end
    end


    private

    def employee_params(*args)
        params.require(:employee).permit(*args)
    end

    

end
