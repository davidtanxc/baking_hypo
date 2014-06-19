module ApplicationHelper
  def title
    base_title = "Baking courses in Singapore | Learn something new"
    if @title.nil?
      base_title
    else
      "#{@title}"
    end
  end

  def metades
    base_description = "Find great baking classes here in Singapore."
    if @metades.nil?
      base_description
    else
      "#{@metades}"
    end
  end
end
