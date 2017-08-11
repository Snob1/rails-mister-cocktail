class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = @cocktail.doses.new(params_doses)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
  end

  def edit
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def update
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(params_doses)
    if @dose.ingredient.update
      redirect_to cocktail_path(@cocktail)
    else
      render 'edit'
    end
  end

  protected
  def  params_doses
    params.require(:dose).permit(:description,:ingredient_id,:cocktail_id)
  end
end
