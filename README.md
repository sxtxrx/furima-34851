<<<<<<< Updated upstream
#users table

| Column            | Type    | Options     |
| --------          | ------  | ----------- |
| nickname          | string  | null: false |
| email             | string  | null: false |
| password          | string  | null: false |
|first_name         | string  |null: false  | 
|first_name_kana    | string  |null: false  |     
|family_name        | string  | null: false |
|family_name_kana   | string  |null: false  | 
|first_name_kana|   | string  |null: false  |        
|family_name_kana   | string  |null: false  | 
|birthday           | string  |null: false  |

### Association
has_many :items
has_many :orders




items table
| Column            | Type          | Options     |
| --------          | ------        | ----------- |
| image             | active storage| null: false |
| name              |string         | null: false |
| city              | text          | null: false |
|description        | text          |null: false  | 
|category           | active hash   |null: false  |     
|condition          |  active hash  | null: false |
|ship_cost          | active hash   | foreign key | 
|ship_from          |  active hash  |null:false|        
|ship_days          | active hash   |null: false  | 
|birthday           | string        |null: false  |
|item               |reference      |foreign key  |
|preference         |active hash    |null: false  | 
|city               |string         |null: false  |

### Association
belongs_to :users
has_one    :orders

orders table
| Column            | Type      | Options     |
| --------          | ------    | ----------- |
| post_code         | integer   | null: false |
| preference        |active hash| null: false |
| city              | text      | null: false |
|address            | text      |null: false  | 
|building_name      | string    |null: false  |     
|phone_number       | integer   | null: false |
|user               | reference | foreign key | 
|first_name_kana|   | string    |null: false  |        
|family_name_kana   | string    |null: false  | 
|birthday           | string    |null: false  |
|item               |reference  |foreign key  |
|preference         |active hash|null: false  | 
|city               |string     |null: false  |

### Association
belongs_to :users
belongs_to :items
has_one    :cards

cards table
| Column            | Type      | Options     |
| --------          | ------    | ----------- |
|user_id            | reference | foreign key |
|item_id            |reference  | foreign key |
### Association
belongs_to :orders
=======
# README
>>>>>>> Stashed changes
