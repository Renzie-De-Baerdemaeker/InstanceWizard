# app/services/branding_config_generator.rb
require "toml-rb"

class ConfigGenerator
  def self.generate(branding)
    {
      branding: {
        name: branding.name,
        assets_bucket: branding.name+"-assets",
        favicon_path: branding.favicon&.filename&.to_s,
        logo_path: branding.logo&.filename&.to_s,
        background_path: branding.background&.filename&.to_s,
        colors: {
          primary: branding.primary_color,
          secondary_lightmode: branding.secondary_color_light,
          secondary_darkmode: branding.secondary_color_dark,
          accent: branding.accent_color
        }
      },
      orgs: [
        {
          name: branding.name,
          users: branding.admins.map do |admin|
            {
              add_to_org: true,
              is_super_admin: true,
              is_org_admin: true,
              is_verified: true,
              user: {
                email: admin.email,
                first_name: admin.first_name,
                last_name: admin.last_name
              }
            }
          end
        }
      ]
    }.then { |data| TomlRB.dump(data) }
  end
end
