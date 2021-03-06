core = 6.x
api = 2

projects[drupal][type] = "core"

; this makefile will make sure we get the development code from the
; aegir modules instead of the tagged releases
includes[devshop] = "drupal-org.make"

; Aegir Modules
projects[hosting][version] = "2.3"
projects[modalframe][version] = "1.9"

; Contrib Modules
projects[admin_menu][version] = "1.9"
projects[admin_menu][subdir] = contrib

projects[adminrole][version] = "1.3"
projects[adminrole][subdir] = contrib

projects[openidadmin][version] = "1.2"
projects[openidadmin][subdir] = contrib

projects[install_profile_api][version] = "2.2"
projects[install_profile_api][subdir] = contrib

projects[jquery_ui][version] = "1.5"
projects[jquery_ui][subdir] = contrib

projects[jquery_update][version] = "2.0-alpha1"
projects[jquery_update][subdir] = contrib

projects[views][version] = "3.2"
projects[views][subdir] = contrib

projects[views_bulk_operations][version] = "1.16"
projects[views_bulk_operations][subdir] = contrib

projects[ctools][version] = "1.12"
projects[ctools][subdir] = contrib

projects[hosting_filemanager][version] = "1.0-beta1"
projects[hosting_filemanager][subdir] = contrib

projects[hosting_tasks_extra][version] = "2.1"
projects[hosting_tasks_extra][subdir] = contrib

; Aegir Contrib maintained by devshop maintainers
projects[hosting_solr][version] = "1"
projects[hosting_solr][subdir] = contrib

projects[hosting_logs][version] = "2"
projects[hosting_logs][subdir] = contrib

projects[hosting_site_backup_manager][version] = "2.0"
projects[hosting_site_backup_manager][subdir] = contrib

; Libraries
libraries[jquery_ui][download][type] = "get"
libraries[jquery_ui][destination] = "modules/contrib/jquery_ui"
libraries[jquery_ui][download][url] = "http://jquery-ui.googlecode.com/files/jquery-ui-1.7.3.zip"
libraries[jquery_ui][directory_name] = "jquery.ui"
