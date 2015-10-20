# TB configuration
## TB List
1. prototypes 
2. comments
3. likes
4. users
5. tags
6. tagtypes
7. prototype_tags
8. images

## columns & association
######1. prototypes
`belongs_to :user`  
`has_many :comments`  
`has_many  :likes`  
`has_many  :images`  
`has_many :tags, through: :prototype_tags`  
 - id (integer)
 - user_id (integer)
 - title (string)
 - catchcopy (string)
 - concept (text)
 - image

######2. comments
`belongs_to :user`  
`belongs_to :prototype`  
 - id (integer)
 - prototype_id (integer)
 - user_id (integer)
 - comment (text)

######3. likes
`belongs_to :user`  
`belongs_to :prototype`  
 - id (integer)
 - prototype_id (integer)
 - user_id (integer)

######4. users
`has_many :comments`  
`has_many :likes`  
`has_many :prototypes`  
 - id (integer)
 - name (string)
 - email (string)
 - password (string)
 - member (string)
 - profile (text)
 - works (text)
 - avatar

######5. tags
`has_many :prototypes, through: :prototype_tags`  
`belongs_to :tagtype`  
 - id (integer)
 - tagtype_id (integer)
 - name (string)

######6. tagtypes
`has_many :tags`  
 - id (integer)
 - name (string)

######7. prototype_tags
`belongs_to :user`  
`belongs_to :prototype`  
 - prototype_id (integer)
 - user_id (integer)

######8. images
`belongs_to :prototype`  
 - id (integer)
 - prototype_id (integer)
 - image
