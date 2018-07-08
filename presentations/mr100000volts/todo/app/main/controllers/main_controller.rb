class MainController < Volt::ModelController
  model :store

  def add_todo
      _todos << page._new_todo
      page._new_todo = {}
  end

  private

  def main_path
    params._controller.or('main') + '/' + params._action.or('index')
  end

  def active_tab?
    url.path.split('/')[1] == attrs.href.split('/')[1]
  end
end