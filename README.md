#users table

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
has_many :items
has_many :orders




items table
| Column            | Type          | Options      |
| --------          | ------        | -----------  | 
|name               | string        | null: false  |
|description        | text          | null: false  | 
|price              | integer       | null: false  |
|category           | active hash   | null: false  |     
|condition          | active hash   | null: false  |
|ship_cost          | active hash   | null: false  | 
|ship_from          | active hash   | null: false  |
|ship_days          | active hash   | null: false  | 
|user               | reference     |foreign key :true| 

### Association
belongs_to :user
has_one    :order

orders table
| Column            | Type       | Options    |
| --------          | ------     | ---------- |
| post_code         | integer    |null: false |
| preference        | active hash|null: false |
| city              | text       |null: false |
|address            | text       |null: false | 
|building_name      | string     |null: false |     
|phone_number       | integer    |null: false |
|item               |reference|  |foreign key |
 
### Association
belongs_to :user
belongs_to :item
has_one    :history

histories table
| Column         | Type      | Options     |
| --------       | ------    | ----------- |
|user            | reference | foreign key: true |
|item            | reference | foreign key :true|
### Association
belongs_to :order

