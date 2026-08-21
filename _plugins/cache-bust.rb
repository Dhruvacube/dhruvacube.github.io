# based on https://distresssignal.org/busting-css-cache-with-jekyll-md5-hash
# Improved: deterministic hashing, robust path resolution, binary-safe reads, and correct query separator handling.
module Jekyll
  module CacheBust
    class CacheDigester
      require 'digest/md5'
      require 'pathname'

      attr_accessor :file_name, :directory

      # file_name: the original asset path as used in templates (may include query/fragments)
      # directory: when provided, digest combines files under this directory (e.g. '_sass')
      def initialize(file_name:, directory: nil)
        self.file_name = file_name
        self.directory = directory
      end

      # Return a URL with a cache-busting hash appended using the correct separator
      def digest!
        hash = Digest::MD5.hexdigest(file_contents)
        return file_name.to_s if hash.nil? || hash.empty?

        # preserve original base (without fragment)
        base = file_name.to_s.split('#').first
        separator = base.include?('?') ? '&' : '?'
        [base, separator, hash].join
      end

      private

      # Read all relevant files in the given directory, deterministically ordered and binary-safe
      def directory_files_content
        return '' unless directory

        site_source = site_source_path
        dir_path = File.expand_path(directory, site_source)

        unless Dir.exist?(dir_path)
          log_warn("CacheBust: directory '#{dir_path}' does not exist; returning empty content for hash")
          return ''
        end

        # Restrict to typical Sass/CSS extensions and sort for deterministic order
        allowed = %w(.scss .sass .css)
        files = Dir.glob(File.join(dir_path, '**', '*')).select { |p| File.file?(p) && allowed.include?(File.extname(p).downcase) }.sort

        contents = files.map do |p|
          begin
            File.binread(p)
          rescue => e
            log_warn("CacheBust: failed to read '#{p}': #{e.class}: #{e.message}")
            ''
          end
        end

        contents.join
      end

      # Normalize the requested file name to a repository-relative path (no leading slash)
      def normalized_file_name
        path = file_name.to_s.split('?').first.split('#').first
        # remove leading scheme+host if present
        path = path.sub(%r{\Ahttps?://[^/]+}, '')
        path = path.sub(%r{\A/}, '')
        path
      end

      # Resolve the file path relative to the Jekyll site source (or cwd) and read it in binary mode
      def file_content
        nf = normalized_file_name
        site_source = site_source_path
        candidate = File.expand_path(nf, site_source)

        if File.exist?(candidate) && File.file?(candidate)
          begin
            return File.binread(candidate)
          rescue => e
            log_warn("CacheBust: error reading file '#{candidate}': #{e.class}: #{e.message}")
            return ''
          end
        end

        # fallback: try raw normalized path relative to cwd
        if File.exist?(nf) && File.file?(nf)
          begin
            return File.binread(nf)
          rescue => e
            log_warn("CacheBust: error reading file '#{nf}': #{e.class}: #{e.message}")
            return ''
          end
        end

        log_warn("CacheBust: file '#{nf}' not found (tried '#{candidate}' and '#{nf}'); returning empty content for hash")
        ''
      end

      # Decide whether to digest a single file (no directory provided) or the directory
      def single_file_mode?
        directory.nil?
      end

      def file_contents
        single_file_mode? ? file_content : directory_files_content
      end

      def site_source_path
        if defined?(Jekyll) && Jekyll.respond_to?(:configuration)
          begin
            cfg = Jekyll.configuration({})
            return cfg['source'] if cfg && cfg['source']
          rescue
            # fallthrough to cwd
          end
        end
        Dir.pwd
      end

      def log_warn(msg)
        if defined?(Jekyll) && Jekyll.respond_to?(:logger)
          Jekyll.logger.warn(msg)
        else
          warn msg
        end
      end
    end

    def bust_file_cache(file_name)
      CacheDigester.new(file_name: file_name, directory: nil).digest!
    end

    def bust_css_cache(file_name)
      # digest all scss/sass files under the project's _sass directory (resolved against site source)
      CacheDigester.new(file_name: file_name, directory: '_sass').digest!
    end
  end
end

Liquid::Template.register_filter(Jekyll::CacheBust)
