require_relative '../../BaseE/Base'
require_relative '../../Page/LoginPage'
require_relative '../../Page/TrainingMaterialPage'
require_relative '../../Case/Add_TrainingMaterial'
@@training=TrainingMaterial.new(self)
Given(/^Admin can log in system$/) do
@@training.setup
end

When(/^file in the relate information$/) do
  @@training.test_TrainingMaterial
end

Then(/^Admin can add training material succ$/) do
  @@training.teardown
end