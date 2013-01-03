class GoogleTasksListProxy < GoogleProxy

  def tasks_list(optional_params={})
    optional_params.reverse_merge!(:tasklist => '@default', :maxResults => 100)
    request :api => "tasks", :resource => "tasks", :method => "list", :params => optional_params, :vcr_id => "_tasks"
  end

end
