class VisitorMessageDatatable < AjaxDatatablesRails::Base

  def sortable_columns
    # Declare strings in this format: ModelName.column_name
    @sortable_columns ||= %w(VisitorMessage.name VisitorMessage.email VisitorMessage.message_text VisitorMessage.created_at)
  end

  def searchable_columns
    # Declare strings in this format: ModelName.column_name
    @searchable_columns ||= %w(VisitorMessage.name VisitorMessage.email VisitorMessage.message_text VisitorMessage.created_at)
  end

  private

  def data
    records.map do |record|
      [
        # comma separated list of the values for each cell of a table row
        # example: record.attribute,
        record.name,
        record.email,
        record.message_text,
        record.created_at
      ]
    end
  end

  def get_raw_records
    # insert query here
    VisitorMessage.all
  end

  def typecast
    'CHAR'
  end

  # ==== Insert 'presenter'-like methods below if necessary
end
