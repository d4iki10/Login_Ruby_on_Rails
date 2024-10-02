class AssignDefaultUserToTasks < ActiveRecord::Migration[6.0]
  def up
    # デフォルトのユーザーを作成
    default_user = User.create!(name: 'Default User', email: 'default@example.com', password: 'password', password_confirmation: 'password')

    # すべての既存のタスクにデフォルトユーザーを関連付ける
    Task.where(user_id: nil).update_all(user_id: default_user.id)

    # user_idにnullを許可しないように変更
    change_column_null :tasks, :user_id, false
  end

  def down
    # 元に戻す操作を記述
    change_column_null :tasks, :user_id, true
  end
end
