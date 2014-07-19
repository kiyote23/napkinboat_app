FactoryGirl.define do
	factory :user do
		name					"Rambo Mambo"
		email					"example@foobar.com"
		password				"foobar"
		password_confirmation	"foobar"
	end
end