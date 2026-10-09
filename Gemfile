source 'https://rubygems.org'

# NOTE: For reproducible builds, consider pinning critical build gems to specific
# versions (for example jekyll, jekyll-paginate-v2). Pinning
# prevents unexpected breakage caused by upstream releases. Optional groups
# (like :other_plugins) are not automatically installed by Jekyll — document
# how to install them and any system dependencies (ImageMagick, npm tools, etc.).

gem 'jekyll'

# Core plugins that directly affect site building
group :jekyll_plugins do
    gem 'jekyll-email-protect'
    gem 'jekyll-feed'
    gem 'jekyll-get-json'
    gem 'jekyll-imagemagick'
    gem 'jekyll-link-attributes'
    gem 'jekyll-minifier'
    gem 'jekyll-paginate-v2'
    gem 'jekyll-regex-replace'
    gem 'jekyll-scholar'
    gem 'jekyll-sitemap'
    gem 'jekyll-toc'

    gem 'classifier-reborn'  # used for content categorization during the build
end

# Gems for development or external data fetching (outside :jekyll_plugins)
group :other_plugins do
    gem 'css_parser'
    gem 'feedjira'
    gem 'httparty'
    gem 'observer'       # used by jekyll-scholar
    # gem 'unicode_utils' -- should be already installed by jekyll
    # gem 'webrick' -- should be already installed by jekyll
end
