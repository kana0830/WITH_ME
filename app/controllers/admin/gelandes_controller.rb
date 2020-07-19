class Admin::GelandesController < ApplicationController

  def new
    @gelande = Gelande.new
  end

  def create
    @gelande = Gelande.new(gelande_params)
    if @gelande.save
      redirect_to admin_gelande_path(@gelande)
    else
      render 'new'
    end
  end

  def index
    @gelandes = Gelande.all
  end

  def show
    @gelande = Gelande.find(params[:id])
  end

  def edit
    @gelande = Gelande.find(params[:id])
  end

  def update
    @gelande = Gelande.find(params[:id])
    if @gelande.update(gelande_params)
      redirect_to admin_gelande_path(@gelande)
    else
      render 'edit'
    end
  end

  private
    def gelande_params
      params.require(:gelande).permit(:name, :count, :slope, :distance, :postal, :address, :tel, :hp, :image, :introduction, :is_active)
    end

end
