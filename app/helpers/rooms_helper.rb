module RoomsHelper

  # 最新メッセージのデータを取得して表示するメソッド
  def most_new_message_preview(room)
    # 最新メッセージのデータを取得する
    message = room.messages.order(updated_at: :desc).limit(1)
    # 配列から取り出す
    message = message[0]
    # メッセージの有無を判定
    if message.present?
      # メッセージがあれば内容を表示
      tag.p "#{message.content}", class: "dm_list__content__link__box__message d-inline"
    else
      # メッセージがなければ[ まだメッセージはありません ]を表示
      tag.p "[ まだメッセージはありません ]", class: "dm_list__content__link__box__message d-inline"
    end
  end

  # 相手ユーザー名を取得して表示するメソッド
  def opponent_user(room)
    # 中間テーブルから相手ユーザーのデータを取得
    entry = room.entries.where.not(user_id: current_user)
    if entry[0] != nil
      # 相手ユーザーの名前を取得
      entry_name = entry[0].user.name
      # 名前を表示
      tag.p "#{entry_name}", class: "dm_list__content__link__box__name d-inline"
    end
  end
  
end
