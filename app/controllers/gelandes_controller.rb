class GelandesController < ApplicationController
  before_action :authenticate_user!

  def index
    @q = Gelande.where(is_active: "true").ransack(params[:q])
    @gelandes = @q.result(distinct: true).shuffle
  end

  def show
    @gelande = Gelande.find(params[:id])
    gon.gelande = @gelande
    @address = @gelande.address.match(/^.{2,3}[都道府県]/).to_s
    @reviews = @gelande.reviews.all
    gon.gelande_star = @gelande.reviews.average(:star).to_f.round(1)
  end
end
