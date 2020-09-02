class CompaniesController < ApplicationController

    def index
        @companies = Company.all
    end


    def show
        @company = Company.find(params[:id])
        @employee = Employee.new()

    end

    def new
        @company = Company.new()
    end

    def edit 
        @company = Company.find(params[:id])
    end


    def create
        @company = Company.create(company_params(:name, offices_attributes: [:id, :offices, {:offices => []}] ) )
        if @company.save
            flash[:company] = "Welcome to our organization!!!"
            redirect_to company_path(@company)
        else 
            flash[:errors] = @company.errors.full_messages
            redirect_to new_company_path(@company)
        end
    end

    private
    
    def company_params(*args)
        params.require(:company).permit(*args)
    end

end