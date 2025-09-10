# frozen_string_literal: true

require_relative "keyword_set"
require_relative "multimedia"
require_relative "author_group"
require_relative "article_copyright"
require_relative "article_date"
require_relative "article_filename"
require_relative "article_page_nums"
require_relative "article_abstract"

module Ieee
  module Idams
    # Contains detailed metadata about an article
    class ArticleInfo < Lutaml::Model::Serializable
      # Sequence number
      # @return [Integer] article sequence number
      attribute :articleseqnum, :integer

      # Digital Object Identifier
      # @return [String] DOI for the article
      attribute :articledoi, :string

      # System ID
      # @return [String] IDAMS internal ID
      attribute :idamsid, :string

      # Article status
      # @return [String] Active or Inactive
      attribute :articlestatus, :string, values: %w[Active Inactive]

      # Content type
      # @return [String] type of content
      attribute :content_type, :string

      # Open access status
      # @return [String] open access indicator
      attribute :articleopenaccess, :string, values: %w[T F]

      # Display flag
      # @return [String] show/hide indicator
      attribute :articleshowflag, :string, values: %w[T F]

      # Article plagiarism flag
      # @return [String] plagiarism indicator
      attribute :articleplagiarizedflag, :string, values: %w[T F]

      # Article no DOI flag
      # @return [String] no DOI indicator
      attribute :articlenodoiflag, :string, values: %w[T F]

      # Article cover image flag
      # @return [String] cover image indicator
      attribute :articlecoverimageflag, :string, values: %w[T F]

      # Article reference flag
      # @return [String] reference indicator
      attribute :articlereferenceflag, :string, values: %w[T F]

      # Article peer review flag
      # @return [String] peer review indicator
      attribute :articlepeerreviewflag, :string, values: %w[T F]

      # Hold status
      # @return [String] Publish or Hold
      attribute :holdstatus, :string, values: %w[Publish Hold]

      # Article copyright
      # @return [String] copyright statement
      attribute :articlecopyright, ArticleCopyright

      # Abstract
      # @return [String] article abstract
      attribute :abstract, ArticleAbstract, collection: true, initialize_empty: true

      # Author information
      # @return [AuthorGroup] article authors
      attribute :authorgroup, AuthorGroup

      # Standard scope
      # @return [String] standard scope
      attribute :articlestdscope, :string

      # Standard purpose
      # @return [String] standard purpose
      attribute :articlestdpurpose, :string

      # Dates
      # @return [String] publication dates
      attribute :date, ArticleDate, collection: true, initialize_empty: true

      # Article publication date
      # @return [String] publication date
      attribute :article_publication_date, :string

      # Number of pages
      # @return [Integer] page count
      attribute :numpages, :integer

      # File size in bytes
      # @return [Integer] PDF file size
      attribute :size, :integer

      # PDF filename
      # @return [String] name of PDF file
      attribute :filename, ArticleFilename

      # Page numbers
      # @return [String] start and end page numbers
      attribute :artpagenums, ArticlePageNums

      # System ID
      # @return [String] AMS internal ID
      attribute :amsid, :string

      # Multimedia
      # @return [Multimedia] multimedia content
      attribute :multimedia, Multimedia

      # Keywords
      # @return [Array<KeywordSet>] article keywords
      attribute :keywordset, KeywordSet, collection: true, initialize_empty: true

      xml do
        root "articleinfo"
        map_element "articleseqnum", to: :articleseqnum
        map_element "articledoi", to: :articledoi
        map_element "idamsid", to: :idamsid
        map_element "articlestatus", to: :articlestatus
        map_element "contenttype", to: :content_type
        map_element "articleopenaccess", to: :articleopenaccess
        map_element "articleshowflag", to: :articleshowflag

        map_element "articleopenaccess", to: :articleopenaccess
        map_element "articleshowflag", to: :articleshowflag
        map_element "articleplagiarizedflag", to: :articleplagiarizedflag
        map_element "articlenodoiflag", to: :articlenodoiflag
        map_element "articlecoverimageflag", to: :articlecoverimageflag
        map_element "articlereferenceflag", to: :articlereferenceflag
        map_element "articlepeerreviewflag", to: :articlepeerreviewflag

        map_element "holdstatus", to: :holdstatus
        map_element "articlecopyright", to: :articlecopyright
        map_element "abstract", to: :abstract
        map_element "articlestdscope", to: :articlestdscope, cdata: true
        map_element "articlestdpurpose", to: :articlestdpurpose, cdata: true
        map_element "authorgroup", to: :authorgroup
        map_element "date", to: :date
        map_element "article_publication_date", to: :article_publication_date
        map_element "numpages", to: :numpages
        map_element "size", to: :size
        map_element "filename", to: :filename
        map_element "artpagenums", to: :artpagenums
        map_element "amsid", to: :amsid
        map_element "multimedia", to: :multimedia
        map_element "keywordset", to: :keywordset
      end
    end
  end
end
