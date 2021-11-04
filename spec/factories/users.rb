FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {Faker::Internet.free_email} # Fakerを使うのは一意性であるここのみで問題がないと考えられる
    password              {'a00000'} # Faker::Alphanumeric.alphanumeric(number: 6, min_alpha: 1, min_numeric: 1) 6文字で最低1文字アルファベット最低1文字数値のFaker,コンソールで動作確認済み
    password_confirmation {password}
    family_name           {'田中'}
    first_name            {'太郎'}
    family_name_kana      {'タナカ'}
    first_name_kana       {'タロウ'}
    birth_day             {'2000/1/1'} # 0000/00/00はNG
  end
end