Given /^(\w+) owes (\w+) a beer (.+)$/ do |from, to, reason|
  Beer.make :from => from, :to => to, :reason => reason
end
