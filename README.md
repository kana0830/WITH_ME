# WITH ME
<img width="1440" alt="スクリーンショット 2020-08-30 9 46 04" src="https://user-images.githubusercontent.com/62163875/91648711-e7578f00-eaa5-11ea-933c-eb7ba3b1e105.png">

## サイト概要
スノーボードをしに行きたいけど1人はちょっと…<br>
1人でも行くけど、現地で誰かと滑ったりしたい…<br>
スノーボードという同じ趣味を持った友達が欲しい…<br>
そんな願いが簡単に叶うサイトです。<br>
URL:https://withme.work/


### サイトテーマ
スノーボーダーのためのコミュニティサイト


### テーマを選んだ理由
自分自身がスノーボードをしたい時に友達となかなか予定が合わず、行きたいけど行けないという状況が何度もありました。<br>
そういう時に一緒に行ける人を見つけられるようなサイトがあれば、活用していたと思います。<br>
私自身は一人でも滑りに行けるようになりましたが、その際も現地で1本でも一緒に滑れる人がいたり、現地に友達ができたらもっと楽しめたのではないかと思います。<br>
また当時このようなサイトがないか探したがほとんど無かったため、その時に感じたあったらいいなを実現できるコミュニティサイトを作成しようと思い至りました。


### ターゲットユーザ
スノーボーダー


### 主な利用シーン
スノーボードが好きな人が一緒に滑れる仲間を探したい時<br>
スノーボードを趣味とする人達と交流したい時

## 使用技術

### 使用言語
Ruby 2.5.7</br>
Rails 5.2.4.3</br>
Javascript(jQuery)</br>

### 開発環境
Vagrant + VirtualBox

### インフラ
AWS(VPC, EC2, RDS, CloudWatch, Route53)<br>
MySQL2<br>
Nginx(Webサーバ)<br>
Capistrano

### AWS構成図
![Untitled Diagram](https://user-images.githubusercontent.com/62163875/91648806-d78c7a80-eaa6-11ea-8f03-dd835d795723.png)

### その他の技術(gem 等)
slim-rails / html2slim<br>
pry-byebug<br>
dotenv-rails<br>
devise<br>
kaminari<br>
bootstrap4<br>
refile / refile-mini_magick<br>
simple_calendar<br>
acts-as-taggable-on<br>
rails_autolink<br>
select2-rails<br>
lazy_high_charts<br>

### ER図
![ER図 (1)](https://user-images.githubusercontent.com/62163875/91648848-8fba2300-eaa7-11ea-807b-e73ab0d43d41.png)

### 主な機能
・ユーザー登録機能（ユーザー・管理者）<br>
　ログイン、ログアウト<br>
　プロフィール編集<br>
・投稿機能<br>
　新規投稿<br>
　編集、削除<br>
・コメント機能（非同期）
  新規投稿<br>
  削除<br>
・レビュー機能（非同期）<br>
  新規投稿<br>
  削除<br>
・スケジュール登録（カレンダー）機能
  新規登録<br>
  編集、削除<br>
・いいね機能（非同期通信）<br>
・フォロー、フォロワー機能<br>
・DM機能<br>
・通知機能（いいね・コメント・フォロー）<br>
・検索機能（ユーザー・ゲレンデ・投稿）<br>
・ソート機能（管理者ページ全項目）<br>
・お問い合わせ機能<br>
・天気表示<br>
・地図表示<br>
・CSVインポート・エクスポート機能<br>


## 設計書

### 機能一覧
https://docs.google.com/spreadsheets/d/1YBlpRdnf2MjyskyoABDqCmLCRDZuY4UAIc1fVU6grd0/edit#gid=0

