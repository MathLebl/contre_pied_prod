//= link_tree ../images
//= link_directory ../stylesheets .css
//= link application.css
{
  "name": "sample-pr-review-app",
  "description": "Helps create PR Review Apps",
  "scripts": {
    "postdeploy": "bundle exec rake heroku:review_app_setup",
    "postdeploy": "bundle exec rake db:schema:load db:seed",
    "pr-predestroy": "bundle exec rake heroku:review_app_predestroy"
  },
  "env": {
    "DNSIMPLE_ACCESS_TOKEN": {
      "required": true
    },
    "DNSIMPLE_ACCOUNT_ID": {
      "value": "<YOUR ACCOUNT ID>"
    },
    "HEROKU_APP_NAME": {
      "required": true
    },
    "HEROKU_PARENT_APP_NAME": {
      "required": true
    },
    "HEROKU_PLATFORM_TOKEN": {
      "required": true
    }
  },
  "formation": {},
  "addons": [],
  "buildpacks": []
}
