#' Search for a taxon information
#'
#' @param sciname     {`character(1+)`}\cr{}
#'                    One or more scientific name of searched taxa
#' @param fr_name     {`character(1+)`}\cr{}
#'                    One or more common name(s) in French of searched taxa
#' @param en_name     {`character(1+)`}\cr{}
#'                    One or more common name(s) in English of searched taxa
#' @param rank        {`character(1+)`}\cr{}
#' One of more rank of the searched taxa (see [`rt_taxo_ranks()`] for the list
#' of all ranks available):
#' * `Dumm`= Domain
#' * `KD`= Kingdom
#' * `PH`= Phylum
#' * `CL`= Class
#' * `OR`= Order
#' * `FM`= Family
#' * `SBFM`= Subfamily
#' * `TR`= Tribe
#' * `GN`= Genus
#' * `AGES`= Aggregate
#' * `ES`= Species
#' * `SSES`= Subspecies
#' * `NAT`= Natio
#' * `VAR`= Variety
#' * `SVAR`= Sub-variety
#' * `FO`= Form
#' * `SSFO`= Sub-form
#' * `RACE`= Race
#' * `CAR`= Cultivar
#' * `AB`= Abberatio
#' @param territories {`character(1+)`}\cr{}
#' One or more territories where species is present:
#' * `"fr"` = Mainland France
#' * `"gf"` = French Guiana
#' * `"gua"` = Guadeloupe
#' * `"mar"` = Martinique
#' * `"sm"` = Saint Martin
#' * `"sb"` = Saint Barthélemy
#' * `"spm"` = Saint Pierre and Miquelon
#' * `"epa"` = Scattered Islands in the Indian Ocean
#' * `"may"` = Mayotte
#' * `"reu"` = Réunion
#' * `"sa"` = French Southern and Antarctic Lands
#' * `"ta"` = Adélie Land
#' * `"nc"` = New Caledonia
#' * `"wf"` = Wallis and Futuna
#' * `"pf"` = French Polynesia
#' * `"cli"` = Clipperton Island
#' @param domain      {`character(1)`}\cr{}
#' The domain where the species is found:
#' * `"marin"` = Marine
#' * `"continental"` = Continental
#' @param habitats    {`integer(1+)`}\cr{}
#' One or more habitats where the species is found (see [`rt_habitats()`] for a
#' list of all habitats):
#' * `1` = Marine
#' * `2` = Freshwater
#' * `3` = Terrestrial
#' * `4` = Marine and freshwater
#' * `5` = Marine and Terrestrial
#' * `6` = Brackish water
#' * `7` = Continental (terrestrial and/or freshwater)
#' * `8` = Continental (terrestrial and freshwater)
#' @param vernacular  {`character(1+)`}\cr{}
#'                    Name of a vernacular group (see the list using
#'                    [`rt_vernacular_groups()`])
#' @param version {`NULL or character(1)`}\cr{}
#'                A string indicating which version of TAXREF should be queried.
#'                Should be of the form `"2.0"` up to `"15.0"`. You can check
#'                the available TAXREF versions with `rt_taxref_versions()`.
#' @param page {`integer(1)`; default = `1`}\cr{}
#'             The page number returned
#' @param size {`integer(1)`; default = `5000`}\cr{}
#'             The number of lines returned per page (maximum = 5000)
#'
#' @examples
#' rt_taxa_search(sciname = "Bradypus")
#'
#' @export
rt_taxa_search = function(sciname = NULL, fr_name = NULL, en_name = NULL,
                          rank = NULL, territories = NULL, domain = NULL,
                          habitats = NULL, vernacular = NULL, version = NULL,
                          page = 1, size = 5000) {

  api_query = rt_GET(
    "taxa/search",
    query = list(
      scientificNames        = sciname,
      frenchVernacularNames  = fr_name,
      englishVernacularNames = en_name,
      taxonomicRanks         = rank,
      territories            = territories,
      domain                 = domain,
      habitats               = habitats,
      vernacularGroups       = vernacular,
      version                = version,
      page                   = page,
      size                   = size
    )
  )

  parse_taxa(api_query)
}
