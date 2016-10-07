crumb :root do
  link " Home ", root_path
end

crumb :user do
	link "ユーザーページ",users_path
	parent :root
end



crumb :root do
  link " Home ", root_path
end

crumb :user do
	link "ユーザーページ",users_path
	parent :root
end



crumb :housing do
	link  "住まい" ,"/category/housing?category=住まい"
	parent :root
end


crumb :event do
	link  "イベント" ,"/category/event/?category=イベント"
	parent :root
end
crumb :lesson do
	link  "習い事" ,"/category/lesson?category=習い事"
	parent :root
end

crumb :health do
	link  "健康" ,"/category/health?category=健康"
	parent :root
end

crumb :others do
	link  "その他" ,"/category/others?category=その他"
	parent :root
end



crumb :housing_notes do
	link  Category.find_by(name: params[:category]).name,housing_notes_path
     parent :housing
end
crumb :event_notes do
	link  Category.find_by(name: params[:category]).name,
	event_notes_path
     parent :event
end
crumb :lesson_notes do
	link  Category.find_by(name: params[:category]).name,lesson_notes_path
     parent :lesson
end
crumb :health_notes do
	link  Category.find_by(name: params[:category]).name,health_notes_path
     parent :health
end
crumb :others_notes do
	link  Category.find_by(name: params[:category]).name,others_notes_path
     parent :others
end



# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).


# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).
