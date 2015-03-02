module ActiveRecord
  module Tasks
    class PostgreSQLDatabaseTasks
      def drop
        establish_master_connection
        connection.select_all "select pg_terminate_backend(pg_stat_activity.pid) from pg_stat_activity where datname='#{configuration['freuder_development']}' AND state='idle';"
        connection.drop_database configuration['freuder_development']
      end
    end
  end
end