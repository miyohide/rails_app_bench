class Entry < ActiveRecord::Base
   # entryは複数のtagを持つ。逆にtagは複数のentryを持つ。
   # 多対多の関係を表すため、間にtaggingsを挟んでthroughで指定する
   has_many :tags, through: :taggings
   has_many :taggings

   validates_presence_of :title
   validates_presence_of :body

   # viewで表示するすべてのtagを出力するためのメソッド
   def tag_list
      tags.map(&:tag_name).join(", ")
   end

   # viewからparamsで飛んでくる:tag_listパラメータを処理するメソッド
   # このメソッドがないと、unknown attribute: tag_listで落ちる。
   def tag_list=(names)
      self.tags = names.split(",").map do |n|
         # String#stripで前後の空白を削除
         Tag.where(tag_name: n.strip).first_or_create!
      end
   end
end
