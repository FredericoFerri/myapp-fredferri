class CategoriesController < ApplicationController
    before_action :set_category, only: %i[ show edit update destroy ]

    public
        # GET /categories
        def index
            @categories = Category.all
        end

        # GET /categories/1
        def show
        end

        # GET /categories/new
        def new
            @category = Category.new
        end

        # GET /categories/1/edit
        def edit 
        end 

        # POST /categories
        def create
            category_params = params.require(:category).permit(:code, :name)
            @category = Category.new(category_params)

            if @category.save
                redirect_to categories_path, notice: 'Category was created.'
            else
                render :new
            end
        end

        # PATCH/PUT /categories/1
        def update
            if @category.update(category_params)
                redirect_to categories_path, notice: "category was successfully updated."
            else
                render :edit, status: :unprocessable_entity
            end
        end

        # DELETE /categories/1
        def destroy
            @category.destroy!
            redirect_to categories_path, notice: "category was successfully destroyed.", status: :see_other
        end

    private
        # Use callbacks to share common setup or constraints between actions.
        def set_category
            @category = Category.find(params.expect(:id))
        end

        # Only allow a list of trusted parameters through.
        def category_params
        params.expect(category: [ :code, :name ])
        end
end
