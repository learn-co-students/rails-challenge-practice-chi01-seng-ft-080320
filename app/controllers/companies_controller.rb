class CompaniesController < ApplicationController
     before_action :find_company, only: [:show]

    def index
        @companies = Company.all
    end
    
    def show
    end

    def new
        @company = Company.new
    end

    def create
        @company = Company.new(company_params)
     
        if @company.save
        flash[:success] = "NEW Company Created!"
        redirect_to company_path(@company)
        else 
        flash[:my_errors] = @company.errors.full_messages
        redirect_to new_company_path
        end
    end

    private

    def company_params
        params.require(:company).permit(:name)
    end

    def find_company
        @company = Company.find(params[:id])
    end
end