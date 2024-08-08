# app/helpers/pagy_helper.rb
module PagyHelper
    include Pagy::Frontend
  
    def pagy_nav_with_tailwind(pagy)
      html = +'<nav class="my-4">'
      html << '<ul class="flex space-x-1">'
  
      # Previous Page Link
      html << if pagy.prev
                %(<li><a href="#{pagy_url_for(pagy, pagy.prev)}" class="relative inline-flex items-center px-4 py-2 border border-gray-300 text-sm font-medium text-gray-700 bg-white hover:bg-gray-50 rounded-l-md">Previous</a></li>)
              else
                %(<li><span class="relative inline-flex items-center px-4 py-2 border border-gray-300 text-sm font-medium text-gray-400 bg-gray-100 rounded-l-md">Previous</span></li>)
              end
  
      # Page Links
      pagy.series.each do |item|
        case item
        when Integer
          html << %(<li><a href="#{pagy_url_for(pagy, item)}" class="relative inline-flex items-center px-4 py-2 border border-gray-300 text-sm font-medium text-gray-700 bg-white hover:bg-gray-50">#{item}</a></li>)
        when String
          html << %(<li><span class="relative inline-flex items-center px-4 py-2 border border-gray-300 text-sm font-medium text-blue-600 bg-blue-50">#{item}</span></li>)
        when :gap
          html << %(<li><span class="relative inline-flex items-center px-4 py-2 border border-gray-300 text-sm font-medium text-gray-500 bg-white">...</span></li>)
        end
      end
  
      # Next Page Link
      html << if pagy.next
                %(<li><a href="#{pagy_url_for(pagy, pagy.next)}" class="relative inline-flex items-center px-4 py-2 border border-gray-300 text-sm font-medium text-gray-700 bg-white hover:bg-gray-50 rounded-r-md">Next</a></li>)
              else
                %(<li><span class="relative inline-flex items-center px-4 py-2 border border-gray-300 text-sm font-medium text-gray-400 bg-gray-100 rounded-r-md">Next</span></li>)
              end
  
      html << '</ul>'
      html << '</nav>'
  
      html.html_safe
    end
  end
  