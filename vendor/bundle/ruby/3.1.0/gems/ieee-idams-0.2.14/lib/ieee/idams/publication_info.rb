# frozen_string_literal: true

require_relative "publication_acronym"
require_relative "isbn"
require_relative "copyright_group"
require_relative "publisher"
require_relative "address"
require_relative "pub_sponsoring_committee_set"
require_relative "pub_topical_browse_set"
require_relative "pub_sponsor"
require_relative "standard_modifier_set"
require_relative "standard_relationship"
require_relative "standard_bundle"
require_relative "package_member_set"
require_relative "standard_package_set"
require_relative "ics_codes"
require_relative "product_number"
require_relative "conf_group"

module Ieee
  module Idams
    # Contains detailed metadata about an IEEE publication
    class PublicationInfo < Lutaml::Model::Serializable
      # System ID
      # @return [String] IDAMS internal ID
      attribute :idamsid, :string

      # Inventory part number
      # @return [String] inventory part number
      attribute :invpartnumber, :string

      # Standard number
      # @return [String] standard identifier
      attribute :stdnumber, :string

      # Publication type
      # @return [String] type of publication
      attribute :publicationtype, :string

      # Publication subtype
      # @return [String] subtype of publication
      attribute :publicationsubtype, :string

      # Standard subtype
      # @return [String] subtype of standard
      attribute :standard_subtype, :string

      # IEEE abbreviation
      # @return [String] IEEE abbreviation
      attribute :ieeeabbrev, :string

      # IEEE publication acronym
      # @return [String] IEEE publication acronym
      attribute :acronym, PublicationAcronym

      # Publication status
      # @return [String] Active or Inactive
      attribute :pubstatus, :string, values: %w[Active Inactive]

      # Open access status
      # @return [String] open access indicator
      attribute :publicationopenaccess, :string

      # Standard ID
      # @return [String] standard identifier
      attribute :standard_id, :string

      # Associated PU number
      # @return [String] associated PU number
      attribute :associated_punumber, :string

      # Standard status
      # @return [String] standard status
      attribute :standard_status, :string

      # Standard relationship
      # @return [String] standard relationship
      attribute :standard_relationship, StandardRelationship, collection: true, initialize_empty: true

      # Standard modifier set
      # @return [StandardModifierSet] standard modifier details
      attribute :standard_modifier_set, StandardModifierSet

      # Standard bundle
      # @return [StandardBundle] standard bundle details
      attribute :standard_bundle, StandardBundle

      # Package member set
      # @return [PackageMemberSet] package member details
      attribute :package_member_set, PackageMemberSet

      # ISBN information
      # @return [Isbn] ISBN details
      attribute :isbn, Isbn, collection: true, initialize_empty: true

      # ISBN information
      # @return [PubSponsor] sponsor details
      attribute :pubsponsor, PubSponsor

      # Standard family
      # @return [String] family of standards
      attribute :standard_family, :string

      # Standard package set
      # @return [String] package of standards
      attribute :standard_package_set, StandardPackageSet

      # ICS codes
      # @return [IcsCodes] ICS codes
      attribute :ics_codes, IcsCodes

      # Sponsoring committees
      # @return [PubSponsoringCommitteeSet] committee information
      attribute :pubsponsoringcommitteeset, PubSponsoringCommitteeSet

      # Topical browse categories
      # @return [PubTopicalBrowseSet] subject classifications
      attribute :pubtopicalbrowseset, PubTopicalBrowseSet

      # Copyright information
      # @return [CopyrightGroup] copyright details
      attribute :copyrightgroup, CopyrightGroup

      # Publisher information
      # @return [Publisher] publisher details
      attribute :publisher, Publisher

      # Product number
      # @return [ProductNumber] product number
      attribute :productnumber, ProductNumber

      # Publication approval date
      # @return [String] approval date
      attribute :pubapprovaldate, :string

      # Hold status
      # @return [String] Publish or Hold
      attribute :holdstatus, :string

      # <confgroup>
      #   <doi_permission>F</doi_permission>
      # </confgroup>
      attribute :confgroup, ConfGroup

      # <amsid>4322</amsid>
      attribute :amsid, :string

      xml do
        root "publicationinfo"
        map_element "idamsid", to: :idamsid
        map_element "invpartnumber", to: :invpartnumber
        map_element "stdnumber", to: :stdnumber
        map_element "publicationtype", to: :publicationtype
        map_element "publicationsubtype", to: :publicationsubtype
        map_element "standard_subtype", to: :standard_subtype
        map_element "ieeeabbrev", to: :ieeeabbrev
        map_element "acronym", to: :acronym
        map_element "pubstatus", to: :pubstatus
        map_element "publicationopenaccess", to: :publicationopenaccess
        map_element "standard_id", to: :standard_id
        map_element "associated_punumber", to: :associated_punumber
        map_element "standard_status", to: :standard_status
        map_element "standardmodifierset", to: :standard_modifier_set
        map_element "standard_bundle", to: :standard_bundle
        map_element "standard_relationship", to: :standard_relationship
        map_element "packagememberset", to: :package_member_set
        map_element "isbn", to: :isbn
        map_element "pubsponsor", to: :pubsponsor
        map_element "standard_family", to: :standard_family
        map_element "standardpackageset", to: :standard_package_set
        map_element "icscodes", to: :ics_codes
        map_element "pubsponsoringcommitteeset", to: :pubsponsoringcommitteeset
        map_element "pubtopicalbrowseset", to: :pubtopicalbrowseset
        map_element "copyrightgroup", to: :copyrightgroup
        map_element "publisher", to: :publisher
        map_element "productnumber", to: :productnumber
        map_element "PubApprovalDate", to: :pubapprovaldate
        map_element "holdstatus", to: :holdstatus
        map_element "confgroup", to: :confgroup
        map_element "amsid", to: :amsid
      end
    end
  end
end
