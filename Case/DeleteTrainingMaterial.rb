require 'test/unit'
require '../Page/TrainingMaterialPage'
require '../Case/BaseCase'

class DeleteTrainingMaterial < BaseCase




    @@trainingmaterialpage=TrainingMaterialPage.new
    # Called before every test method runs. Can be used
    # to set up fixture information.


    # Fake test
    def test_Delete
      login("cn.fra", "12345")


      @@title="Automation"
      $action.open($link+"/Stuff/TrainStuffList.aspx")
      assert_equal(@@loginpage.getTitle,"EF Online Academy")

      sleep 6
      @@trainingmaterialpage.titleFilter(@@title)
      @@trainingmaterialpage.search
      sleep 3
      @@trainingmaterialpage.delete
    end

end