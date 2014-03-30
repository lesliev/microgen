require 'active_support/inflector'

class MigrationGenerator
  include ActiveSupport::Inflector

  def base_migration_name
    raise "abstract: implement this"
  end

  def timestamp
    Time.now.strftime('%Y%m%d%H%M%S')
  end

  def full_migration_name
    "#{timestamp}_#{base_migration_name}"
  end

  def migration_path
    File.join('db/migrate', full_migration_name)
  end

  def existing
    glob = File.join('db/migrate', "*_#{base_migration_name}")
    Dir.glob(glob)
  end

  def exit_if_existing
    if existing.any?
      raise "Similarly named migration already exists: #{existing.first}"
    end
  end
end
