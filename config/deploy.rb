set :application, 'yolosparo'
set :repo_url, 'https://github.com/piratas-ar/yolosparo_rb.git'

set :linked_dirs, %w(public/images/senador public/images/legislador)
set :linked_files, %w()
set :rbenv_type, :user

set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w(rake gem bundle ruby rails)
set :rbenv_roles, :all # default value

namespace :deploy do
  desc 'Hace un backup de la base de datos antes de migrarla'
  task :backup, [:set_rails_env] do
    on primary :db do
      within release_path do
        with rack_env: fetch(:rails_env) do
          # https://gist.github.com/rsutphin/9010923
          resolved_release_path = capture(:pwd, '-P')
          set(:release_name, resolved_release_path.split('/').last)
           if test("[ -f db/yolosparo_#{fetch(:rails_env)}.db ]")
              execute :cp,
                  "db/yolosparo_#{fetch(:rails_env)}.db db/yolosparo_#{fetch(:release_name)}.db"
            end
        end
      end
    end
  end

  desc 'Migra la base de datos'
  task :mr_migrate do
    on primary :db do
      within release_path do
        with rack_env: fetch(:rails_env) do
          execute :rake, 'ar:migrate'
        end
      end
    end
  end

  desc 'Importa legigatos'
  task :import do
    on primary :db do
      within release_path do
        with rack_env: fetch(:rails_env) do
          execute :rake, 'import'
        end
      end
    end
  end
end


before 'deploy:mr_migrate', 'deploy:backup'
before 'deploy:restart', 'deploy:mr_migrate'
