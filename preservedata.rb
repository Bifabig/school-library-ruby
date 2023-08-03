require 'json'
require_relative 'app'

module PreserveData
  def preserve_data
    opts = {
      array_nl: "\n",
      object_nl: "\n",
      indent: '  ',
      space_before: ' ',
      space: ' '
    }

    File.write('people.json', JSON.generate(@people, opts)) unless @people.empty?
    File.write('books.json', JSON.generate(@books, opts)) unless @books.empty?
    File.write('rentals.json', JSON.generate(@rentals, opts)) unless @rentals.empty?
  end
end
