module ApplicationHelper
  include LteHelper

  def action_new?
    params[:action] == "new"
  end
end
