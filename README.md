## Name
ながのケーキ(ECサイト)

## Features
洋菓子を扱う店舗を想定し、顧客の新規登録から購入、退会までの一連の動作に加え、管理者の商品作成から販売、顧客管理までを扱えるように作成された。  管理者、顧客で行える処理は下記の通りである。

—管理者—  
・新規登録、ログイン   
・商品掲載(画像、商品名、商品詳細、価格）  
・商品ジャンルの作成、編集  
・販売ステータスの変更  
・顧客(登録者)の確認、編集  
  
—顧客—  
・新規登録、ログイン   
・商品の閲覧  
・購入商品をカートに入れる(ログイン時のみ）  
・購入方法の選択  
・登録情報の確認、編集  
・配送先の登録、編集  
・購入履歴の確認  

## Requirement  
--使用言語--  
・Ruby  
・Javascript  

--使用ライブラリ--  
・devise  
・kaminari 0.17.0  
・bootstrap 4.1.1  
・jquery-rails  
・font-awesome-rails  
・refile, require: "refile/rails", github: 'manfe/refile'  
・refile-mini_magick  
・factory_bot_rails  
・faker 2.0.0   
・database_cleaner  
・ransack  
・paranoia  
・enum_help  
・rails-i18n  
  
## Installation  

上記記載のライブラリを各フォームからダウンロード後  
bundel installを行う  
・git clone https://github.com/webcamp-201911-yankees/nagano_cake.git  
・cd nagano_cake  
・rails db:maigrate    
・rails s -b 0.0.0.0  
  
## Author  
—-製作者—-    
  森本 浩友　柏尾 洋平　川端 雄介　春山 大樹  
—-所属—-  
  DMM webcamp受講生  
