GRAPHQL_SCHEMA = "BuzzerSchema"
GRAPHQL_EXPORT_PATH = "./app/graphql/schema.graphql"

namespace :graphql do
  desc "Export #{GRAPHQL_SCHEMA} to app/graphql/schema.graphql"
  task export: :environment do
    exported = File.read(GRAPHQL_EXPORT_PATH)
    in_code = GraphQL::Schema::Printer.print_schema(GRAPHQL_SCHEMA.constantize)

    res = GraphQL::SchemaComparator.compare(exported, in_code)
    if res.breaking?
      puts "\n🔥  Breaking changes detected:\n\n"
      res.breaking_changes.each do |change|
        puts "    -> #{change.path} - #{change.message}"
      end
      puts "\n"
    end

    File.write(GRAPHQL_EXPORT_PATH, in_code)
  end

  task verify: :environment do
    exported = File.read(GRAPHQL_EXPORT_PATH)
    in_code = GraphQL::Schema::Printer.print_schema(GRAPHQL_SCHEMA.constantize)

    res = GraphQL::SchemaComparator.compare(exported, in_code)
    unless res.identical?
      puts "\n🙀  Exported schema is not identical to in-code schema"
      puts "➡️   Run rake graphql:export to update the exported schema\n\n"
      exit 1
    end
  end
end
