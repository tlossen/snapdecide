ActionController::Routing::Routes.draw do |map|

  map.connect 'issue/new',
    :controller => 'decision', :action => 'create'
  map.connect 'issue/:code/edit/:participant_id',
    :controller => 'decision', :action => 'edit_column'
  map.connect 'issue/:code/:action',
    :controller => 'decision',
    :defaults => { :action => 'view' }

  map.connect ':controller/:action/:id'

  map.connect '/',
    :controller => 'page'

end
