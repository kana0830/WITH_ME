class Admins::HomeController < ApplicationController
  before_action :authenticate_admin!

  def top
    days = (Date.today.beginning_of_month..Date.today).to_a
    # 後々、usersとtransposeする予定なので、rangeではなく、arrayに変更

    users = days.map { |item| User.where(:created_at => item.beginning_of_day..item.end_of_day).count }
    # mapでそれぞれの日にちに登録されたユーザー数をカウント

    @graph = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(text: "月間ユーザー登録推移")
      f.xAxis(categories: days)
      f.series(name: '登録数', data: users)
    end
  end
  
end
