class ApplicationController < ActionController::Base
  # リクエストされたURLによって使うview layoutを変更する
  layout :set_layout

  private def set_layout
    if params[:controller].match(%r{\A(staff|admin|customer)/})
      Regexp.last_match[1]
    else
      "customer"
    end
  end
end
