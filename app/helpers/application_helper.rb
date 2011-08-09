module ApplicationHelper
  def link_to_add_fields(dispute, f)
    new_object = dispute.itens.build
    fields = f.fields_for(:itens, new_object, :child_index => "Adicionar Item") do |builder|
      render('itens', :builder => builder)
    end
    link_to_function("Adicionar Item", "add_fields(this, \"#{escape_javascript(fields)}\")")
  end
end
