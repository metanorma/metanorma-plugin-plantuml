Encoding.default_external = Encoding::UTF_8
Encoding.default_internal = Encoding::UTF_8

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}" }

gemspec

begin
  eval_gemfile("Gemfile.devel")
rescue StandardError
  nil
end

gem "byebug"
gem "canon"
gem "debug"
gem "metanorma"
gem "metanorma-standoc", github: "metanorma/metanorma-standoc",
                         branch: "main"
gem "octokit"
gem "rake"
gem "rspec"
gem "rspec-html-matchers"
gem "rubocop"
gem "rubocop-performance"
gem "simplecov"
gem "timecop"
gem "vcr"
gem "webmock"
