class FileUploadsController < ApplicationController

  #index action for getting all the records
  def index
    content = FileUploader.all
    render json: content, status: 200
  end

  #action for saving the data from file 
  def file_content
    begin
      uploaded_file = Roo::Spreadsheet.open(params[:file].path, extension: :xlsx)
      file_header = uploaded_file.row(1)
      (2..uploaded_file.last_row).each do |i|
        row = Hash[[file_header, uploaded_file.row(i)].transpose]
        fine_info = FileUploader.find_by(firstname: row["firstname"]) || FileUploader.new
        fine_info.attributes = row.to_hash
        fine_info.save!
      end
      render json: uploaded_file, status: 200
    rescue => e
      render json: e.message, status: 400
    end  
  end

end
