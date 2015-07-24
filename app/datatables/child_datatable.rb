class ChildDatatable < AjaxDatatablesRails::Base
  def_delegators :@view, :link_to, :h, :mailto, :edit_resource_path
  def sortable_columns
    # Declare strings in this format: ModelName.column_name
    @sortable_columns ||= %w(Child.name Child.lastname Child.gender Child.birthdate Child.allergies Child.notes)
  end

  def searchable_columns
    # Declare strings in this format: ModelName.column_name
    @searchable_columns ||= %w(Child.name Child.lastname Child.gender Child.birthdate Child.allergies Child.notes)
  end

  private

  def data
    records.map do |record|
      edit = "<a style= 'margin: 0 .5em;' class='btn btn-xs btn-default pull-right' href='/children/#{record.id}/edit'>Edit</a>"
      destroy = "<a style= 'margin: 0 .5em;' data-confirm='Are you sure?' class='btn btn-xs bg-maroon pull-right' rel='ofollow' data-method='delete' href='/children/#{record.id}'>Destroy</a>"
      [
        # comma separated list of the values for each cell of a table row
        # example: record.attribute,
        record.name,
        record.lastname,
        record.gender,
        record.birthdate,
        record.allergies,
        record.notes + destroy + edit
      ]
    end
  end

  def get_raw_records
    # insert query here
    Child.all
  end

  # ==== Insert 'presenter'-like methods below if necessary
end
