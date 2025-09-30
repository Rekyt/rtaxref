
<!-- README.md is generated from README.Rmd. Please edit that file -->

# rtaxref – an R client to the French Taxonomical Reference

<!-- badges: start -->
[![Project Status: Active – The project has reached a stable, usable
state and is being actively
developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![codecov](https://codecov.io/gh/Rekyt/rtaxref/branch/master/graph/badge.svg)](https://codecov.io/gh/Rekyt/rtaxref)
[![R-CMD-check](https://github.com/Rekyt/rtaxref/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/Rekyt/rtaxref/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

🛑 **Important September 2025 Update: the Natural History Museum of
Paris has been hacked, and as such many of their data sources went
offline. They are working on restoring their databases, but for now
`rtaxref` won’t work.** 🛑  
You can still access the TaxREF data in two ways: - through the
[temporary data download
portal](https://www.patrinat.fr/fr/page-temporaire-de-telechargement-des-referentiels-de-donnees-lies-linpn-7353)
where you can download the offline version of TaxREF, to our knowledge,
no R package exist help navigate these data. - You can also access the
[`taxize::gna_verifier()`
function](https://docs.ropensci.org/taxize/reference/gna_verifier.html)
which allows to query the [Global Names Verifier
database](https://verifier.globalnames.org/) which indexes many
taxonomic sources. By specifying the argument `data_sources = 210`, you
can access the TaxREF version [indexed by Global Names
Verifier](https://verifier.globalnames.org/data_sources/210). This way
you can access the taxonomic names referenced in TaxREF.

**End of Update**

The goal of rtaxref is to provide an R client to TAXREF API, the French
Taxonomical Reference and associated database on species. The API
provides nomenclature, taxonomy, biogeographic repartition, statuses and
interactions of species. See the API documentation
[here](https://taxref.mnhn.fr/taxref-web/api/doc).

This project is still under development (especially the documentation)
but most functions should work out of the box. Please do use the [issue
tracker](https://github.com/Rekyt/rtaxref/issues) for any bug report,
suggestion, or idea.

## Installation

`rtaxref` is not yet on CRAN. However, you can install the development
version of `rtaxref` from GitHub with:

``` r
# install.packages("remotes")
remotes::install_github("Rekyt/rtaxref")
```

## Citation

`rtaxref` contains functions to retrieve data from TAXREF-Hub. The
access data is released under the [Creative Commons
Attribution-ShareAlike 3.0 (CC BY-SA 3.0)
license](https://creativecommons.org/licenses/by-sa/3.0/). A suggestion
of citation is included in `rtaxref` via `citation("rtaxref")`.

``` r
citation("rtaxref")
#> To cite this package in publications, please use:
#> 
#>   Grenié M, Gruson H (2025). _rtaxref: An R Client for TAXREF the
#>   French Taxonomical Reference API_. R package version 0.1.0,
#>   <https://github.com/Rekyt/rtaxref>.
#> 
#> Please also cite the data provider:
#> 
#>   TAXTREF (2025). Data released under the Creative Commons
#>   Attribution-ShareAlike 3.0 (CC BY-SA 3.0) license,
#>   <https://taxref.mnhn.fr/taxref-web/accueil>.
#> 
#> To see these entries in BibTeX format, use 'print(<citation>,
#> bibtex=TRUE)', 'toBibtex(.)', or set
#> 'options(citation.bibtex.max=999)'.
```

## Usage

To avoid collisions with other packages all `rtaxref` functions are
prefixed with `rt_*()`, for example `rt_taxa_id()` lets you access to
the information about a taxon using its unique id (also called `cdNom`
in TAXREF):

``` r
library("rtaxref")

rt_taxa_id(id = 101027)
#> # A tibble: 1 × 46
#>       id referenceId parentId scientificName    authority fullName  fullNameHtml
#>    <int>       <int>    <int> <chr>             <chr>     <chr>     <chr>       
#> 1 101027      101027   193133 Helianthus annuus L., 1753  Helianth… <i>Helianth…
#> # … with 39 more variables: rankId <chr>, rankName <chr>, referenceName <chr>,
#> #   referenceNameHtml <chr>, frenchVernacularName <chr>,
#> #   englishVernacularName <chr>, genusName <chr>, familyName <chr>,
#> #   orderName <chr>, className <chr>, phylumName <lgl>, kingdomName <chr>,
#> #   vernacularGenusName <lgl>, vernacularFamilyName <lgl>,
#> #   vernacularOrderName <lgl>, vernacularClassName <chr>,
#> #   vernacularPhylumName <lgl>, vernacularKingdomName <chr>, …
```

You get information about the taxon related to taxonomy, the referance
name, vernacular names as well as distribution information.

`rt_taxa_search()` let’s you search a taxon with different criteria:

``` r
rt_taxa_search(sciname = "Helianthus annuus")
#> # A tibble: 9 × 62
#>       id referenceId parentId scientificName     authority fullName fullNameHtml
#>    <int>       <int>    <int> <chr>              <chr>     <chr>    <chr>       
#> 1 773546      101027       NA Helianthus annuus… Heiser, … Heliant… <i>Helianth…
#> 2 772409      101027       NA Helianthus annuus… (Douglas… Heliant… <i>Helianth…
#> 3 613531      613531   101027 Helianthus annuus… L., 1753  Heliant… <i>Helianth…
#> 4 613530      613530   101027 Helianthus annuus… (DC.) Co… Heliant… <i>Helianth…
#> 5 101027      101027   193133 Helianthus annuus  L., 1753  Heliant… <i>Helianth…
#> 6 135249      101027       NA Helianthus annuus… L., 1753  Heliant… <i>Helianth…
#> 7 773544      101027       NA Helianthus annuus… (Heiser)… Heliant… <i>Helianth…
#> 8 773545      101027       NA Helianthus annuus… (Douglas… Heliant… <i>Helianth…
#> 9 621487      613530       NA Helianthus annuus… Thell.    Heliant… <i>Helianth…
#> # … with 55 more variables: rankId <chr>, rankName <chr>, referenceName <chr>,
#> #   referenceNameHtml <chr>, frenchVernacularName <chr>,
#> #   englishVernacularName <chr>, genusName <chr>, familyName <chr>,
#> #   orderName <chr>, className <chr>, phylumName <lgl>, kingdomName <chr>,
#> #   vernacularGenusName <lgl>, vernacularFamilyName <lgl>,
#> #   vernacularOrderName <lgl>, vernacularClassName <chr>,
#> #   vernacularPhylumName <lgl>, vernacularKingdomName <chr>, …
```

You a full list of functions included in `rtaxref` by going to the
[`rtaxref` website](https://rekyt.github.io/rtaxref).

## Code of Conduct

Please note that the ‘rtaxref’ project is released with a [Contributor
Code of Conduct](CODE_OF_CONDUCT.md). By contributing to this project,
you agree to abide by its terms.

## Related projects

Other packages lets you work with taxonomical information from relevant
databases:

- [`taxize`](https://github.com/ropensci/taxize) let’s you work with
  many databases as well as clean a list of taxon names,
- [`ritis`](https://github.com/ropensci/ritis) a client for another
  taxonomic database,
- [`taxa`](https://github.com/ropensci/taxa) a package that proposes a
  reference class for taxonomic information (maybe used by `rtaxref` in
  the future),
- [CRAN taxonomy Task View](https://github.com/ropensci/taxonomy)
  references many related packages that are used to work with taxonomic
  information.
