desc 'Create, migrate then seed the database'
task rdb: :environment do
  Rake::Task['db:create'].invoke
  Rake::Task['db:migrate'].invoke
end
