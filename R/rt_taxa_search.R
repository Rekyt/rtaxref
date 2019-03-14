#' Search fo a taxon information
#'
#' @param sciname     {`character(1)`}\cr{}
#'                    Scientific name
#' @param fr_name     {`character(1)`}\cr{}
#'                    Common name in French
#' @param en_name     {`character(1)`}\cr{}
#'                    Common name in English
#' @param rank        {`character(1)`}\cr{}
#'                    Rank of the taxon:
#'                    * `Dumm`= Domain
#'                    * `KD`= Kingdom
#'                    * `PH`= Phylum
#'                    * `CL`= Class
#'                    * `OR`= Order
#'                    * `FM`= Family
#'                    * `SBFM`= Subfamily
#'                    * `TR`= Tribe
#'                    * `GN`= Genus
#'                    * `AGES`= Aggregate
#'                    * `ES`= Species
#'                    * `SSES`= Subspecies
#'                    * `NAT`= Natio
#'                    * `VAR`= Variety
#'                    * `SVAR`= Sub-variety
#'                    * `FO`= Form
#'                    * `SSFO`= Sub-form
#'                    * `RACE`= Race
#'                    * `CAR`= Cultivar
#'                    * `AB`= Abberatio
#' @param territories {`character(1+)`}\cr{}
#'                    Territories where species is present:
#'                    * `"fr"` = Mainland France
#'                    * `"gf"` = French Guiana
#'                    * `"gua"` = Guadeloupe
#'                    * `"mar"` = Martinique
#'                    * `"sm"` = Saint Martin
#'                    * `"sb"` = Saint Barthélemy
#'                    * `"spm"` = Saint Pierre and Miquelon
#'                    * `"epa"` = Scattered Islands in the Indian Ocean
#'                    * `"may"` = Mayotte
#'                    * `"reu"` = Réunion
#'                    * `"sa"` = French Southern and Antarctic Lands
#'                    * `"ta"` = Adélie Land
#'                    * `"nc"` = New Caledonia
#'                    * `"wf"` = Wallis and Futuna
#'                    * `"pf"` = French Polynesia
#'                    * `"cli"` = Clipperton Island
#' @param domain      {`integer(1)`}\cr{}
#'                    * `"marin"` = Marine
#'                    * `"continental"` = Continental
#' @param habitats    {`integer(1)`}\cr{}
#'                    * `1` = Marine
#'                    * `2` = Freshwater
#'                    * `3` = Terrestrial
#'                    * `4` = Marine and freshwater
#'                    * `5` = Marine and Terrestrial
#'                    * `6` = Brackish water
#'                    * `7` = Continental (terrestrial and/or freshwater)
#'                    * `8` = Continental (terrestrial and freshwater)
#' @param vernacular  {`character(1)`}\cr{}
#'
#' @export
#' @importFrom httr GET
rt_taxa_search = function(sciname = NULL, fr_name = NULL, en_name = NULL,
                          rank = NULL, territories = NULL, domain = NULL,
                          habitats = NULL, vernacular = NULL) {

  api_query = GET(rt_base_url(), path = "api/taxa/search",
                  query = list(scientificNames = sciname,
                               frenchVernacularNames = fr_name,
                               englishVernacularNames = en_name,
                               taxonomicRanks = rank,
                               territories = territories,
                               domain = domain,
                               habitats = habitats,
                               vernacularGroups = vernacular))

  parse_taxa(api_query)
}
