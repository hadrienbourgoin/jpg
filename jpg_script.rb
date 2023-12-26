require 'mini_magick'
require 'fileutils'

source_path = 'C:/Users/...'
destination_path = 'C:/Users/...'

Dir.foreach(source_path) do |file|
  next unless file.downcase.end_with?('.jpg')

  file_path = File.join(source_path, file)
  dest_file_path = File.join(destination_path, file)

  begin
    image = MiniMagick::Image.open(file_path)
    puts "#{file} is a valid JPG file.\n\n"
    FileUtils.copy(file_path, dest_file_path)
  rescue MiniMagick::Error, MiniMagick::Invalid => e
    puts "#{file} is corrupted or not a valid image: #{e.message}\n\n"
  end
end
