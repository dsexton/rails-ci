RUBIES = {
  '2.4' => %w[2.4.0 2.4.1 2.4.2 2.4.3],
  '2.3' => %w[2.3.3 2.3.4 2.3.5 2.3.6]
}.freeze

FLAVORS = [
  'mysql-5.7',
  'postgres-9.6',
  'mysql-5.7-postgres-9.6'
].freeze

def push(tag)
  sh "docker push dsexton/rails-ci:#{tag}"
end

def tag(what, with)
  sh "docker tag dsexton/rails-ci:#{what} dsexton/rails-ci:#{with}"
end

namespace :build do
  desc 'Builds onbuild iamge'
  task :onbuild do
    sh "docker build -t dsexton/rails-ci:onbuild \
        --file onbuild/Dockerfile \
        --pull ."
    push('onbuild')
  end

  desc 'Builds all images'
  task all: :onbuild do
    RUBIES.each do |major, versions|
      versions.each_with_index do |version, version_index|
        FLAVORS.each_with_index do |flavor, flavor_index|
          begin
            sh "docker pull dsexton/rails-ci:ruby-#{version}-#{flavor}"
          rescue Exception
            puts "dsexton/rails-ci:ruby-#{version}-#{flavor} does not exist yet"
          end

          sh "docker build -t dsexton/rails-ci:ruby-#{version}-#{flavor} \
              --file #{flavor}/Dockerfile \
              --build-arg RUBY_INSTALL_MAJOR=#{major} \
              --build-arg RUBY_INSTALL_VERSION=#{version} ."
          push("ruby-#{version}-#{flavor}")

          next unless version_index == (versions.size - 1)
          tag("ruby-#{version}-#{flavor}", "ruby-#{major}-#{flavor}")
          push("ruby-#{major}-#{flavor}")

          next unless flavor_index == (FLAVORS.size - 1)
          tag("ruby-#{major}-#{flavor}", "ruby-#{major}")
          push("ruby-#{major}")
        end
      end
    end
  end
end

desc 'Builds all images'
task :build do
  Rake::Task['build:all'].invoke
end
