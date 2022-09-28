module LteHelper
  def lte_button_to(options)
    options[:text] ||= ""
    options[:path] ||= "#"
    options[:class] ||= "btn-default"
    icon = "<i class='fas #{options[:icon]}'></i> ".html_safe if options[:icon].present?

    if options[:method].present?
      link_to(icon.to_s + options[:text], options[:path], method: options[:method], class: "btn #{options[:class]}").html_safe
    else
      link_to(icon.to_s + options[:text], options[:path], class: "btn #{options[:class]}").html_safe
    end
  end

  def draw_main_title(options = {})
    options[:title] ||= ""
    options[:size] ||= 1

    out = ""
    out << %(
            <section class="content-header"> \
            <div class="container-fluid"> \
                <div class="row mb-2"> \
                    <div class="col-sm-6"> \
                        <h#{options[:size]}>#{options[:title]}</h#{options[:size]}> \
                    </div> \
                    <div class="col-sm-6"></div> \
                </div> \
            </div> \
            </section> \
    )

    out.html_safe
  end
end
