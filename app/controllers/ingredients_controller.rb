# frozen_string_literal: true

class IngredientsController < ApplicationController
  before_action :set_ingredient, only: %i[show edit update destroy]

  def index
    @ingredients = current_user.ingredients.ordered
  end

  def show; end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = current_user.ingredients.build(ingredient_params)

    if @ingredient.save
      flash.now[:notice] = 'Ingredient was successfully created.'

      respond_to do |format|
        format.html { redirect_to ingredients_path }
        format.turbo_stream
      end
    else
      flash.now[:alert] = 'Failed to create the Ingredient.'
      render :new, status: :unprocessable_entity
    end

  end

  def edit; end

  def update
    if @ingredient.update(ingredient_params)
      flash.now[:notice] = 'Ingredient was successfully updated.'

      respond_to do |format|
        format.html { redirect_to ingredients_path }
        format.turbo_stream
      end
    else
      flash.now[:alert] = 'Failed to update the Ingredient.'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @ingredient.destroy
      flash.now[:notice] = 'Ingredient was successfully destroyed.'

      respond_to do |format|
        format.html { redirect_to ingredients_path }
        format.turbo_stream
      end
    else
      flash.now[:alert] = 'Failed to destroy the Ingredient.'
    end
  end

  private

  def set_ingredient
    @ingredient = current_user.ingredients.find(params[:id])
  end

  def ingredient_params
    params.require(:ingredient).permit(:name, :price)
  end
end
