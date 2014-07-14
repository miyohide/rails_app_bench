class Tag < ActiveRecord::Base
   # tagは複数のentryを持つ。
   # また、entryもtagを複数持つことから、多対多の関係。
   # throughを指定して多対多の関係を構築する
   has_many :taggings
   has_many :entries, through: :taggings
end
