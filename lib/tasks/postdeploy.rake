namespace :heroku do
  desc 'review app postdeploy script'
  task :review_app_setup do
    require 'dnsimple'
    require 'platform-api'

    cpp_domain = 'contrepiedproductions.fr'.freeze

    # Environment variables are provided when specified in app.json
    # Heroku app names are default "<name>-pr-<pull request ID>"
    heroku_app_name = ENV['HEROKU_APP_NAME']
    dnsimple_account_id = ENV['DNSIMPLE_ACCOUNT_ID']

    # Extract out "pr-<pull request ID>" from default name
    pr_number = heroku_app_name.match(/.*(pr-\d+)/).captures.first
    subdomain = "account-#{pr_number}"
    type = { type: 'CNAME' }

    dnsimple_client = Dnsimple::Client.new access_token: ENV['DNSIMPLE_ACCESS_TOKEN']
    heroku_client = PlatformAPI.connect_oauth ENV['HEROKU_PLATFORM_TOKEN']

    # Configure Custom Domain in Heroku
    hostname = [subdomain, cpp_domain].join('.')
    heroku_client.domain.create(heroku_app_name, hostname: hostname)
    heroku_domain = heroku_client.domain.info(heroku_app_name, hostname)["cname"]

    # Create CNAME record in DNSimple
    opts = type.merge({ name: subdomain, content: heroku_domain })
    # Query DNSimple to see if we already have a record.
    resp = dnsimple_client.zones.zone_records dnsimple_account_id, cpp_domain, { filter: { name_like: subdomain } }

    # If no record found, create a new one
    if resp.total_entries == 0
      dnsimple_client.zones.create_zone_record dnsimple_account_id, cpp_domain, opts
    # On changes or redeploy of the review app, update the record to the new heroku domain
    elsif resp.total_entries == 1
      record_id = resp.data[0].id
      client.zones.update_zone_record dnsimple_account_id, cpp_domain, record_id, opts
    end
  end
end
