class CocktailsController < ApplicationController
  before_action :find_cocktail, only:[:show, :edit, :update, :destroy]
  def index
    @cocktails = Cocktail.all
  end

  def show
    # finded
    @dose = Dose.new
  end

  def new
    @cocktail = Cocktail.new
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.new(params_cocktail)
    if @cocktail.save
    # byebug
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def edit
    # finded
  end

  def update
    @cocktail.update(params_cocktail)
  end

  def destroy
    @cocktail.destroy
  end

  protected

  def find_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def params_cocktail
    params.require(:cocktail).permit(:name)
  end
end
