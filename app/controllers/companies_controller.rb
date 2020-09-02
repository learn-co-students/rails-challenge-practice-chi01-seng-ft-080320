class CompaniesController < ApplicationController

    def index
        @companies = Company.all
    end


    def show
        @company = Company.find(params[:id])
    end

    def new
        @company = Company.new()
    end

    def edit 
        @company = Company.find(params[:id])
    end


    def create
        @company = Company.create(company_params(:name, offices_attributes: [:id, :offices, {:offices => []}] ) )
        byebug
        if @company.save
            redirect_to company_path(@company)
        else 
            flash[:errors] = @company.errors.full_messages
            redirect_to new_company_path(@company)
        end
        byebug
    end

    private
    
    def company_params(*args)
        params.require(:company).permit(*args)
    end

    # def create_offices(company)
    #     offices_array= params[:company][:offices][:offices]
    #     building = params[:company][:offices][:id]
    #     offices_array.each do |office|
    #         office.build(floor: )
    #     end

    # end

end