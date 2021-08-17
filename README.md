#　users table

| Column            | Type    | Options     |
| --------          | ------  | ----------- |
| nickname          | string  |null: false  |
| email             | string  |null: false ,unique: true|
| encrypted_password| string  |null: false  | 
|first_name         | string  |null: false  | 
|first_name_kana    | string  |null: false  |     
|family_name        | string  |null: false  |
|family_name_kana   | string  |null: false  | 
|birthday           | date    |null: false  |
### Association
has_many :orders
has_many :items



#　items_table
| Column            | Type          | Options      |
| --------          | ------        | -----------  | 
|name               | string        | null: false  |
|description        | text          | null: false  | 
|price              | integer       | null: false  |
|category_id        | integer       | null:false|     
|condition_id       | integer       | null: false  |
|ship_cost_id       | integer       | null: false  | 
|preference_id      | integer       | null: false  |
|ship_day_id       | integer       | null: false  | 
|user               | reference     |foreign key :true| 
### Association
has_one :order
belongs_to :user



#　orders table
| Column            | Type       | Options    |
| --------          | ------     | ---------- |
| post_code         |string      |null: false |
|prefecture_id      | integer    |null: false |
| city              |string      |null: false |
|address            |string      |null: false | 
|building_name      | string     |            |     
|phone_number       | string     |null: false |
|history            |reference   |foreign key |
### Association
belongs_to :history




＃　histories table
| Column         | Type      | Options     |
| --------       | ------    | ----------- |
|user            | reference | foreign key: true |
|item            | reference | foreign key :true|
### Association
has_one :order
