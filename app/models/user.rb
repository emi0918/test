class User < ActiveRecord::Base



VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }


validates :email, 
presence: { message:  "メールアドレスを入力してください"},
uniqueness: { message: "既に登録済みのメールアドレスです。"}

end





