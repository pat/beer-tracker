class User < ActiveRecord::Base
  has_many :beers_owing, :class_name => "Beer", :foreign_key => :from_id
  has_many :beers_owed,  :class_name => "Beer", :foreign_key => :to_id
  
  validates_presence_of   :name
  validates_uniqueness_of :name
  
  def to_param
    name
  end
  
  def to_json
    {
      'user' => {
        'name'        => name,
        'beers_owing' => beers_owing.count,
        'beers_owed'  => beers_owed.count
      }
    }.to_json
  end
end
