require 'spec_helper'
require 'mailman-rails'

describe "Mailman" do

	test_root = File.expand_path('../../',__FILE__)

	before(:all) do
		"cp #{test_root}mailman_test.eml #{test_root}/app/mailers/maildir/new/mailman_test.eml"

		Mailman::Rails.configure do
			self.maildir = "#{test_root}/app/mailers/maildir"
		end
		#"bundle exec rake mailman:start"
	#	Mailman::Rails.start
#		emails_parsed = 0
	end

	after(:all) do
		#"bundle exec rake mailman:stop"
		#Mailman::Rails.stop
	end

	it "should read email from the Maildir" do
		"cp #{test_root}mailman_test.eml #{test_root}/app/mailers/maildir/new/mailman_test.eml"
		emails_parsed = 0
		Mailman::Rails.receive do
			default do
				emails_parsed =+ 1
			end
		end
		emails_parsed.should eq(1)
	end
end	
