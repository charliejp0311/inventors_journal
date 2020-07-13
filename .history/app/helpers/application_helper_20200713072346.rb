module ApplicationHelper
    def error_formatting(obj)
        if obj.errors.any?
          <div id="error_explanation">
            <h2>
              pluralize(obj.errors.count, "error")
              prohibited this post from being saved:
            </h2>

            <ul>
            obj.errors.full_messages.each do |msg| 
              <li>msg</li>
            end
            </ul>
          </div>
        end
    end

end
