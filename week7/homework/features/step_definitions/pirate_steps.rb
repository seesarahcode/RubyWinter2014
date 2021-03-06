Gangway /^I have a (\w+)$/ do |arg|
	@translator = Kernel.const_get(arg).new
end

Blimey /^I (\w+) '(.+)'$/ do |method, arg|
	@translator.send(method, arg)
end
# Then
Letgoandhaul /^I hit (\w+)$/ do |arg|
	@result = @translator.send(arg)
end
# Then
Letgoandhaul /^it prints out '(.+)'$/ do |arg|
	@result.split("\n ").first.should == arg
end
#  Then
Letgoandhaul /^it also prints '(.+)'$/ do |arg|
	@result.split("\n ").last.should == arg
end
