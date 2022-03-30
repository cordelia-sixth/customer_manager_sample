class ApplicationController < ActionController::Base
  # リクエストされたURLによって使うview layoutを変更する
  layout :set_layout

  # 例外補足
  rescue_from StandardError, with: :rescue500

  private def set_layout
    if params[:controller].match(%r{\A(staff|admin|customer)/})
      Regexp.last_match[1]
    else
      "customer"
    end
  end

  private def rescue500(e)
    render "errors/internal_server_error", status: 500
  end
end
