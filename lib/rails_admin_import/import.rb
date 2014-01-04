require 'open-uri'
require "rails_admin_import/import_logger"

module RailsAdminImport
  module Import
    extend ActiveSupport::Concern

    module ClassMethods
      def run_import(params)
        begin
          if !params.has_key?(:file)
            return results = { :success => [], :error => ["You must select a file."] }
          end

          # TODO: re-enable this cleaning of the csv file, I like that.
          # if RailsAdminImport.config.logging
          #   FileUtils.copy(params[:file].tempfile, "#{Rails.root}/log/import/#{Time.now.strftime("%Y-%m-%d-%H-%M-%S")}-import.csv")
          # end

          # text       = File.read(params[:file].tempfile)
          # clean      = text.force_encoding('BINARY').encode('UTF-8', :undef => :replace, :replace => '').gsub(/\n$/, '')
          # file_check = CSV.new(clean)
          # logger     = ImportLogger.new

          # if file_check.readlines.size > RailsAdminImport.config.line_item_limit
          #   return results = { :success => [], :error => ["Please limit upload file to #{RailsAdminImport.config.line_item_limit} line items."] }
          # end

          results = { :success => [], :error => [] }

          begin
            self.import(params[:file].tempfile)
            results[:success] << "Successfuly imported all locations! :)"
          rescue => e
            msg = "There appears to be a problem with the import. Details: #{e}"
            puts "Error: #{msg}"
            results[:error] << msg
          end

          results
        rescue Exception => e
          #logger.info "#{Time.now.to_s}: Unknown exception in import: #{e.inspect}"
          return results = { :success => [], :error => ["Could not upload. Unexpected error: #{e.to_s}"] }
        end
      end
    end
  end
end

class ActiveRecord::Base
  include RailsAdminImport::Import
end
