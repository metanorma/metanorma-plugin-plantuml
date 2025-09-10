# frozen_string_literal: true

module Ieee
  module Idams
    # Represents an IEEE IDAMS publication record
    class PubModel
      DATETYPES = { "OriginalPub" => "created", "ePub" => "published", "LastInspecUpd" => "updated" }.freeze

      attr_accessor :title, :normtitle, :standardsfamilytitle, :publicationinfo, :volume

      def btitle
        t = []
        content = CGI.unescapeHTML volume.article.title
        t << { content: Regexp.last_match(1), type: "title-main" } if content =~ /\A(.+)\s[-\u2014]\sredline\z/i
        t << { content: content, type: "main" }
      end

      def bdate # rubocop:disable Metrics/AbcSize,Metrics/CyclomaticComplexity,Metrics/MethodLength
        dates = volume.article.articleinfo.date.map do |d|
          date_array = [d.year]
          if d.month
            /^(?:(?<day>\d{1,2})\s)?(?<mon>\w+)/ =~ d.month
            month = Date::ABBR_MONTHNAMES.index(mon) || Date::MONTHNAMES.index(mon) || d.month
            date_array << month.to_s.rjust(2, "0")
          end
          day = d.day || day
          date_array << day.rjust(2, "0") if day
          on = date_array.compact.join "-"
          { type: DATETYPES[d.datetype], on: on }
        end
        if publicationinfo.pubapprovaldate
          issued = parse_date_string publicationinfo.pubapprovaldate
          dates << { type: "issued", on: issued }
        end
        dates
      end

      #
      # @return [Arry<Hash>] array of hashes with keys :id and :type
      #
      def isbn_doi
        ids = []
        isbn = publicationinfo.isbn
        ids << { id: isbn.first.content, type: "ISBN" } if isbn.any?
        doi = volume.article.articleinfo.articledoi
        ids << { id: doi, type: "DOI" } if doi
        ids
      end

      #
      # @return [Array<String, Array>] publisher name and address
      #
      def contrib_name_addr
        addr = contrib_addres(publicationinfo.publisher.address).map { |a| block_given? ? yield(a) : a }
        [publicationinfo.publisher.publishername, addr]
      end

      #
      # @return [Array<Array, Object>] array of arrays with owner and year of given block result
      #
      def copyright
        publicationinfo.copyrightgroup.copyright.map do |copy|
          owner = copy.holder.split("/")
          year = copy.year.to_s
          block_given? ? yield(owner, year) : [owner, year]
        end
      end

      def docstatus
        return unless %w[Draft Approved Superseded Withdrawn].include?(standard_modifier)

        args = { stage: standard_modifier.downcase }
        block_given? ? yield(args) : args
      end

      def link
        id = volume.article.articleinfo.amsid
        url = "https://ieeexplore.ieee.org/document/#{id}"
        [block_given? ? yield(url) : url]
      end

      def keyword
        volume.article.articleinfo.keywordset.inject([]) do |acc, keywordset|
          acc + keywordset.keyword.map(&:keywordterm)
        end.uniq
      end

      def ics
        return [] unless publicationinfo.ics_codes

        publicationinfo.ics_codes.code_term.map do |ics|
          attrs = { code: ics.codenum, text: ics.name }
          block_given? ? yield(attrs) : attrs
        end
      end

      def editorialgroup
        committee = publicationinfo.pubsponsoringcommitteeset&.pubsponsoringcommittee
        return unless committee

        block_given? ? yield(committee) : committee
      end

      def standard_modifier
        publicationinfo.standard_modifier_set&.standard_modifier
      end

      def doctype
        standard_modifier == "Redline" ? "redline" : "standard"
      end

      private

      def contrib_addres(address)
        return [] unless address&.city

        city, state = address.city.split(", ")
        country = address.country || "USA"
        return [] unless city && country

        [{ street: [], city: city, state: state, country: country }]
      end

      #
      # Convert date string with month name to numeric date
      #
      # @param [String] date_str source date
      #
      # @return [String] numeric date
      #
      def parse_date_string(date_str)
        case date_str
        when /^\d{4}$/ then date_str
        when /^\d{1,2}\s\w+\.?\s\d{4}/ then Date.parse(date_str).to_s
        end
      end
    end
  end
end
