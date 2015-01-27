#Project builder script v 2.0 built off the solid bones of Dan's project builder by Alister.
#Version 2 is now updated to auto-populate base language in the Gemfile, Rakefile, app.rb, layout.erb, README.md and the database.yml.
#No more typing gem(bla bla) or require(bla bla)...woop woop!
#
#please use responsibly :D
#no cussing
#2015 danwright.co & fenix design

#############################################################################################################################################

#Enter the project name here:
project_name = "cool_project_name_here"

puts("Building directory structure...")

system "mkdir", "-p", project_name
system "mkdir", "-p", (project_name + "/lib")
system "mkdir", "-p", (project_name + "/spec")
system "mkdir", "-p", (project_name + "/views")
system "mkdir", "-p", (project_name + "/config")
system "mkdir", "-p", (project_name + "/public")
system "mkdir", "-p", (project_name + "/public/css")
system "mkdir", "-p", (project_name + "/public/img")


puts("Okay, creating and auto-populating new files now...Booyah")


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


system `touch README.md`
open('README.md', 'w') { |f|
  f << "## Synopsis\n"
  f << "At the top of the file there should be a short introduction and/ or overview that explains **what** the project is. This description should match descriptions added for package managers (Gemspec, package.json, etc.)\n"
  f << "## Code Example\n"
  f << "Show what the library does as concisely as possible, developers should be able to figure out **how** your project solves their problem by looking at the code example. Make sure the API you are showing off is obvious, and that your code is short and concise.\n"
  f << "## Motivation\n"
  f << "A short description of the motivation behind the creation and maintenance of the project. This should explain **why** the project exists.\n"
  f << "## Installation\n"
  f << "Provide code examples and explanations of how to get the project.\n"
  f << "## API Reference\n"
  f << "Depending on the size of the project, if it is small and simple enough the reference docs can be added to the README. For medium size to larger projects it is important to at least provide a link to where the API reference docs live.\n"
  f << "## Tests\n"
  f << "Describe and show how to run the tests with code examples.\n"
  f << "## Contributors.\n"
  f << "Let people know how they can dive into the project, include important links to things like issue trackers, irc, twitter accounts if applicable.\n"
  f << "## License.\n"
  f << "A short snippet describing the license (MIT, Apache, etc.)."
}


Dir.chdir "spec"
system `touch spec_helper.rb method_name_spec.rb`
open('spec_helper.rb', 'w') { |f|
  f << "require('rspec')\n"
  f << "require('pg')\n"
  f << "require('sinatra/activerecord')\n"
  f << "require('task')\n"
  f << "\n"
  f << "RSpec.configure do |config|\n"
  f << "  config.after(:each) do\n"
  f << "    #MethodName.all().each() do |method_singular|\n"
  f << "      #MethodName.destroy()\n"
  f << "    end\n"
  f << "  end\n"
  f << "end\n"
}


open('method_name_spec.rb', 'w') { |f|
  f << "require('spec_helper')\n"
}


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
