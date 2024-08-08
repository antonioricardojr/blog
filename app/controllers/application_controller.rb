class ApplicationController < ActionController::Base
    include Pagy::Backend
    helper PagyHelper
end
