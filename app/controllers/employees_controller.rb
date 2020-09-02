class EmployeesController < ApplicationController

    def destroy
        employee = Employee.find(params[:id])
        company_id = employee.company.id
        employee.destroy
        redirect_to company_path(company_id)
    end

end
