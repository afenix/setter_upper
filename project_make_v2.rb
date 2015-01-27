#Project builder script v 2.0 built off the solid bones of Dan's project builder by Alister.
#Version 2 is now updated to auto-populate base language in the Gemfile, Rakefile, app.rb, layout.erb, and database.yml.
#No more typing gem(bla bla) or require(bla bla)...woop woop!
#please use responsibly :D
#no cussing
#2015 danwright.co & Fenix Design
#
project_name = "cool_new_project_name"

puts("Building directory structure...")

system "mkdir", "-p", project_name
system "mkdir", "-p", (project_name + "/lib")
system "mkdir", "-p", (project_name + "/spec")
system "mkdir", "-p", (project_name + "/views")
system "mkdir", "-p", (project_name + "/config")
system "mkdir", "-p", (project_name + "/public")
system "mkdir", "-p", (project_name + "/public/css")
system "mkdir", "-p", (project_name + "/public/img")


puts("Okay, creating files now...")


Dir.chdir project_name
system `touch Gemfile`
open('Gemfile', 'w') { |f|
  f << "source('https://rubygems.org')\n"
  f << "\n"
  f << "gem('rspec')\n"
  f << "gem('sinatra')\n"
  f << "gem('sinatra-contrib')\n"
  f << "gem('sinatra-activerecord')\n"
  f << "gem('rake')\n"
  f << "gem('pry')\n"
  f << "gem('pg')\n"
}

system `touch Rakefile`
open('Rakefile', 'w') { |f|
  f << "require('sinatra/activerecord/rake')\n"
  f << "\n"
  f << "namespace(:db) do\n"
  f << "  task(:load_config) do\n"
  f << "    require(''./app')\n"
  f << "  end\n"
  f << "end\n"
}

system `touch app.rb`
open('app.rb', 'w') { |f|
  f << "require('sinatra/activerecord')\n"
  f << "require('sinatra')\n"
  f << "require('sinatra/reloader')\n"
  f << "also_reload('lib/**/*.rb')\n"
  f << "require('pg')\n"
  f << "require('pry')\n"
  f << "#don't forget to require your methods kids...\n"
}


Dir.chdir "spec"
system `touch spec_helper.rb method_name_spec.rb`


Dir.chdir "../config"
system `touch database.yml`
open('database.yml', 'w') { |f|
  f << "development:\n"
  f << "  adapter: postgresql\n"
  f << "  database: #database_name_development\n"
  f << "\n"
  f << "test:\n"
  f << "  adapter: postgresql\n"
  f << "  database: #database_name_test\n"
}

Dir.chdir "../lib"
system `touch method_name.rb`


Dir.chdir "../views"
system `touch index.erb layout.erb`
open('layout.erb', 'w') { |f|
  f << "<!DOCTYPE html>\n"
  f << "<html>\n"
  f << "<head>\n"
  f << "  <title>Name</title>\n"
  f << "  <link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css'>\n"
  f << "</head>\n"
  f << "<body>\n"
  f << "  <div class='container'>\n"
  f << "   <%= yield %>\n"
  f << "  </div>\n"
  f << "</body>\n"
  f << "</html>\n"
}

Dir.chdir "../public/css"
system `touch styles.css`

puts("All done now.  Don't forget to check your gems, database names, etc to customize it to your unique and lovely project. <3")
