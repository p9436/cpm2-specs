module ControllerMacros
  # def login_admin
  #   before(:each) do
  #     @request.env["devise.mapping"] = Devise.mappings[:admin]
  #     sign_in Fabricate :user, admin: true
  #   end
  # end

  def login_admin
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      @current_user = Fabricate :user
      @current_user.stub('admin?').and_return(true)
      sign_in @current_user
      @current_ability = Ability.new(@current_user)
      controller.stub(:current_ability).and_return(@current_ability)
    end
  end

  def login_superadmin
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      @current_user = Fabricate :user
      @current_user.stub('superadmin?').and_return(true)
      sign_in @current_user
      @current_ability = Ability.new(@current_user)
      controller.stub(:current_ability).and_return(@current_ability)
    end
  end




  def login_broker
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      @current_user = Fabricate :user, broker: Fabricate(:broker)
      sign_in @current_user
      @current_ability = Ability.new(@current_user)
      controller.stub(:current_ability).and_return(@current_ability)
    end
  end


end