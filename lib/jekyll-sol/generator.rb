# frozen_string_literal: true

require 'jekyll'
require 'pluto/models'

module JekyllSol
  class Generator < Jekyll::Generator
    def generate(site)
      connect

      feed = Hash[Pluto::Models::Feed.latest.map { |f| [f.id.to_s, f.title] }]

      site.data['feeds'] = Pluto::Models::Item.latest.map { |item| extract_data(item, feed) }
    end

    def connect
      unless File.exist? db_file
        throw "Database file '#{db_file}' is missing! Did you run 'pluto' first?"
      end

      Pluto.connect(db_config)
    end

    def db_config
      @db_config ||= {
        adapter: 'sqlite3',
        database: db_file
      }
    end

    def db_file
      './planet.db'
    end

    def extract_data(item, feed)
      {
        'title'   => item.name,
        'url'     => prettify_url(item.url),
        'content' => item.summary,
        'author'  => feed[item.feed_id.to_s],
        'date'    => item.published
      }
    end

    def prettify_url(url)
      if url.start_with? 'http'
        url
      else
        "https://#{url}"
      end
    end
  end
end
