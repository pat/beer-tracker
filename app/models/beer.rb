class Beer < ActiveRecord::Base
  belongs_to :from, :class_name => "User"
  belongs_to :to,   :class_name => "User"
  
  validates_presence_of :from, :to
  
  def from_with_string=(user)
    user = User.find_or_create_by_name(user) if user.is_a?(String)
    self.from_without_string = user
  end
  
  alias_method_chain :from=, :string
  
  def to_with_string=(user)
    user = User.find_or_create_by_name(user) if user.is_a?(String)
    self.to_without_string = user
  end
  
  alias_method_chain :to=, :string
end
