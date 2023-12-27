formulario <- readr::read_rds("formulario.rds")


nomes_sugeridos <- formulario |>
  dplyr::distinct(quer_indicar_alguem_para_palestrar) |> 
  dplyr::pull(quer_indicar_alguem_para_palestrar)

nomes_sugeridos |> 
  writeLines()
