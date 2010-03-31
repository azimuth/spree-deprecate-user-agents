class DeprecateUserAgentsHooks < Spree::ThemeSupport::HookListener

  #
  # In this file you can modify the content of the hooks available in the default templates
  # and avoid overriding a template in many situations. Multiple extensions can modify the
  # same hook, the changes being applied cumulatively based on extension load order
  #
  # Most hooks are defined with blocks so they span a region of the template, allowing content
  # to be replaced or removed as well as added to.
  #
  # Usage
  #
  # The following methods are available
  #
  # * insert_before
  # * insert_after
  # * replace
  # * remove
  #
  # All accept a block name symbol followed either by arguments that would be valid for 'render'
  # or a block which returns the string to be inserted. The block will have access to any methods
  # or instance variables accessible in your views
  #
  # Examples
  # 
  #   insert_before :homepage_products, :text => "<h1>Welcome!</h1>"
  #   insert_after :homepage_products, 'shared/offers' # renders a partial
  #   replace :taxon_sidebar_navigation, 'shared/my_sidebar
  #
  # adding a link below product details:
  #
  #   insert_after :product_description do
  #    '<p>' + link_to('Back to products', products_path) + '</p>'
  #   end
  #
  # adding a new tab to the admin navigation
  #
  #   insert_after :admin_tabs do
  #     tab(:taxonomies)
  #   end
  #
  
  insert_after :admin_general_settings_edit do
    <<EOT
    <p>
    <%= check_box_tag('preferences[dua_enabled]', Spree::Config[:dua_enabled], Spree::Config[:dua_enabled]) %> 
    <label> <%= t("dua_enabled") %></label>
    </p>
    <p>
  	<label><%= t("dua_message") %></label><br />
  	<%= text_area_tag('preferences[dua_message]', Spree::Config[:dua_message], :size => "72x10") %>
    </p>
EOT
  end
  
  insert_after :admin_general_settings_show do
    <<EOT
    <tr>
    <td colspan="2"><strong><%= t('deprecated_user_agents') %></strong></td>
    </tr>
    <tr>
    <td colspan="2">
      <%= (Spree::Config[:dua_enabled] ? t("deprecated_user_agents_will_be_warned") : t("deprecated_user_agents_will_not_be_warned")) %>
    </td>	
    </tr>
    <tr>
    <td colspan="2">
      <%= t("message_for_deprecated_user_agents")%><br />
  	  <div style="display: block; border: black 1px solid; height: 300px; width: 600px;">
        <%= Spree::Config[:dua_message] %>
      </div>
    </td>	
    </tr>
EOT
  end
end
