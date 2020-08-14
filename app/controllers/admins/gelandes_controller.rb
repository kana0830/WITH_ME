class Admins::GelandesController < ApplicationController
  before_action :authenticate_admin!

  def new
    @gelande = Gelande.new
  end

  def create
    @gelande = Gelande.new(gelande_params)
    if @gelande.save
      flash[:notice] = 'ゲレンデ情報を登録しました'
      redirect_to admins_gelande_path(@gelande)
    else
      render 'new'
    end
  end

  def index
    @q = Gelande.ransack(params[:q])
    @gelandes = @q.result(distinct: true).page(params[:page]).per(20)
    respond_to do |format|
      format.html
      format.csv do |csv|
        send_users_csv(@gelandes)
      end
    end
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
      flash[:notice] = 'ゲレンデ情報を更新しました'
      redirect_to admins_gelande_path(@gelande)
    else
      render 'edit'
    end
  end

  # CSVインポート
  def import
    Gelande.import(params[:file])
    redirect_to admins_gelandes_path
  end

  # CSVエクスポート
  def send_users_csv(gelandes)
    csv_data = CSV.generate do |csv|
      header = %w(id name count slope distance postal address tel hp introduction)
      csv << header
      gelandes.each do |gelande|
        values = [gelande.id, gelande.name, gelande.count, gelande.slope, gelande.distance, gelande.postal, gelande.address, gelande.tel, gelande.hp, gelande.introduction]
        csv << values
      end
    end
    send_data(csv_data, filename: 'ゲレンデ一覧情報')
  end


  private
  def gelande_params
    params.require(:gelande).permit(:name, :count, :slope, :distance, :postal, :address, :tel, :hp, :image, :introduction, :is_active)
  end

end
