class CommissionDatatable < AjaxDatatablesRails::Base
  def_delegators :@view, :link_to, :h, :mailto, :edit_resource_path
  def sortable_columns
    # Declare strings in this format: ModelName.column_name
    @sortable_columns ||= %w(Commission.id Commission.name Commission.description)
  end

  def searchable_columns
    # Declare strings in this format: ModelName.column_name
    @searchable_columns ||= %w(Commission.id Commission.name Commission.description)
  end

  private

  def data
    records.map do |record|
      image = "<img src=#{Refile.attachment_url(record, :image, :fill, 30, 30, format: "jpg")} class='img-circle pull-right' alt='#{record.name} image' style='margin-left: 15px;'/>"
      show = "<a style= 'margin: 0 .5em;' class='btn btn-xs bg-teal' href='/commissions/#{record.id}'>Show</a>"
      edit = "<a style= 'margin: 0 .5em;' class='btn btn-xs btn-default' href='/commissions/#{record.id}/edit'>Edit</a>"
      destroy = "<a style= 'margin: 0 .5em;' data-confirm='Are you sure?' class='btn btn-xs bg-maroon' rel='ofollow' data-method='delete' href='/commissions/#{record.id}'>Destroy</a>"
      [
        # comma separated list of the values for each cell of a table row
        # example: record.attribute,
        show + edit + destroy + image + "<span class='pull-right'>#{record.id}</span>".html_safe,
        record.name,
        record.description
      ]
    end
  end

  def get_raw_records
    # insert query here
    Commission.all
  end

  def typecast
    'CHAR'
  end

  # ==== Insert 'presenter'-like methods below if necessary
end
