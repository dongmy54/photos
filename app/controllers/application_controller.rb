class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :tag_list     # 让tag_list在view中可用
  
  
  private

    def tag_list
      Tag.pluck(:name)
    end

end
