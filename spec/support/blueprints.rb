require 'machinist/active_record'

Sham.name { |i| "user_#{i}" }

User.blueprint do
  name
end

Beer.blueprint do
  from   { User.make }
  to     { User.make }
  reason "for being awesome"
end
