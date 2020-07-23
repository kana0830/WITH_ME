class GelandesController < ApplicationController
  def index
    @q = Gelande.ransack(params[:q])
    @gelandes = @q.result(distinct: true)
  end

  def show
    @gelande = Gelande.find(params[:id])
    gon.gelande = @gelande
    @address = @gelande.address.match(/^.{2,3}[都道府県]/).to_s
    @reviews = @gelande.reviews.all
  end
end