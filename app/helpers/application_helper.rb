module ApplicationHelper
  def query_array
    params[:q].to_s.split(' ')
  end
end
